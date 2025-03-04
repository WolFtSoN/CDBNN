#include "instruction.h"
#include "prog.h"
#include "platform.h"
#include <fstream>
#include <iostream>
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
#define ROUT_ROW_1 24
#define ROUT_ROW_2 25
#define ROUT_ROW_3 536

// Data rows - all conected currently to ROUT_ROW_1
#define X0 0
#define X0_NOT 8
#define X1 16
#define X1_NOT 344
#define X2 472
#define X2_NOT 280

#define ROW_COPY_T12 30
#define ROW_COPY_T23 1

#define MAJ_T12 1
#define MAJ_T23 0

#define HYTT_TIMING 1
#define DEBUG 0

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

Program xnor_and_copy(uint32_t weight, uint32_t x_in_row, uint32_t x_in_bar_row, uint32_t comp_row_idx, int label)
{
  // subprogram assumes preinitialized precharge
  uint32_t comp_rows[] = {COMP_ROW_A1 , COMP_ROW_A2, COMP_ROW_B1, COMP_ROW_B2, COMP_ROW_C1, COMP_ROW_C2};
  uint32_t final_route_row, first_comp_row, second_comp_row;
  Program program;
  // we currently assume the data is stored in rows "behind" ROUT_ROW_1 exclusively
  // When extending - need to extend this code as well to support that
  if (weight == 1) {
    program.add_below(doubleACT(ROW_COPY_T12, ROW_COPY_T23, x_in_row, ROUT_ROW_1));
  } else {
    program.add_below(doubleACT(ROW_COPY_T12, ROW_COPY_T23, x_in_bar_row, ROUT_ROW_1));
  }
  // Double act has no "quite" time included at the end, so a conservative settle time here
  program.add_inst(SMC_SLEEP(6));
  // re-initialize with PRE + time for PRE to settle
  program.add_below(PRE(BAR, 0, 0));
  program.add_inst(SMC_SLEEP(6));

  // logic to identify relevant rows in each stage, currently hardocded - if needed can be "smarter"
  // This is highly dependant on the chosen routing, comp rows!!!
  if (comp_row_idx == 0) {/* into COMP_A */
    final_route_row = ROUT_ROW_1;
  } else if (comp_row_idx == 1) {/* into COMP_B */
    final_route_row = ROUT_ROW_2;
  } else {/* into COMP_C */
    final_route_row = ROUT_ROW_3;
  }
  first_comp_row = comp_rows[comp_row_idx*2];
  second_comp_row = comp_rows[comp_row_idx*2+1];

  // Copy to adjacent routing row - only if needed
  if (final_route_row != ROUT_ROW_1) {
    program.add_below(doubleACT(ROW_COPY_T12, ROW_COPY_T23, ROUT_ROW_1, final_route_row));
    // Double act has no "quite" time included at the end, so a conservative settle time here
    program.add_inst(SMC_SLEEP(6));
    // re-initialize with PRE + time for PRE to settle
    program.add_below(PRE(BAR, 0, 0));
    program.add_inst(SMC_SLEEP(6));
  }
  
  // Copy from routing row into computation row
  program.add_below(doubleACT(ROW_COPY_T12, ROW_COPY_T23, final_route_row, first_comp_row));
  // Double act has no "quite" time included at the end, so a conservative settle time here
  program.add_inst(SMC_SLEEP(6));
  // re-initialize with PRE + time for PRE to settle
  program.add_below(PRE(BAR, 0, 0));
  program.add_inst(SMC_SLEEP(6));

  // Copy from 1st computation row into 2nd computation row
  program.add_below(doubleACT(ROW_COPY_T12, ROW_COPY_T23, first_comp_row, second_comp_row));
  program.add_inst(SMC_SLEEP(6)); // Settle time for write operation - check
  // Double act has no "quite" time included at the end, so a conservative settle time here
  program.add_inst(SMC_SLEEP(6));
  // re-initialize with PRE + time for PRE to settle
  program.add_below(PRE(BAR, 0, 0));
  program.add_inst(SMC_SLEEP(6));

  return program;
}


Program bnn_prog(uint32_t bank_id, std::vector<uint32_t> &x_in, std::vector<uint32_t> &weights)
{
  uint32_t x_rows[] = {X0, X0_NOT, X1, X1_NOT, X2, X2_NOT};
  Program program;
  program.add_below(_init(bank_id));
  srand((unsigned) time(NULL));
  int random = rand();
  // Next 3 rows - some kind of initialization. Whe PRE needed?
  program.add_inst(all_nops());
  program.add_inst(all_nops());
  program.add_below(PRE(BAR, 0, 0));
  // For testing only - fill checked rows with damka pattern:
  // random = rand();
  // program.add_below(wrRow_immediate_label(BAR, COMP_ROW_A1, ONE, random));
  // random = rand();
  // program.add_below(wrRow_immediate_label(BAR, COMP_ROW_A2, ONE, random));
  // end of test logic

  // Fill input-layer data into the data rows
  for(int i = 0; i < 6; i++)
  {
    random = rand();
    program.add_below(wrRow_immediate_label(BAR, x_rows[i], x_in[i],random)); //  (bank_reg, row_immd, wr_pattern, label)
  }
  // Next 3 lines - initialization and some "quite" time to settle I guess
  program.add_inst(SMC_SLEEP(6));
  program.add_below(PRE(BAR, 0, 0));
  program.add_inst(SMC_SLEEP(6));

  ////// Copy Xs/X_bars to comp rows
  // Copy X0/not(X0) into 24 and then to A
  if (weights[0] == 1)
  {
    program.add_below(doubleACT(ROW_COPY_T12, ROW_COPY_T23, X0, ROUT_ROW_1));
  } else {
    program.add_below(doubleACT(ROW_COPY_T12, ROW_COPY_T23, X0_NOT, ROUT_ROW_1));
  }
  program.add_inst(SMC_SLEEP(6)); // Settle time for write operation - check

  // re-initialize with PRE + time for PRE to settle
  program.add_below(PRE(BAR, 0, 0));
  program.add_inst(SMC_SLEEP(6));
  
  program.add_below(doubleACT(ROW_COPY_T12, ROW_COPY_T23, ROUT_ROW_1, COMP_ROW_A1));
  program.add_inst(SMC_SLEEP(6)); // Settle time for write operation - check

  // re-initialize with PRE + time for PRE to settle
  program.add_below(PRE(BAR, 0, 0));
  program.add_inst(SMC_SLEEP(6));

  program.add_below(doubleACT(ROW_COPY_T12, ROW_COPY_T23, COMP_ROW_A1, COMP_ROW_A2));
  program.add_inst(SMC_SLEEP(6)); // Settle time for write operation - check

  // re-initialize with PRE + time for PRE to settle
  program.add_inst(SMC_SLEEP(6));
  program.add_below(PRE(BAR, 0, 0));
  program.add_inst(SMC_SLEEP(6));

  // read out A comp rows  for validation:
  random = rand();
  program.add_below(rdRow_immediate_label(BAR, COMP_ROW_A1, random));
  random = rand();
  program.add_below(rdRow_immediate_label(BAR, COMP_ROW_A2, random));

  // Extra buffer time to be sure
  program.add_inst(all_nops());
  program.add_inst(all_nops());
  program.add_below(PRE(BAR, 0, 0));
  program.add_inst(all_nops());
  program.add_inst(all_nops());

  program.add_inst(SMC_END());
  return program;
}

std::vector<uint8_t> maj_operation(std::vector<uint32_t> patterns, std::vector<uint32_t> r_frac_idx)
{
  //size of patterns
  int n_patterns = patterns.size();
  //majority operation
  std::vector <uint8_t> bit_maj;
  for(int j = 0; j < 32 ; j++)
  { 
    uint8_t temp = 0;
    for(int i = 0; i < n_patterns; i++)
    {
    //get majority of each bit
      temp += (patterns[i] >> j) & 0x1; 
    }
    for (int i = 0; i < r_frac_idx.size(); i++)
    {
      temp -= (patterns[r_frac_idx[i]] >> j) & 0x1;
    }
    int inp_size = n_patterns - r_frac_idx.size();
    bit_maj.push_back(temp > inp_size/2 ? 1 : 0);
  }
  return bit_maj;
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
void report_coverage_results(SoftMCPlatform &platform, std::vector<uint32_t> pattern, std::vector<uint32_t> r_frac_idx, uint32_t bank_id, uint32_t num_iter, uint32_t *maj_result, vector<uint32_t>& open_row_idx, bool is_stability)
{
  // CPU create expected output for the test vector
  std::vector <uint8_t> expected_maj = maj_operation(pattern, r_frac_idx);
  uint8_t row[8192];
  
  // Retrieve 8192 bytes from the FPGA buffer (which is filled with content read from DRAM)
  platform.receiveData((void*)row, 8192);
  if(is_stability && DEBUG){
    std::cout << "Running test: " << std::endl;
    for(int i = 0; i < pattern.size(); i++)
    {
      if(std::find(r_frac_idx.begin(), r_frac_idx.end(), i) != r_frac_idx.end()){
        std::cout << std::setw(15) << open_row_idx[i] << ": ffffffffffffffffffffffffffffffff" << std::endl;
      }else{
        std::cout << std::setw(15) << open_row_idx[i] << ": " << std::bitset<32>(pattern[i]) << std::endl;
      }
    }
  }

  // pack expected results from bit-bit format into 32b format
  uint32_t exp_maj_result = 0;
  for(int i = 0; i < expected_maj.size(); i++)
  {
    exp_maj_result |= ((expected_maj[i] & 0x1) << i);
  }

  // 8192 bytes / 4 = num of 32b words 
  for(int j = 0; j < 8192/4; j++)
  {
    // pack 4 bytes from recieved buffer into 32b word
    // word = (MSB format) [byte 3, byte 2, byte 1, byte 0]
    uint32_t read_maj_result = row[j*4] | (row[j*4+1] << 8) | (row[j*4+2] << 16) | (row[j*4+3] << 24);
    bitset<32> result(~(read_maj_result ^ exp_maj_result));
    for (int i = 0; i < 32; i++)
    {
      maj_result[j*32 + i] += result.test(i) ? 1 : 0;
    }
    
    if(is_stability && DEBUG){
      std::cout << std::endl;
      std::cout << "exp_maj_result:  " << std::bitset<32>(exp_maj_result) << std::endl;
      std::cout << "read_maj_result: " << std::bitset<32>(read_maj_result) << std::endl;
      std::cout << "correct_res_ctr: ";
      for(int i = 31; i >= 0; i--)
      {
        std::cout << maj_result[j*32 + i];
      }
      std::cout << std::endl;
      break;
    }
  }

}
std::vector<uint32_t> random_pattern_creator(std::vector<uint32_t> r_frac_idx, uint32_t n_open_rows, uint32_t maj_x,uint32_t seed)
{
  std::vector<uint32_t> pattern_maj;
  std::vector<uint32_t> patterns;
  parse_file("./patterns/pattern_0.txt", patterns);
  srand((time(NULL)+getpid()+seed));
  for(int i = 0; i < maj_x; i++)
  {
    uint32_t wr_pattern = (uint32_t)rand();
    wr_pattern = (wr_pattern & 0xffff) | (uint32_t)rand() << 16;
    pattern_maj.push_back(wr_pattern);
  }
  for(int i = 0; i < n_open_rows; i++)
  {
    patterns[i]=(pattern_maj[i%maj_x]);
  }
  for(int i = 0; i < r_frac_idx.size(); i++)
  {
    patterns[r_frac_idx[i]] = ONE;
  }
  return patterns;

}
int main(int argc, char*argv[])
{
  SoftMCPlatform platform;
  int err;
  // uint32_t r_first,r_second,min_row,max_row,n_open_rows;
  // uint32_t num_iter;
  uint32_t bank_id;
  // uint32_t maj_x;
  // uint32_t t_12;
  // uint32_t t_23;
  // uint32_t n_frac_times;
  // uint32_t t_frac;

  // std::vector<uint32_t> r_frac_idx;
  // std::vector<uint32_t> open_row_idx;
  // std::vector<uint32_t> patterns_old;
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

/*
  uint32_t coverage_result[8192*8] {0}; // A single 64Kb row
  std::vector<std::string> pattern_files;

  uint32_t num_patterns = 0;
  for (boost::filesystem::directory_entry& entry : boost::filesystem::directory_iterator("./patterns/"))
  {
    num_patterns++;
    std::vector<uint32_t> patterns;
    parse_file(entry.path().string(), patterns); // just take a bunch of uint32 nums from text file to vector
    Program program = test_prog(num_iter,bank_id, n_open_rows, patterns, open_row_idx, r_first, r_second, r_frac_idx, t_12, t_23, n_frac_times, t_frac);
    platform.execute(program);
    report_coverage_results(platform, patterns, r_frac_idx, bank_id, num_iter, coverage_result, open_row_idx, false);
  }
*/
uint32_t read_result[8192*8] {0}; // A single 64Kb row

std::vector<uint32_t> weights;
std::vector<uint32_t> x_in;
parse_file("./weights_0.txt", weights); // Read from the single file
parse_file("./input_layer.txt", x_in); // Read from the single file

std::cout << "------------DEBUG------------" << std::endl;
std::cout << "weights: " << weights[0] << "," << weights[1] << "," << weights[2] << std::endl;
std::cout << "x_in: "  << x_in[0] << "," << x_in[1] << "," << x_in[2] << "," << x_in[3] << "," << x_in[4] << "," << x_in[5] << std::endl;

std::cout << "DEBUG: enter DRAM Bender program" << std::endl;
Program program = bnn_prog(bank_id, x_in, weights);
platform.execute(program);
std::cout << "DEBUG: exit DRAM Bender program" << std::endl;

// Read out data
uint8_t two_rows[8192];  
// Retrieve 8192 bytes from the FPGA buffer (which is filled with content read from DRAM)
std::cout << "DEBUG: start of ask data from FPGA" << std::endl;
platform.receiveData((void*)two_rows, 8192);
std::cout << "DEBUG: end of ask data from FPGA" << std::endl;
for (size_t i = 0; i < 8192; i++)
{
  out_file << std::to_string(two_rows[i]) << endl;
}
std::cout << "DEBUG: start of ask data from FPGA" << std::endl;
platform.receiveData((void*)two_rows, 8192);
std::cout << "DEBUG: end of ask data from FPGA" << std::endl;
for (size_t i = 0; i < 8192; i++)
{
  out_file << std::to_string(two_rows[i]) << endl;
}
out_file.close();

return 0;
}