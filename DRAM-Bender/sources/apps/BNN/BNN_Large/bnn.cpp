#include "instruction.h"
#include "prog.h"
#include "platform.h"
#include <fstream>
#include <iostream>
#include <sstream>
#include <boost/filesystem.hpp>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <cstring>
#include <cstdint>
#include <string>
#include <list>
#include <vector>
#include <deque>
#include <cstdlib>
#include <bitset>
#include <math.h> 
#include <iomanip>
#include "../util.h"
#include <random>
using namespace std;

enum OperandType {
    OPERAND_A = 0,
    OPERAND_B = 1,
    OPERAND_C = 2,
    OPERANDS  = 3
};

#define NUM_BANKS 1
#define NUM_ROWS 2048 //32768
#define NUM_COLS 1024

// Stride register ids are fixed and should not be changed
// CASR should always be reg 0
// BASR should always be reg 1
// RASR should always be reg 2
#define CASR 0
#define BASR 1
#define RASR 2
#define LOOP_BANKS 3
#define CAR 4
#define LOOP_ROWS 5
#define RAR 6
#define BAR 7
#define NUM_ROWS_REG 8
#define ITER_REG 9
#define RF_REG 10
#define NUM_BANKS_REG 11
#define PATTERN_REG 12 
#define LOOP_COLS 13 //R3_REG
#define NUM_COLS_REG 14
#define LOOP_ITER 15

// Patterns
#define ZERO 0x00000000   // zeroes
#define ONE 0xFFFFFFFF    // ones
#define DAMKA 0xAAAAAAAA  // 10101010...
#define DAMKA_BAR 0x55555555 // 0101010...

//// Module specific parameters:
// R1, R2 to peform MAJ3
#define COMP_R1 408
#define COMP_R2 665
// Row copy timing parameters
#define ROW_COPY_T12 10
#define ROW_COPY_T23 1
// MAJ3 timing parameters
#define MAJ_T12 1
#define MAJ_T23 0

// ACT and PRE array for VAMPIRE
struct Command {// Struct to store the commands and their timing -> [Timing, "PRE\ACT",bank_id, row_id]
  int timing;
  std::string name;
  uint32_t bank;
  bool has_value;
  unsigned int value;
};

// sperate traces for copy and maj, as each has different timing patameters
std::vector<Command> act_pre_copy;
std::vector<Command> act_pre_maj;

int ceil_div(int a, int b) {
  return (a + b - 1) / b;
}

Program _init(uint32_t bank_id)
{
  Program program;
  program.add_inst(SMC_LI(NUM_ROWS, NUM_ROWS_REG));   // load NUM_ROWS into NUM_ROWS_REG
  program.add_inst(SMC_LI(NUM_BANKS, NUM_BANKS_REG)); // load NUM_BANKS into NUM_BANKS_REG
  program.add_inst(SMC_LI(8, CASR));                  // Load 8 into CASR since each READ reads 8 columns
  program.add_inst(SMC_LI(1, BASR));                  // Load 1 into BASR
  program.add_inst(SMC_LI(1, RASR));                  // Load 1 into RASR
  program.add_inst(SMC_LI(128, NUM_COLS_REG));        // Load COL_SIZE register
  program.add_inst(SMC_LI(bank_id, BAR));
  return program;
}

Program row_copy(uint32_t r_first, uint32_t r_second,uint32_t bank_id, int &timings_copy, bool trace_power = false)
{
  // Make sure r_first, r_second really can participate in row copy
  // (maybe no rows, or more than 2 rows will open!)
  // Assumes bank is precharged!
  Program program;

  // Copy from r_first into r_second
  if (trace_power){
    act_pre_copy.push_back({timings_copy, "ACT", bank_id, true, r_first});
    timings_copy += ROW_COPY_T12 + 1; // t12 = 30 cycles (its starts from 0 and ROW_COPY_T12 = 30) 
    act_pre_copy.push_back({timings_copy, "PRE", bank_id, false, 0});
    timings_copy += ROW_COPY_T23 + 1; // t23 = 2 cycle (its starts from 0 and ROW_COPY_T23 = 1)
    act_pre_copy.push_back({timings_copy, "ACT", bank_id, true, r_second});
    timings_copy += 1; // t23 = 2 cycle (its starts from 0 and ROW_COPY_T23 = 1)
  }
  program.add_below(doubleACT(ROW_COPY_T12, ROW_COPY_T23, r_first, r_second));

  // Wait tRAS (21 cycles in our DIMM) for settle (ACT PRE ACT has some DRAM NOPS at the end)
  program.add_inst(SMC_SLEEP_timing(5, timings_copy));

  // Precharge
  if (trace_power) {
    act_pre_copy.push_back({timings_copy, "PRE", bank_id, false, 0});
  }
  program.add_below(PRE_timing(BAR, 0, 0, timings_copy));

  return program;
}

Program maj3(uint32_t bank_id, int &timings_maj, bool trace_power = false)
{
  // Make sure r_first, r_second really can participate in row copy
  // (maybe no rows, or more than 2 rows will open!)
  // Assumes bank is precharged!
  Program program;

  // Open many rows for MAJ
  if (trace_power) {
    act_pre_maj.push_back({timings_maj, "ACT", bank_id, true, COMP_R1});
    timings_maj += MAJ_T12+1; // t12 = 2 cycles (its starts from 0 and MAJ_T12 = 1)
    act_pre_maj.push_back({timings_maj, "PRE", bank_id, false, 0});
    timings_maj += MAJ_T23+1; // t23 = 1 cycle (its starts from 0 and MAJ_T23 = 0)
    act_pre_maj.push_back({timings_maj, "ACT", bank_id, true, COMP_R2});
    timings_maj += 1; // for ACT
  }
  program.add_below(doubleACT(MAJ_T12, MAJ_T23, COMP_R1, COMP_R2));

  // Wait tRAS (21 cycles in our DIMM) for settle (ACT PRE ACT has some DRAM NOPS at the end)
  program.add_inst(SMC_SLEEP_timing(5, timings_maj));

  // Precharge
  if (trace_power) {
    act_pre_maj.push_back({timings_maj, "PRE", bank_id, false, 0});
  }
  program.add_below(PRE_timing(BAR, 0, 0, timings_maj));
  return program;
}

// Calculate a vector*vector (64K batch) binary matrix multiplication
Program bnn_prog(
  uint32_t bank_id, std::vector<std::vector<uint32_t>> &x_in, /*inputs, expected dims are in_dim x 16 (i.e. 512 activations transposed)*/
  std::vector<uint32_t> &weights, /*weight matrix of dims output_dim x in_dim */ /* TODO - change to vector only (?)*/ 
  const std::vector<std::vector<uint32_t>> data_to_operand[OPERANDS], /*a trace of rows from each data row to fill each operand*/
  int &num_reads, /*indicate amount of red rows */
  std::deque<uint32_t> &padding_in, /*padding - pad values in case input is not power of 3. Pad values are shared for entire batch*/
  bool skip_comp = false, /*skip compute. a flag for measuring baseline time - PCIe + Write + Read*/
  bool trace_power = false /*trace power. a flag for tracing dram comds for measuring power consumption*/)
{
  // Keep track of amount of row reads
  num_reads = 0;
  // Keep track of timing in trace (a pointer on where in time to put the next command)
  int timings_copy = 0;
  int timings_maj = 0;

  Program program;
  program.add_below(_init(bank_id));

  // Initialize the random number generator
  srand((unsigned) time(NULL));
  int random = rand();

  // "Memory" offsets for the data rows
  const int one_idx = 2*x_in.size(); 
  const int zero_idx = one_idx + 1; 
  const int input_size = x_in.size(); // x_in is given as x and x_bar
  const int aside_offset = zero_idx + 1;   // aside rows start after the x_in rows | 2 padding rows

  // Probably not needed, but just in case
  program.add_inst(all_nops());

  // --------------------- Step 0 ---------------------

  // 0. Fill input-layer data into the data rows
  for(int i = 0; i < x_in.size(); i++)
  {
    random = rand();
    program.add_below(wrRow_512_label(BAR, data_to_operand[OPERAND_A][2*i][0], x_in[i],random));
    random = rand();
    program.add_below(wrRow_512_negate_label(BAR, data_to_operand[OPERAND_A][2*i+1][0], x_in[i],random));
  }
  // random = rand();
  // program.add_below(rdRow_immediate_label(BAR, data_to_operand[OPERAND_A][0][0], random)); 
  // num_reads++;
  // random = rand();
  // program.add_below(rdRow_immediate_label(BAR, data_to_operand[OPERAND_A][2*x_in.size()-1][0], random)); 
  // num_reads++;

  // Write 2 rows for padding 1 is 0's and the other is 1's
  random = rand();
  program.add_below(wrRow_immediate_label(BAR, data_to_operand[OPERAND_A][one_idx][0], ONE,random)); //  (bank_reg, row_immd, wr_pattern, label)
  random = rand();
  program.add_below(wrRow_immediate_label(BAR, data_to_operand[OPERAND_A][zero_idx][0], ZERO,random)); //  (bank_reg, row_immd, wr_pattern, label)

  if (skip_comp == false) {
    // PRECHARGE - as all OPs are assuming precharge before starting
    if (trace_power) {
      act_pre_copy.push_back({timings_copy, "PRE", bank_id, false, 0});
    }
    program.add_below(PRE_timing(BAR, 0, 0, timings_copy));
    // TODO - a lot of repetive code between sstep 1 and step 2. Think of refactor
    // --------------------- Step 1 ---------------------
    // 1. XNOR and COPY into MAJ3
    for (int col_i = 0; col_i < input_size; col_i++)
    { 
      // XNOR by taking x or x_bar based on the W value
      int x_in_index;
      if (weights[col_i] == 1) {
        x_in_index = col_i*2;
      } else {
        x_in_index =  col_i*2 + 1;
      }
      int operand_idx = col_i % 3; // Choose the operand based on the column index (A,B,C) in the computation rows
      // ============ Hop through the data rows to copy the data to the computation rows ============
      for (size_t hop = 0; hop < data_to_operand[operand_idx][x_in_index].size() - 1; hop++) 
      {
        program.add_below(row_copy(data_to_operand[operand_idx][x_in_index][hop], data_to_operand[operand_idx][x_in_index][hop+1],bank_id , timings_copy , trace_power));
      }
      // ============ MAJ3 operation + save aside - once in 3 ============
      if (operand_idx == 2) // Filled 3 rows, oerform MAJ and save aside
      {
        program.add_below(maj3(bank_id ,timings_maj, trace_power));
        int aside_row_i = aside_offset + (col_i / 3); // aside row index
        // Copy the result of the MAJ3 operation to the aside row
        // Can start from 2nd last row in trace, as both are in the computation rows. After MAJ3 the have the same value.
        for (size_t hop = data_to_operand[OPERAND_A][aside_row_i].size() - 2; hop > 0; hop--)
        {
          program.add_below(row_copy(data_to_operand[OPERAND_A][aside_row_i][hop], data_to_operand[OPERAND_A][aside_row_i][hop-1],bank_id ,timings_copy, trace_power));
        }
      }
    }

    // Padding the aside rows to be multiple of 3
    for (int pad = 0; pad < (3 - input_size % 3) % 3; pad++)
    {
      int pad_row_idx = padding_in.front() == 1 ? one_idx : zero_idx;
      padding_in.pop_front();
      int operand_idx = (input_size + pad) % 3;
      for (size_t hop = 0; hop < data_to_operand[operand_idx][pad_row_idx].size() - 1; hop++) 
      {
        program.add_below(row_copy(data_to_operand[operand_idx][pad_row_idx][hop], data_to_operand[operand_idx][pad_row_idx][hop+1],bank_id ,timings_copy, trace_power));
      }
      if (operand_idx == 2) 
      {
        program.add_below(maj3(bank_id ,timings_maj, trace_power));
        int aside_result_row_i = aside_offset + (input_size / 3); 
        for (size_t hop = data_to_operand[OPERAND_A][aside_result_row_i].size() - 2; hop > 0; hop--) {
          program.add_below(row_copy(data_to_operand[OPERAND_A][aside_result_row_i][hop], data_to_operand[OPERAND_A][aside_result_row_i][hop-1],bank_id ,timings_copy, trace_power));
        }
      }
    }

    // read out the aside rows for debug:
    /*
    for (size_t i = 0; i < ceil_div(input_size, 3); i++) // We run (x_in.size()/3) times 
    { 
      random = rand();
      program.add_below(rdRow_immediate_label(BAR, data_to_operand[OPERAND_A][aside_offset+i][0], random));
      num_reads++;
    }
    */

    // --------------------- Step 2 ---------------------
    // 2. Iterate MAJ3(MAJ3) until aside is exhausted
    int aside_size = ceil_div(input_size, 3); // aside size is 1/3 of the input size
    while (aside_size != 1) 
    {
      // std::cout << "aside_size =  " << aside_size << std::endl;
      for (int i = 0; i < aside_size; i++) // We through the aside rows
      {
        int operand_idx = i % 3;
        int aside_idx = aside_offset + i;
        // Copy the data from the aside rows to the computation rows
        for (size_t hop = 0; hop < data_to_operand[operand_idx][aside_idx].size() - 1; hop++)
        {
          program.add_below(row_copy(data_to_operand[operand_idx][aside_idx][hop], data_to_operand[operand_idx][aside_idx][hop+1],bank_id ,timings_copy, trace_power));
        }

        // MAJ3 operation + save from computation to aside rows - once in 3
        if (operand_idx == 2) 
        {
          program.add_below(maj3(bank_id ,timings_maj, trace_power));
          int aside_result_row_i = aside_offset + (i / 3); 
          // Can start from 2nd last row in trace, as both are in the computation rows. After MAJ3 the have the same value.
          for (size_t hop = data_to_operand[OPERAND_A][aside_result_row_i].size() - 2; hop > 0; hop--) {
            program.add_below(row_copy(data_to_operand[OPERAND_A][aside_result_row_i][hop], data_to_operand[OPERAND_A][aside_result_row_i][hop-1],bank_id ,timings_copy, trace_power));
          }
        }
      }

      // Padding the aside rows to be multiple of 3
      for (int pad = 0; pad < (3 - aside_size % 3) % 3; pad++)
      {
        int pad_row_idx = padding_in.front() == 1 ? one_idx : zero_idx;
        padding_in.pop_front();
        int operand_idx = (aside_size + pad) % 3;
        for (size_t hop = 0; hop < data_to_operand[operand_idx][pad_row_idx].size() - 1; hop++) 
        {
          program.add_below(row_copy(data_to_operand[operand_idx][pad_row_idx][hop], data_to_operand[operand_idx][pad_row_idx][hop+1],bank_id ,timings_copy, trace_power));
        }
        // MAJ3 operation + save from computation to aside rows - once in 3
        if (operand_idx == 2) 
        {
          program.add_below(maj3(bank_id ,timings_maj, trace_power));
          int aside_result_row_i = aside_offset + (aside_size / 3); // If we have input_size of 9 we have 3 aside rows, for input_size of 8 we have 3 aside rows
          // std::cout << "aside_result_row_i =  " << aside_result_row_i << std::endl;
          for (size_t hop = data_to_operand[OPERAND_A][aside_result_row_i].size() - 2; hop > 0; hop--) {
            program.add_below(row_copy(data_to_operand[OPERAND_A][aside_result_row_i][hop], data_to_operand[OPERAND_A][aside_result_row_i][hop-1],bank_id ,timings_copy, trace_power));
          }
        }
      }
      aside_size = ceil_div(aside_size, 3); // aside size gets smaller times 3 each iteration of while loop

      // read out the aside rows for debug:
      /*
      for (size_t i = 0; i < aside_size; i++)
      {
        random = rand();
        program.add_below(rdRow_immediate_label(BAR, data_to_operand[OPERAND_A][aside_offset+i][0], random)); 
        num_reads++;
      }
      */
    }
  }

  // Read out the result (from aside row 0) - output neuron:
  random = rand();
  program.add_below(rdRow_immediate_label(BAR, data_to_operand[OPERAND_A][aside_offset][0], random));
  num_reads++;

  // Extra buffer time to be sure
  program.add_inst(SMC_SLEEP(3));

  program.add_inst(SMC_END());
  return program;
}

// Store file data as vector
void parse_file(std::string file_name, std::vector<uint32_t> &vec)
{
  std::ifstream file;
  file.open(file_name, std::ios::app);
  std::string line;
  while (std::getline(file, line))
  {
    vec.push_back(stol(line));
  }
  file.close();
}

// Store file data as queu (FIFO) - useful for pads
void parse_file_fifo(const std::string& file_name, std::deque<uint32_t>& dq)
{
    std::ifstream file;
    file.open(file_name, std::ios::app);
    std::string line;

    while (std::getline(file, line))
    {
        dq.push_back(stol(line));  // Use stoul for unsigned integers
    }
    file.close();
}

void parse_matrix(const std::string& file_name, std::vector<std::vector<uint32_t>> &matrix) {
  std::ifstream file(file_name);
  std::string line;
  while (std::getline(file, line)) {
      std::vector<uint32_t> row;
      std::stringstream ss(line);
      std::string cell;
      while (std::getline(ss, cell, ',')) { // Splitting by comma
          row.push_back(std::stol(cell)); // Convert to unsigned integer
      }
      matrix.push_back(row);
  }
  file.close();
}

// Duplicate and Flip bits
std::vector<std::vector<uint32_t>> augment_flip(const std::vector<std::vector<int>> &x_in, int n_duplicated = 32, double flip_prob = 0.35)
{
  const int rows = x_in.size();    // Number of rows
  const int cols = x_in[0].size(); // Number of columns 
  
  // Random number generator
  std::mt19937 gen(0); // Seed is 0
  std::bernoulli_distribution flip_dist(flip_prob); // Bernoulli distribution for flipping bits

  // Duplicate and flip bits
  std::vector<std::vector<int>> expanded(rows, std::vector<int>(cols * n_duplicated)); // 16x32 = 512

  // Go over each element in the input matrix and duplicate and flip the bits
  for (int c = 0; c < cols; ++c) {
    for (int d = 0; d < n_duplicated; ++d) {
      for (int r = 0; r < rows; ++r) {
        int bit = x_in[r][c];
        if (flip_dist(gen)) {
          bit ^= 1; // Flip the bit
        }
        expanded[r][c * n_duplicated + d] = bit;
      }
    }
  }
  
  // Group each 32-bits slice into a uint32_t
  std::vector<std::vector<uint32_t>> x_augmented(rows, std::vector<uint32_t>(cols));

  for (int r = 0; r < rows; ++r) {
    for (int c = 0; c < cols; ++c) {
      uint32_t value = 0;
      for (int d = 0; d < n_duplicated; ++d) {
        value |= expanded[r][c * n_duplicated + d] << d;  // Shift value left by 1 and append the next bit from the expanded matrix (constructing 32-bit number bit-by-bit)
      }
      x_augmented[r][c] = value;
    }
  }

  return x_augmented;
}

void save_matrix(const std::string& file_name, std::vector<std::vector<uint32_t>> &matrix) {
  std::ofstream file(file_name);
  if (!file.is_open()) {
      std::cerr << "Error: Could not open file " << file_name << " for writing.\n";
      return;
  }

  for (const auto&row : matrix) {
      for (size_t i = 0; i < row.size(); ++i) {
          file << row[i];
          if (i < row.size() - 1) {
              file << ",";
          }
      }
      file << "\n";
  }
  file.close();
  std::cout << "Done! Output saved to " << file_name << "\n";
}

void save_pre_act(const std::string& file_name, const std::vector<Command> &matrix) {
  std::ofstream file(file_name);
  if (!file.is_open()) {
      std::cerr << "Error: Could not open file " << file_name << " for writing.\n";
      return;
  }

  for (const auto& row : matrix) {
      file << row.timing << ",";      // add timing
      file << row.name << ",";        // command type (e.g., PRE or ACT)
      file << row.bank;               // add bank ID
      if (row.has_value) {
          file << "," << row.value;
      }
      file << "\n";
  }

  file.close();
  std::cout << "Done! Output saved to " << file_name << "\n";
}

// parse data to operand trajectory file and create the relevant data structure
void parse_path_map(const std::string& filename, std::vector<std::vector<uint32_t>> data_to_operand[OPERANDS]) {
  std::ifstream infile(filename);
  if (!infile.is_open()) {
      std::cerr << "Failed to open file: " << filename << std::endl;
      return;
  }

  std::string line;
  int line_num = 0;
  while (std::getline(infile, line)) {
      std::istringstream ss(line);
      std::string token;
      std::vector<uint32_t> values;

      while (std::getline(ss, token, ',')) {
          values.push_back(static_cast<uint32_t>(std::stoul(token)));
      }

      int operand_index = line_num % OPERANDS;
      data_to_operand[operand_index].push_back(values);
      ++line_num;
  }

  infile.close();
}

void save_classification(const std::string& file_name, const std::vector<int> &classifications) {
  std::ofstream file(file_name);
  if (!file.is_open()) {
      std::cerr << "Error: Could not open file " << file_name << " for writing.\n";
      return;
  }

  for (const auto& classification : classifications) {
      file << classification << ",";      // add timing
  }
  file << "\n";
}

int read_args_n_parse(int argc, char* argv[], uint32_t &bank_id, bool &skip_comp, bool &trace_power, bool &dll, uint32_t &runs)
{
  if(argc != 6)
  {
    printf("Usage: \n ./bnn <bank_id> <skip_comp> <trace_power> <dll> <runs>\n");
    return(0); 
  }

  int arg_i = 1;
  bank_id      =  atoi(argv[arg_i++]);
  skip_comp    = atoi(argv[arg_i++]) != 0;
  trace_power  = atoi(argv[arg_i++]) != 0;
  dll          = atoi(argv[arg_i++]) != 0;
  runs         = atoi(argv[arg_i++]);

  return 1;
}

void to_time(SoftMCPlatform& platform, Program& program, int num_reads, uint8_t row[8192])
{
  platform.activate();
  platform.receiveData((void*)row, 8192);
}

void post(SoftMCPlatform& platform, int num_reads, std::ofstream &out_file)
{
  // platform.receiveData((void*)single_bus, amount);
  //  std::cout << "DEBUG: program size is " << (program.size() / 8) << std::endl;

    // Read out data
    uint8_t row[8192];
    // Retrieve 8192 bytes from the FPGA buffer (which is filled with content read from DRAM
    for (int i = 0; i < num_reads; i++)
    {
      platform.receiveData((void*)row, 8192);
      std::cout << "Check 1 " << std::endl;
      for (int j = 0; j < 64 / 4; j++)
      { // 64 bytes = 512 bits = 16 32-bit integers
      std::cout << "Check 2 " << std::endl;
        uint32_t result_32b = row[j*4] | (row[j*4+1] << 8) | (row[j*4+2] << 16) | (row[j*4+3] << 24);
        int ones_count = __builtin_popcount(result_32b); // Count the number of 1's in the 32-bit integer | GCC - Clang built-in function
        out_file << ones_count << std::endl;
      }
    }
    out_file.close();
}

// Simulates how the bits are recieved in the input layer - packed into bytes
std::vector<std::vector<uint8_t>> packBitsToBytes(const std::vector<std::vector<uint32_t>>& x) {
  std::vector<std::vector<uint8_t>> packed;

  for (const auto& row : x) {
      std::vector<uint8_t> packedRow;
      for (size_t i = 0; i < row.size(); i += 8) {
          uint8_t byte = 0;
          for (size_t bit = 0; bit < 8 && i + bit < row.size(); ++bit) {
              byte |= (row[i + bit] & 1) << (7 - bit); // pack MSB first
          }
          packedRow.push_back(byte);
      }
      packed.push_back(packedRow);
  }

  return packed;
}

std::vector<std::vector<uint32_t>> packBitsToUint(const std::vector<std::vector<uint32_t>>& x) {
  std::vector<std::vector<uint32_t>> packed;

  for (const auto& row : x) {
      std::vector<uint32_t> packedRow;
      for (size_t i = 0; i < row.size(); i += 32) {
          uint32_t uint = 0;
          for (size_t bit = 0; bit < 32 && i + bit < row.size(); ++bit) {
            uint |= (row[i + bit] & 1) << (31 - bit); // pack MSB first
          }
          packedRow.push_back(uint);
      }
      packed.push_back(packedRow);
  }

  return packed;
}

inline uint32_t xorshift32(uint32_t& state) {
  // Fast PRNG: state must not be zero
  state ^= state << 13;
  state ^= state >> 17;
  state ^= state << 5;
  return state;
}

std::vector<uint32_t> performant_augment_x (const std::vector<uint8_t>& x) {
  // duplication x32 and flipping with 35% probability are hardcoded intp code
  const size_t totalBits = x.size() * 8;
  std::vector<uint32_t> result;
  result.reserve(totalBits);

  uint32_t rng_state = 0x12345678; // Seed value, can be anything non-zero

  for (uint8_t byte : x) {
      for (int i = 7; i >= 0; --i) {
          uint32_t bit = (byte >> i) & 1;
          // Replicate bit across all 32 bits (0 -> 0x00000000, 1 -> 0xFFFFFFFF)
          uint32_t replicated = -bit;
          // Generate mask: each bit is 1 with ~35% probability
          // Instead of testing 32 times, generate 1 random uint32 and threshold it
          uint32_t mask = 0;
          for (int j = 0; j < 32; j += 8) {
              uint32_t r = xorshift32(rng_state);
              for (int k = 0; k < 8; ++k) {
                  // 35% chance for each bit
                  mask |= (((r >> (k * 4)) & 0xF) < 6) << (j + k); // 6/16 ~ 37.5%
              }
          }
          result.push_back(replicated ^ mask);
          // result.push_back(replicated);
      }
  }
  return result;
}

std::vector<std::vector<uint32_t>> performant_augment_x_vector(const std::vector<std::vector<uint8_t>>& x) {
  std::vector<std::vector<uint32_t>> result;
  result.reserve(x.size());
  for (const auto& row : x) {
      result.push_back(performant_augment_x(row));
  }
  return result;
}

int main(int argc, char*argv[])
{
  SoftMCPlatform platform;
  int err;
  uint32_t bank_id;
  bool skip_comp;
  bool trace_power;
  bool dll;
  uint32_t runs;

  // Handle input arguments
  if(!read_args_n_parse(argc, argv, bank_id, skip_comp, trace_power, dll, runs))
    exit(0);

  if ((err = platform.init()) != SOFTMC_SUCCESS)
  {
    cerr << "Could not initialize SoftMC Platform: " << err << endl;
  }
  platform.reset_fpga();

  std::cout << "------------DEBUG------------" << std::endl;
  std::cout << "bank_id: " << bank_id << std::endl;
  std::cout << "skip_comp: " << skip_comp << std::endl;
  std::cout << "trace_power: " << trace_power << std::endl;
  std::cout << "runs: " << runs << std::endl;

  // Handle input files (hardcoded paths)
  std::vector<std::vector<uint32_t>> weights_matrix; // weights matrix. binary format
  std::vector<std::vector<uint32_t>> x_in; // input activations, binary format (expects 16 different activation vectors, transposed)
  std::deque<uint32_t> padding_in; // padding values, feeder's responsibilty to make sure there are enough values
  std::vector<std::vector<uint32_t>> data_to_operand[OPERANDS]; // holds trajectories of the data rows to the operands

  // For bnn_ly.py
  parse_matrix("./input.txt", x_in); // Read matrix of 0's and 1's Input Size x 16
  std::vector<std::vector<uint8_t>> x_in_packed = packBitsToBytes(x_in); // now packed to bytes (like it is supposed to be recieved from DRAM)
  std::vector<std::vector<uint32_t>> x_in_packed_32 = packBitsToUint(x_in); // now packed to uint32_t (like it is supposed to be sent to bnn_prog)
  parse_matrix("./weights_matrix.txt", weights_matrix); // Read matrix of 0's and 1's Input Size x Output Size
  // save_matrix("augmented_input.txt", x_augmented);

  parse_path_map("./data_to_operand.txt", data_to_operand); // Read from the single file
  parse_file_fifo("./padding.txt", padding_in); // Read from the single file

  std::ofstream output_layer("./cpp_output/output.txt");
  
  int num_reads;

std::chrono::high_resolution_clock::time_point start, end;

std::vector<double> dram_timings_us;
std::vector<double> cpu_classification_us;
std::vector<double> cpu_augmentation_us;

uint8_t row[8192];

for (size_t run = 0; run < runs; run++) {
  // X in (augmented)
  start = std::chrono::high_resolution_clock::now();
  if (dll) { // If augemnt - create augmentation. Else, use the original input
    x_in_packed_32 = performant_augment_x_vector(x_in_packed);
  }
  end = std::chrono::high_resolution_clock::now();
  std::chrono::duration<double, std::micro> elapsed_augmentation = end - start;
  cpu_augmentation_us.push_back(elapsed_augmentation.count());

  // store maximum popcount value + argmax (for classification)
  // We assume strictly 16 different inputs for now
  std::vector<int> max_values(65536 / 32, 0); // 16 values
  std::vector<int> argmax(65536 / 32, 0); // 16 values

  // Repeat for each row of W
  for (size_t i = 0; i < weights_matrix.size(); i++)
  {
    platform.reset_fpga();
    std::deque<uint32_t> padding_in_temp = padding_in;
    bool trace_power_i = trace_power && (i == 0); // Only trace power for the first run
    Program program = bnn_prog(bank_id, x_in_packed_32, weights_matrix[i], data_to_operand, num_reads, padding_in_temp, skip_comp, trace_power_i);
    platform.send_prog(program);

    // Program execution (+PCIe, write, read)
    start = std::chrono::high_resolution_clock::now();
    platform.activate();
    platform.receiveData((void*)row, 8192);
    end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::micro> elapsed_dram = end - start;
    dram_timings_us.push_back(elapsed_dram.count());

    // Classification
    start = std::chrono::high_resolution_clock::now();
    if (dll)
    {
      for (int j = 0; j < 65536 / 32; j++) { // 8192 bytes = 65536 bits = 2048 32-bit integers
        uint32_t result_32b = row[j*4] | (row[j*4+1] << 8) | (row[j*4+2] << 16) | (row[j*4+3] << 24);
        int ones_count = __builtin_popcount(result_32b); // Count the number of 1's in the 32-bit integer | GCC - Clang built-in function
        // Find the maximux value in popcount and print it
        if (ones_count > max_values[j]) {
          max_values[j] = ones_count;
          argmax[j] = i;
        }
      }
    }
    end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::micro> elapsed_classification = end - start;
    cpu_classification_us.push_back(elapsed_classification.count());

    // Save output layer:
    for (size_t byte = 0; byte < 8192; byte+=4) { // 8192 bytes = 65536 bits
      for (size_t in_byte = 0; in_byte < 4; in_byte++)
      {
        for (int bit = 7; bit > -1; bit--) {
          output_layer << uint32_t((row[byte + 3 - in_byte] >> bit) & 1) << " ";
        }
      }
    }
    output_layer << "\n";
  }

  save_classification("./cpp_output/classification.txt", argmax); // Save classification results
}

  if(trace_power) {
    // Output command trace
    std::cout << "Size of act_pre_copy = " << act_pre_copy.size() << "\n";
    std::cout << "Size of act_pre_maj = " << act_pre_maj.size() << "\n";

    save_pre_act("./cpp_output/trace_pre_act_copy.txt", act_pre_copy);
    save_pre_act("./cpp_output/trace_pre_act_maj.txt", act_pre_maj);
  }

  // Output time benchmark data
  // Calculate average
  double sum_dram = std::accumulate(dram_timings_us.begin(), dram_timings_us.end(), 0.0);
  double avg_dram = sum_dram / dram_timings_us.size();
  double sum_aug = std::accumulate(cpu_augmentation_us.begin(), cpu_augmentation_us.end(), 0.0);
  double avg_aug = sum_aug / cpu_augmentation_us.size();
  double sum_class = std::accumulate(cpu_classification_us.begin(), cpu_classification_us.end(), 0.0);
  double avg_class = sum_class / cpu_classification_us.size();


  // Optionally calculate stddev
  // double sq_sum = std::inner_product(timings_ms.begin(), timings_ms.end(), timings_ms.begin(), 0.0);
  // double stddev = std::sqrt(sq_sum / runs - avg * avg);

  // std::cout << "Average time dram: " << avg_dram << " us" << endl;
  // std::cout << "Average time class: " << avg_class << " us" << endl;
  // std::cout << "Average time aug: " << avg_aug << " us" << endl;
  // std::cout << "Standard deviation: " << stddev << " ms\n";

  std::ofstream benchmark_file("./cpp_output/benchmark.txt");
  if (!benchmark_file.is_open()) {
      std::cerr << "Error: Could not open file " << "./cpp_output/benchmark.txt" << " for writing.\n";
  } else {
    benchmark_file << "DRAM (all program): " << avg_dram << " us" << endl;
    benchmark_file << "Classification (per class): " << avg_class << " us" << endl;
    benchmark_file << "Augmentation (per in_dim x 16 inputs): " << avg_aug << " us" << endl;
  }

return 0;

}