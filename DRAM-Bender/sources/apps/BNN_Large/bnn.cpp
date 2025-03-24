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
#include "util.h"
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

// Functional computation rows
#define COMP_R1 408
#define COMP_R2 665
#define COMP_ROW_A1 152
#define COMP_ROW_A2 408
#define COMP_ROW_B1 153
#define COMP_ROW_B2 409
#define COMP_ROW_C1 664
#define COMP_ROW_C2 665

// Routing rows
#define ROUT_ROW_0 24
#define ROUT_ROW_1 25
#define ROUT_ROW_2 536

// Data rows - all conected currently to ROUT_ROW_0
#define X0 0
#define X0_NOT 8
#define X1 16
#define X1_NOT 26
#define X2 28
#define X2_NOT 30
#define ASIDE_0 32
#define ASIDE_1 40
#define ASIDE_2 48

#define ROW_COPY_T12 30
#define ROW_COPY_T23 1

#define MAJ_T12 1
#define MAJ_T23 0

#define HYTT_TIMING 1
#define DEBUG 0

// ACT and PRE array for VAMPIRE
struct Command {
  std::string name;
  bool has_value;
  unsigned int value;
};

std::vector<Command> act_pre_arr;
// std::vector<std::pair<std::string, std::optional<unsigned int>>> act_pre_arr;


uint32_t g_comp_rows[] = {COMP_ROW_A1 , COMP_ROW_A2, COMP_ROW_B1, COMP_ROW_B2, COMP_ROW_C1, COMP_ROW_C2};
uint32_t g_route_rows[] = {ROUT_ROW_0 , ROUT_ROW_1, ROUT_ROW_2};
uint32_t g_aside_rows[] = {ASIDE_0 , ASIDE_1, ASIDE_2};
// W value doesn't change the amount of assembly code

int ceil_div(int a, int b) {
  return (a + b - 1) / b;
}

Program frac(int t_frac, int r_frac_addr){
  //this function assumes you precharge beforehand
  Program p;
  p.add_inst(all_nops());
  int R_FRAC_REG = RF_REG;
  int bank_reg = BAR;
  p.add_inst(SMC_LI(r_frac_addr, R_FRAC_REG));

    /*       --Bank -> bank_reg--
    *        |  X  -------------- |-> rfrac_reg (R_FRAC_REG)
    *        | ... -------------- |
    *        | ... -------------- |
    *
    * Cmd:        ----| ACT R_FRAC_REG |------|       PRE      |------FINISH
    * Time:     T0----|       T1       |------|       T2       |------FINISH
    * Interval: -----------------------|t_frac|----------------|------FINISH
    */

  int num_cmd = 2 + t_frac;
  num_cmd += 4 - (num_cmd % 4);
  Mininst q_inst[num_cmd];
  for (int i = 0; i < num_cmd; i++)
    q_inst[i] = SMC_NOP();
  
  q_inst[0]          = SMC_ACT(bank_reg, 0, R_FRAC_REG, 0);
  q_inst[t_frac + 1] = SMC_PRE(bank_reg, 0, 0);

  for (int i = 0; i < num_cmd; i += 4)
    p.add_inst(q_inst[i], q_inst[i + 1], q_inst[i + 2], q_inst[i + 3]);

  return p;
  
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

Program row_copy(uint32_t r_first, uint32_t r_second)
{
  // Make sure r_first, r_second really can participate in row copy
  // (maybe no rows, or more than 2 rows will open!)
  // Assumes bank is precharged!
  Program program;

  // Precharge
  program.add_inst(SMC_SLEEP(6));
  program.add_below(PRE(BAR, 0, 0));
  act_pre_arr.push_back({"PRE", false, 0});
  program.add_inst(SMC_SLEEP(6));

  // Copy from r_first into r_second
  program.add_below(doubleACT(ROW_COPY_T12, ROW_COPY_T23, r_first, r_second));
  act_pre_arr.push_back({"ACT", true, r_first});
  act_pre_arr.push_back({"PRE", false, 0});
  act_pre_arr.push_back({"ACT", true, r_second});
  // Double act has no "quite" time included at the end, so a conservative settle time here
  program.add_inst(SMC_SLEEP(6));
  // re-initialize with PRE + time for PRE to settle
  program.add_below(PRE(BAR, 0, 0));
  act_pre_arr.push_back({"PRE", false, 0});
  program.add_inst(SMC_SLEEP(6));

  return program;
}

Program maj3()
{
  // Make sure r_first, r_second really can participate in row copy
  // (maybe no rows, or more than 2 rows will open!)
  // Assumes bank is precharged!
  Program program;

  // Precharge
  program.add_inst(SMC_SLEEP(6));
  program.add_below(PRE(BAR, 0, 0));
  act_pre_arr.push_back({"PRE", false, 0});
  program.add_inst(SMC_SLEEP(6));

  // Copy from r_first into r_second
  program.add_below(doubleACT(MAJ_T12, MAJ_T23, COMP_R1, COMP_R2));
  act_pre_arr.push_back({"ACT", true, COMP_R1});
  act_pre_arr.push_back({"PRE", false, 0});
  act_pre_arr.push_back({"ACT", true, COMP_R2});
  // Double act has no "quite" time included at the end, so a conservative settle time here
  program.add_inst(SMC_SLEEP(6));
  // re-initialize with PRE + time for PRE to settle
  program.add_below(PRE(BAR, 0, 0));
  act_pre_arr.push_back({"PRE", false, 0});
  program.add_inst(SMC_SLEEP(6));

  return program;
}


Program bnn_prog(uint32_t bank_id, std::vector<std::vector<uint32_t>> &x_in, std::vector<std::vector<uint32_t>> &weights, 
                 const std::vector<std::vector<uint32_t>> data_to_operand[OPERANDS], int &num_reads, std::deque<uint32_t> &padding_in)
{
  num_reads = 0;
  Program program;
  program.add_below(_init(bank_id));
  srand((unsigned) time(NULL));
  int random = rand();

  const int one_idx = x_in.size(); 
  const int zero_idx = one_idx + 1; 
  const int input_size = x_in.size() / 2 ; // x_in is given as x and x_bar
  const int aside_offset = zero_idx + 1;   // aside rows start after the x_in rows | 2 padding rows

  // PRECHARGE 
  program.add_inst(all_nops());
  program.add_inst(all_nops());
  program.add_below(PRE(BAR, 0, 0));

  // --------------------- Step 0 ---------------------

  // 0. Fill input-layer data into the data rows
  for(int i = 0; i < x_in.size(); i++)
  {
    random = rand();
    // program.add_below(wrRow_immediate_label(BAR, data_to_operand[OPERAND_A][i][0], x_in[i],random)); //  (bank_reg, row_immd, wr_pattern, label)
    program.add_below(wrRow_512_label(BAR, data_to_operand[OPERAND_A][i][0], x_in[i],random));
    // program.add_below(rdRow_immediate_label(BAR, data_to_operand[OPERAND_A][i][0], random));
    // num_reads++;
  }

  // Write 2 rows for padding 1 is 0's and the other is 1's
  random = rand();
  program.add_below(wrRow_immediate_label(BAR, data_to_operand[OPERAND_A][one_idx][0], ONE,random)); //  (bank_reg, row_immd, wr_pattern, label)

  random = rand();
  program.add_below(wrRow_immediate_label(BAR, data_to_operand[OPERAND_A][zero_idx][0], ZERO,random)); //  (bank_reg, row_immd, wr_pattern, label)

  // PRECHARGE
  program.add_inst(SMC_SLEEP(6));
  program.add_below(PRE(BAR, 0, 0));
  act_pre_arr.push_back({"PRE", false, 0});
  program.add_inst(SMC_SLEEP(6));

  // --------------------- Step 1 ---------------------
  // std::cout << "--------------------- Step 1 ---------------------" << std::endl;
  // 1. XNOR and COPY into MAJ3
  for (int col_i = 0; col_i < input_size; col_i++)
  { 
    // XNOR by taking x or x_bar based on the W value
    int x_in_index;
    if (weights[0][col_i] == 1) {
      x_in_index = col_i*2;
    } else {
      x_in_index =  col_i*2 + 1;
    }

    int operand_idx = col_i % 3; // Choose the operand based on the column index (A,B,C) in the computation rows

    // ============ Hop through the data rows to copy the data to the computation rows ============
    for (size_t hop = 0; hop < data_to_operand[operand_idx][x_in_index].size() - 1; hop++) 
    {
      program.add_below(row_copy(data_to_operand[operand_idx][x_in_index][hop], data_to_operand[operand_idx][x_in_index][hop+1]));
    }

    // ============ MAJ3 operation + save aside - once in 3 ============

    if (operand_idx == 2) 
    {
      program.add_below(maj3());
      int aside_row_i = aside_offset + (col_i / 3); // aside row index

      // Copy the result of the MAJ3 operation to the aside row
      for (size_t hop = data_to_operand[OPERAND_A][aside_row_i].size() - 2; hop > 0; hop--)
      {
        program.add_below(row_copy(data_to_operand[OPERAND_A][aside_row_i][hop], data_to_operand[OPERAND_A][aside_row_i][hop-1]));
      }
    }
  }

  // Padding the aside rows to be multiple of 3
  for (int pad = 0; pad < (3 - input_size % 3) % 3; pad++)
  {
    // std::cout << "added padding = " << pad << std::endl;
    // std::cout << "padding with = " << padding_in.front() << std::endl;
    int pad_row_idx = padding_in.front() == 1 ? one_idx : zero_idx;
    // std::cout << "pad_row_idx = " << (pad_row_idx == one_idx) << std::endl;
    padding_in.pop_front();
    int operand_idx = (input_size + pad) % 3;
    for (size_t hop = 0; hop < data_to_operand[operand_idx][pad_row_idx].size() - 1; hop++) 
    {
      program.add_below(row_copy(data_to_operand[operand_idx][pad_row_idx][hop], data_to_operand[operand_idx][pad_row_idx][hop+1]));
    }
    if (operand_idx == 2) 
    {
      program.add_below(maj3());
      int aside_result_row_i = aside_offset + (input_size / 3); 
      for (size_t hop = data_to_operand[OPERAND_A][aside_result_row_i].size() - 2; hop > 0; hop--) {
        program.add_below(row_copy(data_to_operand[OPERAND_A][aside_result_row_i][hop], data_to_operand[OPERAND_A][aside_result_row_i][hop-1]));
      }
    }
  }

  // read out the aside rows for validation:
  /*
  for (size_t i = 0; i < ceil_div(input_size, 3); i++) // We run (x_in.size()/3) times 
  { 
    random = rand();
    program.add_below(rdRow_immediate_label(BAR, data_to_operand[OPERAND_A][aside_offset+i][0], random));
    num_reads++;
  }
  */
  // --------------------- Step 2 ---------------------
  // std::cout << "--------------------- Step 2 ---------------------" << std::endl;
  // 2. Iterate MAJ3(MAJ3) until aside is exhausted
  int aside_size = ceil_div(input_size, 3); // aside size is 1/3 of the input size
  // std::cout << "input_size =  " << input_size << std::endl;
  // std::cout << "aside_size =  " << aside_size << std::endl;
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
        program.add_below(row_copy(data_to_operand[operand_idx][aside_idx][hop], data_to_operand[operand_idx][aside_idx][hop+1]));
      }

      // MAJ3 operation + save from computation to aside rows - once in 3
      if (operand_idx == 2) 
      {
        program.add_below(maj3());
        int aside_result_row_i = aside_offset + (i / 3); 
        for (size_t hop = data_to_operand[OPERAND_A][aside_result_row_i].size() - 2; hop > 0; hop--) {
          program.add_below(row_copy(data_to_operand[OPERAND_A][aside_result_row_i][hop], data_to_operand[OPERAND_A][aside_result_row_i][hop-1]));
        }
      }
    }

    // Padding the aside rows to be multiple of 3
    for (int pad = 0; pad < (3 - aside_size % 3) % 3; pad++)
    {
      // std::cout << "added padding" << pad << std::endl;
      int pad_row_idx = padding_in.front() == 1 ? one_idx : zero_idx;
      padding_in.pop_front();
      int operand_idx = (aside_size + pad) % 3;
      for (size_t hop = 0; hop < data_to_operand[operand_idx][pad_row_idx].size() - 1; hop++) 
      {
        program.add_below(row_copy(data_to_operand[operand_idx][pad_row_idx][hop], data_to_operand[operand_idx][pad_row_idx][hop+1]));
      }
      // MAJ3 operation + save from computation to aside rows - once in 3
      if (operand_idx == 2) 
      {
        program.add_below(maj3());
        int aside_result_row_i = aside_offset + (aside_size / 3); // If we have input_size of 9 we have 3 aside rows, for input_size of 8 we have 3 aside rows
        // std::cout << "aside_result_row_i =  " << aside_result_row_i << std::endl;
        for (size_t hop = data_to_operand[OPERAND_A][aside_result_row_i].size() - 2; hop > 0; hop--) {
          program.add_below(row_copy(data_to_operand[OPERAND_A][aside_result_row_i][hop], data_to_operand[OPERAND_A][aside_result_row_i][hop-1]));
        }
      }
    }
    aside_size = ceil_div(aside_size, 3); // aside size gets smaller by 3 each iteration

    // read out the aside rows for validation:
    /*
    for (size_t i = 0; i < aside_size; i++)
    {
      random = rand();
      program.add_below(rdRow_immediate_label(BAR, data_to_operand[OPERAND_A][aside_offset+i][0], random)); 
      num_reads++;
    }
    */
  }

  // read out the aside rows for validation:
  random = rand();
  program.add_below(rdRow_immediate_label(BAR, data_to_operand[OPERAND_A][aside_offset][0], random));
  num_reads++;

  // Extra buffer time to be sure
  program.add_inst(all_nops());
  program.add_inst(all_nops());
  program.add_below(PRE(BAR, 0, 0));
  program.add_inst(all_nops());
  program.add_inst(all_nops());

  program.add_inst(SMC_END());
  return program;
}


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

// Duplicate and Flip bits
std::vector<std::vector<uint32_t>> augment_flip(const std::vector<std::vector<int>> &x_in, int n_duplicated = 32, double flip_prob = 0.35)
{
  const int rows = x_in.size();               // Number of rows -> 16
  const int cols = x_in[0].size();            // Number of columns -> 128
  
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

void parse_binary_matrix(const std::string& file_name, std::vector<std::vector<int>> &matrix) {
  std::ifstream file(file_name);
  std::string line;
  while (std::getline(file, line)) {
      std::vector<int> row;
      std::stringstream ss(line);
      std::string cell;
      while (std::getline(ss, cell, ',')) { // Splitting by comma
          row.push_back(std::stol(cell)); // Convert to unsigned integer
      }
      matrix.push_back(row);
  }
  file.close();
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
      file << row.name;
      if (row.has_value) {
          file << " " << row.value;
      }
      file << "\n";
  }

  file.close();
  std::cout << "Done! Output saved to " << file_name << "\n";
}

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

int read_args_n_parse(int argc, char* argv[], uint32_t *bank_id, std::ofstream &out_file)
{

  if(argc != 3)
  {
    printf("Usage: \n ./bnn <bank_id> <out_file>\n");
    return(0); 
  }

  int arg_i = 1;
  *bank_id      =  atoi(argv[arg_i++]);

  out_file.open(std::string(argv[arg_i++]), std::ios::app);

  return 1;
}

void init_before(SoftMCPlatform& platform, Program& program, uint32_t bank_id, std::vector<std::vector<uint32_t>> &x_in, std::vector<std::vector<uint32_t>> &weights, 
                 const std::vector<std::vector<uint32_t>> data_to_operand[OPERANDS], int &num_reads, std::deque<uint32_t> &padding_in)
{
  platform.reset_fpga();
  program = bnn_prog(bank_id, x_in, weights, data_to_operand, num_reads, padding_in);
  platform.send_prog(program);
}

void to_time(SoftMCPlatform& platform, Program& program, int num_reads, std::ofstream &out_file)
{
  platform.activate();
      // Read out data
    uint8_t row[8192];
    // Retrieve 8192 bytes from the FPGA buffer (which is filled with content read from DRAM
    for (int i = 0; i < num_reads; i++)
    {
      platform.receiveData((void*)row, 8192);
      for (int j = 0; j < 64 / 4; j++)
      { // 64 bytes = 512 bits = 16 32-bit integers
        uint32_t result_32b = row[j*4] | (row[j*4+1] << 8) | (row[j*4+2] << 16) | (row[j*4+3] << 24);
        int ones_count = __builtin_popcount(result_32b); // Count the number of 1's in the 32-bit integer | GCC - Clang built-in function
        out_file << ones_count << std::endl;
      }
    }
    // out_file.close();
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



int main(int argc, char*argv[])
{
  SoftMCPlatform platform;
  int err;
  uint32_t bank_id;
  std::ofstream   out_file;

  if(!read_args_n_parse(argc, argv, &bank_id, out_file))
    exit(0);

  if ((err = platform.init()) != SOFTMC_SUCCESS)
  {
    cerr << "Could not initialize SoftMC Platform: " << err << endl;
  }
  platform.reset_fpga();

  // std::cout << "------------DEBUG------------" << std::endl;
  // std::cout << "bank_id: " << bank_id << std::endl;
  // std::cout << "out_file: " << std::string(argv[2]) << std::endl;

std::vector<std::vector<uint32_t>> weights_matrix;
std::vector<std::vector<uint32_t>> weights_bin_matrix;
std::vector<std::vector<uint32_t>> x_in;
std::vector<std::vector<int>> x_bin;  // binary input
std::deque<uint32_t> padding_in;
std::deque<uint32_t> padding_in_temp;
std::vector<std::vector<uint32_t>> data_to_operand[OPERANDS];
// parse_matrix("./weights_matrix.txt", weights_matrix); // Read from the single file
// parse_matrix("./input_layer.txt", x_in); // Read from the single file

parse_binary_matrix("./input.txt", x_bin); // Read matrix of 0's and 1's 128x16
parse_matrix("./weights_first_row.txt", weights_bin_matrix); // Read matrix of 0's and 1's 128x3

parse_path_map("./data_to_operand.txt", data_to_operand); // Read from the single file
parse_file_fifo("./padding.txt", padding_in); // Read from the single file
 
// std::cout << "DEBUG: enter DRAM Bender program" << std::endl;
int num_reads = 1;
auto x_augmented = augment_flip(x_bin, 32, 0.35);

save_matrix("augmented_input.txt", x_augmented);

std::cout << "DEBUG: pre_act size is " << act_pre_arr.size() << std::endl;

// std::cout << "DEBUG: x_augmented size is " << x_augmented.size() << std::endl;
// std::cout << "DEBUG: x_in size is " << x_in.size() << std::endl;
// std::cout << "========================================================================================= "<< std::endl;

// Program program = bnn_prog(bank_id, x_in, weights_matrix, data_to_operand, num_reads, padding_in);
Program program;
// Program program = bnn_prog(bank_id, x_augmented, weights_bin_matrix, data_to_operand, num_reads, padding_in); // With duplication and flipping

// platform.execute(program);

  const int runs = 1; //100000;
  std::vector<double> timings_ms;
  int amount = 8*1024; //amount of cachelines read
  for (int i = 0; i < runs; ++i) {
    padding_in_temp = padding_in;
    init_before(platform, program, bank_id, x_augmented, weights_bin_matrix, data_to_operand, num_reads, padding_in_temp);
    std::cout << "Run " << i << std::endl;
    auto start = std::chrono::high_resolution_clock::now();
    to_time(platform, program, num_reads, out_file);
    auto end = std::chrono::high_resolution_clock::now();
    // post(platform, num_reads, out_file);
    std::chrono::duration<double, std::milli> elapsed = end - start;
    timings_ms.push_back(elapsed.count());
  }
  std::cout << "Size of act_pre_arr = " << act_pre_arr.size() << "\n";
  save_pre_act("pre_act.txt", act_pre_arr);

  // Calculate average
  double sum = std::accumulate(timings_ms.begin(), timings_ms.end(), 0.0);
  double avg = sum / timings_ms.size();

  // Optionally calculate stddev
  double sq_sum = std::inner_product(timings_ms.begin(), timings_ms.end(), timings_ms.begin(), 0.0);
  double stddev = std::sqrt(sq_sum / runs - avg * avg);

  std::cout << "Average time: " << avg << " ms\n";
  std::cout << "Standard deviation: " << stddev << " ms\n";


// // Read out data
// uint8_t row[8192];
// // Retrieve 8192 bytes from the FPGA buffer (which is filled with content read from DRAM
// for (int i = 0; i < num_reads; i++)
// // for (int i = 0; i < 4; i++)
// {
//   platform.receiveData((void*)row, 8192);
//   for (int j = 0; j < 64 / 4; j++)
//   { // 64 bytes = 512 bits = 16 32-bit integers
//     uint32_t result_32b = row[j*4] | (row[j*4+1] << 8) | (row[j*4+2] << 16) | (row[j*4+3] << 24);
//     int ones_count = __builtin_popcount(result_32b); // Count the number of 1's in the 32-bit integer | GCC - Clang built-in function
//     out_file << ones_count << std::endl;
//   }
// }

out_file.close();
return 0;

}