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
#include <list>
#include <cstdlib>
#include <bitset>
#include <math.h> 
#include <iomanip>
#include "../DSN_AE_APPS/util.h"
using namespace std;


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
#define ADD_REG 9
#define LD_REG 10
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
  program.add_inst(SMC_LI(0, ADD_REG));
  return program;

}

Program row_copy(uint32_t r_first, uint32_t r_second)
{
  // Make sure r_first, r_second really can participate in row copy
  // (maybe no rows, or more than 2 rows will open!)
  // Assumes bank is precharged!
  Program program;
  // Copy from r_first into r_second
  program.add_below(doubleACT(ROW_COPY_T12, ROW_COPY_T23, r_first, r_second));
  // Double act has no "quite" time included at the end, so a conservative settle time here
  program.add_inst(SMC_SLEEP(6));
  // re-initialize with PRE + time for PRE to settle
  program.add_below(PRE(BAR, 0, 0));
  program.add_inst(SMC_SLEEP(6));

  return program;
}

Program maj3()
{
  // Make sure r_first, r_second really can participate in row copy
  // (maybe no rows, or more than 2 rows will open!)
  // Assumes bank is precharged!
  Program program;
  // Copy from r_first into r_second
  program.add_below(doubleACT(MAJ_T12, MAJ_T23, COMP_R1, COMP_R2));
  // Double act has no "quite" time included at the end, so a conservative settle time here
  program.add_inst(SMC_SLEEP(6));
  // re-initialize with PRE + time for PRE to settle
  program.add_below(PRE(BAR, 0, 0));
  program.add_inst(SMC_SLEEP(6));

  return program;
}

Program xnor_and_copy(uint32_t weight, uint32_t x_in_row, uint32_t x_in_bar_row, uint32_t comp_row_idx)
{
  // subprogram assumes preinitialized precharge
  uint32_t final_route_row, first_comp_row, second_comp_row;
  Program program;
  // we currently assume the data is stored in rows "behind" ROUT_ROW_0 exclusively
  // When extending - need to extend this code as well to support that

  // We perform XNOR by opening x / x_bar based on weight value
  if (weight == 1) {
    program.add_below(row_copy(x_in_row, ROUT_ROW_0));
  } else {
    program.add_below(row_copy(x_in_bar_row, ROUT_ROW_0));
  }

  // logic to identify relevant rows in each stage
  // This is highly dependant on the chosen routing, comp rows!!!
  final_route_row = g_route_rows[comp_row_idx];
  first_comp_row = g_comp_rows[comp_row_idx*2];
  second_comp_row = g_comp_rows[comp_row_idx*2+1];

  // Copy to adjacent routing row - only if needed
  if (final_route_row != ROUT_ROW_0) {
    program.add_below(row_copy(ROUT_ROW_0, final_route_row));
  }
  
  // Copy from routing row into computation row
  program.add_below(row_copy(final_route_row, first_comp_row));

  // Copy from routing row into computation row
  program.add_below(row_copy(first_comp_row, second_comp_row));

  return program;
}

// writed from reg to DRAM row
Program wrRow_reg_label(int bank_reg, uint32_t row_immd, uint32_t reg, int label)
{
  Program p;
  for (int i = 0; i < 16; i++)
    // We suspect this replicates PATTEN_REG contetns 16 times it create 512b word
    // we need to understant what is LDWD
    p.add_inst(SMC_LDWD(reg, i));

  p.add_inst(SMC_LI(row_immd, RAR));
  p.add_inst(SMC_LI(0, CAR));
  p.add_inst(SMC_LI(0, LOOP_COLS));
  p.add_inst(SMC_LI(128, NUM_COLS_REG));
  p.add_below(PRE(bank_reg, 0, 0));
  p.add_below(ACT(bank_reg, 0, RAR, 0));
  p.add_label("WR_ROW_IMMD_" + std::to_string(label));
    p.add_below(WRITE(bank_reg, CAR, 1));
    p.add_inst(SMC_ADDI(LOOP_COLS, 1, LOOP_COLS));
  p.add_branch(p.BR_TYPE::BL, LOOP_COLS, NUM_COLS_REG, "WR_ROW_IMMD_" + std::to_string(label));
  p.add_inst(all_nops());

  return p;
}

Program bnn_prog(uint32_t bank_id, std::vector<uint32_t> &x_in, std::vector<std::vector<uint32_t>> &weights)
{
  uint32_t x_rows[] = {X0, X0_NOT, X1, X1_NOT, X2, X2_NOT};
  Program program;
  program.add_below(_init(bank_id));
  srand((unsigned) time(NULL));
  int random = rand();
  program.add_inst(all_nops());
  program.add_inst(all_nops());
  program.add_below(PRE(BAR, 0, 0));
  // Read the initialized data
  program.add_inst(SMC_LD(ADD_REG, 0, LD_REG));
  // Write to DRAM row 0
  random = rand();
  // For testing only - fill checked rows with 1s pattern:
  program.add_below(wrRow_immediate_label(BAR, 0, ONE, random));
  random = rand();
  program.add_below(wrRow_reg_label(BAR, 0, LD_REG, random));
  random = rand();
  program.add_below(rdRow_immediate_label(BAR, 0, random));

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
  /*
  if(DEBUG){
    std::cout << "------------DEBUG------------" << std::endl;
    std::cout << "num_open_rows: " << n_open_rows << std::endl;
    std::cout << "maj_x: " << maj_x << std::endl;
    std::cout << "frac idx: " << std::endl;
    for(auto frac_idx : r_frac_idx)
    {
      std::cout << frac_idx << ", ";
    }
    std::cout << std::endl;
    std::cout << "open row idx: " << std::endl;
    for(auto open_row : open_row_idx)
    {
      std::cout << open_row << ", ";
    }
    std::cout << std::endl;
    std::cout << "r_first: " << r_first << std::endl;
    std::cout << "r_second: " << r_second << std::endl;
    std::cout << "-----------------------------" << std::endl;
  }
*/

std::vector<std::vector<uint32_t>> weights_matrix;
std::vector<uint32_t> x_in;
parse_matrix("./weights_matrix.txt", weights_matrix); // Read from the single file
parse_file("./input_layer.txt", x_in); // Read from the single file

std::cout << "------------DEBUG------------" << std::endl;
std::cout << "weights row 0: " << weights_matrix[0][0] << "," << weights_matrix[0][1] << "," << weights_matrix[0][2] << std::endl;
std::cout << "weights row 1: " << weights_matrix[1][0] << "," << weights_matrix[1][1] << "," << weights_matrix[1][2] << std::endl;
std::cout << "weights row 2: " << weights_matrix[2][0] << "," << weights_matrix[2][1] << "," << weights_matrix[2][2] << std::endl;

std::cout << "x_in: "  << x_in[0] << "," << x_in[1] << "," << x_in[2] << "," << x_in[3] << "," << x_in[4] << "," << x_in[5] << std::endl;

std::cout << "DEBUG: enter DRAM Bender program" << std::endl;

Program program = bnn_prog(bank_id, x_in, weights_matrix);
platform.execute(program);
std::cout << "DEBUG: exit DRAM Bender program" << std::endl;

// Read out data
uint8_t row[8192];  
// Retrieve 8192 bytes from the FPGA buffer (which is filled with content read from DRAM
// for (int i = 0; i < weights_matrix.size(); i++)
// {
//   std::cout << "DEBUG: start of ask data from FPGA" << std::endl;
//   platform.receiveData((void*)row, 8192);
//   std::cout << "DEBUG: end of ask data from FPGA" << std::endl;
//   for (int j = 0; j < 8192; j++)
//   {
//     out_file << std::to_string(row[j]) << endl;
//   }
// }
platform.receiveData((void*)row, 8192);
for (int j = 0; j < 8192; j++)
{
  out_file << std::to_string(row[j]) << endl;
}
out_file.close();

return 0;
}