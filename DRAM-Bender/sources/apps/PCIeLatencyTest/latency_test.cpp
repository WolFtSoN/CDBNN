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
#include <chrono>
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

uint32_t g_comp_rows[] = {COMP_ROW_A1 , COMP_ROW_A2, COMP_ROW_B1, COMP_ROW_B2, COMP_ROW_C1, COMP_ROW_C2};
uint32_t g_route_rows[] = {ROUT_ROW_0 , ROUT_ROW_1, ROUT_ROW_2};
uint32_t g_aside_rows[] = {ASIDE_0 , ASIDE_1, ASIDE_2};
// W value doesn't change the amount of assembly code

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

Program write_prog(uint32_t bank_id)
{
  std::vector<uint32_t> x_in = {ONE, ONE, ONE, ONE, ONE, ONE, ONE, ONE,
                                ONE, ONE, ONE, ONE, ONE, ONE, ONE, ONE};
  Program program;
  program.add_below(_init(bank_id));
  srand((unsigned) time(NULL));
  int random = rand();

  // PRECHARGE 
  program.add_inst(all_nops());
  program.add_inst(all_nops());
  program.add_below(PRE(BAR, 0, 0));

  // --------------------- Step 0 ---------------------
  // 0. Fill input-layer data into the data rows
  for(int i = 0; i < 256; i++)
  {
    random = rand();
    // program.add_below(wrRow_immediate_label(BAR, data_to_operand[OPERAND_A][i][0], x_in[i],random)); //  (bank_reg, row_immd, wr_pattern, label)
    program.add_below(wrRow_512_label(BAR, i, x_in, random));
    // program.add_below(rdRow_immediate_label(BAR, data_to_operand[OPERAND_A][i][0], random));
    // num_reads++;
  }

  // read out 512b (cache line) from the DRAM:
  random = rand();
  program.add_inst(SMC_LI(0/*row num*/, RAR));
  program.add_inst(SMC_LI(0, CAR));
  program.add_inst(SMC_LI(0, LOOP_COLS));
  program.add_below(PRE(BAR, 0, 0));
  program.add_below(ACT(BAR, 0, RAR, 0));
  program.add_inst(SMC_SLEEP(6));
  program.add_below(READ(BAR, CAR, 1));

  program.add_inst(all_nops());

  program.add_inst(SMC_SLEEP(10));

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

void init_before(SoftMCPlatform& platform, Program& program)
{
  platform.reset_fpga();
  platform.send_prog(program);
  // platform.enter_loopback();
}

void to_time(SoftMCPlatform& platform, Program& program, uint8_t single_bus[64])
{
  platform.activate();
  platform.receiveData((void*)single_bus, 64);
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

  std::cout << "------------DEBUG------------" << std::endl;
  std::cout << "bank_id: " << bank_id << std::endl;
  std::cout << "out_file: " << std::string(argv[2]) << std::endl;

  uint8_t single_bus[64];

  Program program = write_prog(bank_id);

  
  const int runs = 40;
  std::vector<double> timings_ms;
  // init_before(platform, program);
  for (int i = 0; i < runs; ++i) {
    init_before(platform, program);
    std::cout << "Run " << i << std::endl;
    auto start = std::chrono::high_resolution_clock::now();
    to_time(platform, program, single_bus);
    auto end = std::chrono::high_resolution_clock::now();
    std::chrono::duration<double, std::milli> elapsed = end - start;
    timings_ms.push_back(elapsed.count());
  }

  // Calculate average
  double sum = std::accumulate(timings_ms.begin(), timings_ms.end(), 0.0);
  double avg = sum / timings_ms.size();

  // Optionally calculate stddev
  double sq_sum = std::inner_product(timings_ms.begin(), timings_ms.end(), timings_ms.begin(), 0.0);
  double stddev = std::sqrt(sq_sum / runs - avg * avg);

  std::cout << "Average time: " << avg << " ms\n";
  std::cout << "Standard deviation: " << stddev << " ms\n";
  // platform.send_prog(program);
  // auto start = std::chrono::high_resolution_clock::now();
  // platform.activate();
  // Read out data
  // Retrieve 64 bytes from the FPGA buffer (which is filled with content read from DRAM
  // for (int i = 0; i < num_reads; i++)
  // std::cout << "DEBUG: start of ask data from FPGA" << std::endl;
  // platform.receiveData((void*)single_bus, 64);
  // std::cout << "DEBUG: end of ask data from FPGA" << std::endl;
  
  // auto end = std::chrono::high_resolution_clock::now();
  // std::chrono::duration<double, std::milli> elapsed = end - start;
  // std::cout << "Elapsed time: " << elapsed.count() << " ms" << std::endl;
  out_file << std::to_string(single_bus[0]) << endl;

  out_file.close();

  return 0;
}