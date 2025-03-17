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
#include "util.h"
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
#define BAR 3
#define R4 4
#define R5 5
#define R6 6
#define R7 7
#define R8 8
#define R9 9
#define R10 10
#define R11 11
#define R12 12 
#define R13 13
#define R14 14
#define R15 15

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

#define X_OFFSET 0
#define W_OFFSET 6
#define DATA_ROWS_MAP_OFFSET 30

#define STOP_FLAG 0xFFFFFFFF

uint32_t g_comp_rows[] = {COMP_ROW_A1 , COMP_ROW_A2, COMP_ROW_B1, COMP_ROW_B2, COMP_ROW_C1, COMP_ROW_C2};
uint32_t g_route_rows[] = {ROUT_ROW_0 , ROUT_ROW_1, ROUT_ROW_2};
uint32_t g_aside_rows[] = {ASIDE_0 , ASIDE_1, ASIDE_2};

uint32_t scratchpad[] = {ONE,
                         ZERO,
                         ONE,
                         ZERO,
                         ONE,
                         ZERO,/* Xs are b'111*/ /*0-5 Xs + Comps*/
//                        0x80000000, 0x00000000, 0x00000000, 0x00000000, /* 3b'001 W row */ /*6-17 W*/
//                        0xC0000000, 0x00000000, 0x00000000, 0x00000000, /* 3b'011 W row */
//                        0xE0000000, 0x00000000, 0x00000000, 0x00000000, /* 3b'111 W row */
                          0x94000000, 0x00000000, 0x00000000, 0x00000000, /* 3b'001 W row -> 10010100 */ /*6-29 W*/
                          0x00000000, 0x00000000, 0x00000000, 0x00000000, 
                          0x68000000, 0x00000000, 0x00000000, 0x00000000, /* 3b'011 W row -> 01101000 */
                          0x00000000, 0x00000000, 0x00000000, 0x00000000, 
                          0xA8000000, 0x00000000, 0x00000000, 0x00000000, /* 3b'111 W row -> 10101000 */
                          0x00000000, 0x00000000, 0x00000000, 0x00000000, 
                        /* DATA ROWS */ /*30-47 ACTIVATIONS*/ /*48-56 ASIDE*/
                        
                        // ((24  << 20) | (ROUT_ROW_0 << 10) | (X0)), /*|NEXT INDEX IN TABLE|NEXT HOP|DATA ROW|*/
                        // ((24  << 20) | (ROUT_ROW_0 << 10) | (X0_NOT)), /*|NEXT INDEX IN TABLE|NEXT HOP|DATA ROW|*/
                        // ((24  << 20) | (ROUT_ROW_0 << 10) | (X1)), /*|NEXT INDEX IN TABLE|NEXT HOP|DATA ROW|*/
                        // ((24  << 20) | (ROUT_ROW_0 << 10) | (X1_NOT)), /*|NEXT INDEX IN TABLE|NEXT HOP|DATA ROW|*/
                        // ((24  << 20) | (ROUT_ROW_0 << 10) | (X2)), /*|NEXT INDEX IN TABLE|NEXT HOP|DATA ROW|*/
                        // ((24  << 20) | (ROUT_ROW_0 << 10) | (X2_NOT)), /*|NEXT INDEX IN TABLE|NEXT HOP|DATA ROW|*/
                        // ((24  << 20) | (ROUT_ROW_0 << 10) | (ASIDE_0)), /*|NEXT INDEX IN TABLE|NEXT HOP|DATA ROW|*/
                        // ((24  << 20) | (ROUT_ROW_0 << 10) | (ASIDE_1)), /*|NEXT INDEX IN TABLE|NEXT HOP|DATA ROW|*/
                        // ((24  << 20) | (ROUT_ROW_0 << 10) | (ASIDE_2)), /*|NEXT INDEX IN TABLE|NEXT HOP|DATA ROW|*/

                        X0 /*DATA ROW ADDRESS*/, ROUT_ROW_0 /*LVL 2 ROUT ROW ADDRESS*/, /*POINTER TO ROUT ROW META DATA*/ 57,
                        X0_NOT /*DATA ROW ADDRESS*/, ROUT_ROW_0 /*LVL 2 ROUT ROW ADDRESS*/, /*POINTER TO ROUT ROW META DATA*/ 57,
                        X1 /*DATA ROW ADDRESS*/, ROUT_ROW_0 /*LVL 2 ROUT ROW ADDRESS*/, /*POINTER TO ROUT ROW META DATA*/ 57,
                        X1_NOT /*DATA ROW ADDRESS*/, ROUT_ROW_0 /*LVL 2 ROUT ROW ADDRESS*/, /*POINTER TO ROUT ROW META DATA*/ 57,
                        X2 /*DATA ROW ADDRESS*/, ROUT_ROW_0 /*LVL 2 ROUT ROW ADDRESS*/, /*POINTER TO ROUT ROW META DATA*/ 57,
                        X2_NOT /*DATA ROW ADDRESS*/, ROUT_ROW_0 /*LVL 2 ROUT ROW ADDRESS*/, /*POINTER TO ROUT ROW META DATA*/ 57,
                        ASIDE_0 /*DATA ROW ADDRESS*/, ROUT_ROW_0 /*LVL 2 ROUT ROW ADDRESS*/, /*POINTER TO ROUT ROW META DATA*/ 57,
                        ASIDE_1 /*DATA ROW ADDRESS*/, ROUT_ROW_0 /*LVL 2 ROUT ROW ADDRESS*/, /*POINTER TO ROUT ROW META DATA*/ 57,
                        ASIDE_2 /*DATA ROW ADDRESS*/, ROUT_ROW_0 /*LVL 2 ROUT ROW ADDRESS*/, /*POINTER TO ROUT ROW META DATA*/ 57,

                        /* ROUTING ROWS TO COMP */
                        /* ROUT 0 -> A*/ /*57-62*/
                        // ((0 << 22) | (COMP_ROW_A2 << 20) | (COMP_ROW_A1 << 10) | (ROUT_ROW_0)), /* ROUT0 -> A part 1 */
                        // ((0  << 20) | (0 << 10) | (0)), /* ROUT1 -> A part 2 */
                        ROUT_ROW_0, COMP_ROW_A1, COMP_ROW_A2, STOP_FLAG, 0, 0,
                        /* ROUT 0 -> B*/ /*63-68*/
                        // ((1 << 22) | (COMP_ROW_B1  << 20) | (ROUT_ROW_1 << 10) | (ROUT_ROW_0)), /* ROUT0 -> B part 1 */
                        // ((0  << 20) | (0 << 10) | (COMP_ROW_B2)), /* ROUT0 -> B part 2 */
                        ROUT_ROW_0, ROUT_ROW_1, COMP_ROW_B1, COMP_ROW_B2, STOP_FLAG, 0,
                        /* ROUT 0 -> C*/ /*69-74*/
                        // ((2 << 22) | (ROUT_ROW_2  << 20) | (ROUT_ROW_0 << 10) | (ROUT_ROW_2)), /* ROUT0 -> C part 1 */
                        // ((0  << 20) | (COMP_ROW_C2 << 10) | (COMP_ROW_C1)) /* ROUT0 -> C part 2 */
                        ROUT_ROW_2, ROUT_ROW_0, ROUT_ROW_2, COMP_ROW_C1, COMP_ROW_C2, STOP_FLAG
};

Program _init(uint32_t bank_id)
{
  Program program;
  program.add_inst(SMC_LI(8, CASR));                  // Load 8 into CASR since each READ reads 8 columns
  program.add_inst(SMC_LI(1, BASR));                  // Load 1 into BASR
  program.add_inst(SMC_LI(1, RASR));                  // Load 1 into RASR
  program.add_inst(SMC_LI(bank_id, BAR));
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

Program wrRow_reg_label(int bank_reg, uint32_t row_immd, uint32_t wr_pattern,int label)
{
  Program p;
  p.add_inst(SMC_LI(wr_pattern, PATTERN_REG)); // s
  for (int i = 0; i < 16; i++)
    // We suspect this replicates PATTEN_REG contetns 16 times it create 512b word
    // we need to understant what is LDWD
    p.add_inst(SMC_LDWD(PATTERN_REG, i));

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


Program bnn_prog(uint32_t bank_id)
{
  Program program;
  program.add_below(_init(bank_id));
  //////////////////////////////
  // 0. Initialize scratchpad //
  //////////////////////////////
  int RB = R4; 
  int RV = R5;
  program.add_inst(SMC_LI(0, RB));
  for (size_t i = 0; i < 30; i++)
  {
    program.add_inst(SMC_LI(scratchpad[i], RV));
    program.add_inst(SMC_ST(RB, i, RV));
  }
  
  //////////////////////////////
  // 1. Initialize X in DRAM  //
  //////////////////////////////
  int LOOP_IDX = R4;
  int LOOP_SIZE = R5;
  int X_I = R6;
  int X_I_ROW = R7;
  int MASK_REG = R8;
  int COL_ADDRESS_REG = R9;
  int WRITE_LOOP_IDX = R10;
  int WRITE_LOOP_SIZE = R11;
  // Loop on saved X data
  program.add_inst(SMC_LI(0, LOOP_IDX));
  program.add_inst(SMC_LI(6, LOOP_SIZE)); /*Length of X + comp - X is 3 bits*/
  program.add_label("WRITE_X_LOOP");
    // Get X from scratchpad
    program.add_inst(SMC_LD(LOOP_IDX, X_OFFSET, X_I));
    // Put X in wide-reg
    for (int i = 0; i < 16; i++)
      program.add_inst(SMC_LDWD(X_I, i));
    // Get dest row in to reg:
    program.add_inst(SMC_LD(LOOP_IDX, DATA_ROWS_MAP_OFFSET, X_I_ROW));
    program.add_inst(SMC_LI(0x000003FF,MASK_REG));
    program.add_inst(SMC_AND(MASK_REG, X_I_ROW, X_I_ROW));
    // Put X_I into DRAM[X_I_ROW]
    program.add_inst(SMC_LI(0, COL_ADDRESS_REG));
    program.add_below(PRE(BAR, 0, 0));
    program.add_below(ACT(BAR, 0, X_I_ROW, 0));
    // Fill entire row with wide reg:
    program.add_inst(SMC_LI(0, WRITE_LOOP_IDX));
    program.add_inst(SMC_LI(128, WRITE_LOOP_SIZE)); //Length of X - X is 3 bits
    program.add_label("WRITE_ROW_LOOP");
      program.add_inst(SMC_WRITE(BAR, 0, COL_ADDRESS_REG, 1, 0, 0), SMC_NOP(), SMC_NOP(), SMC_NOP());
      program.add_inst(all_nops()); // Maybe too much NOPs
      program.add_inst(SMC_ADDI(WRITE_LOOP_IDX, 1, WRITE_LOOP_IDX));
    program.add_branch(program.BR_TYPE::BL, WRITE_LOOP_IDX, WRITE_LOOP_SIZE, "WRITE_ROW_LOOP");
   program.add_inst(SMC_ADDI(LOOP_IDX, 1, LOOP_IDX));
  program.add_branch(program.BR_TYPE::BL, LOOP_IDX, LOOP_SIZE, "WRITE_X_LOOP");

  //////////////////////////////
  // 2. W * X (single row)    //
  //////////////////////////////
  int W_COL_IDX = R4;
  int W_COL_SIZE = R5;
  int W_ROW_IDX = R6;
  int W_ROW = R7;
  int MOD6 = R8;
  int MASK_REG = R9;
  int W_BIT = R10;
  int DIRTY_REG = R11;
  int ACT_R1 = R12;
  int ACT_R2 = R13;
  
  program.add_inst(SMC_LI(0, W_ROW_IDX));
  program.add_inst(SMC_LD(W_ROW_IDX, W_OFFSET, W_ROW));
  program.add_inst(SMC_LI(0, W_COL_IDX));
  program.add_inst(SMC_LI(6, W_COL_SIZE)); /*Length of X + comp - X is 3 bits*/
  program.add_inst(SMC_LI(0, MOD6));
  program.add_inst(SMC_LI(0, 0x80000000)); /* 100...00*/
  program.add_label("LOOP_ON_W_ROW");
    program.add_inst(SMC_AND(MASK_REG, W_ROW, W_BIT));
    program.add_inst(SMC_LI(0, DIRTY_REG));
    program.add_branch(program.BR_TYPE::BEQ, DIRTY_REG, W_BIT, "SKIP_X");
      program.add_inst(SMC_LD(W_COL_IDX, DATA_ROWS_MAP_OFFSET, DIRTY_REG));


    program.add_label("SKIP_X");
    program.add_inst(SMC_SRC(MASK_REG, MASK_REG)); // (cyclic) Shift mak reg 1 bit to right - prepare for next
    program.add_inst(SMC_ADDI(W_COL_IDX, 1, W_COL_IDX));
  program.add_branch(program.BR_TYPE::BL, W_COL_IDX, W_COL_SIZE, "LOOP_ON_W_ROW");




  // Read data out - for debug:
  program.add_below(rdRow_immediate_label(BAR, X0, 1));
  program.add_below(rdRow_immediate_label(BAR, X0_NOT, 2));
  program.add_below(rdRow_immediate_label(BAR, X1, 3));
  program.add_below(rdRow_immediate_label(BAR, X1_NOT, 4));
  program.add_below(rdRow_immediate_label(BAR, X2, 5));
  program.add_below(rdRow_immediate_label(BAR, X2_NOT, 6));


  /*

  SMC_LI()
  SMC_LD(rb, offsete, rt)
  srand((unsigned) time(NULL));
  int random = rand();
  // Next 3 rows - some kind of initialization. Whe PRE needed?
  program.add_inst(all_nops());
  program.add_inst(all_nops());
  program.add_below(PRE(BAR, 0, 0));
  // For testing only - fill checked rows with damka pattern:
  for (size_t i = 0; i < 3; i++)
  {
    program.add_below(wrRow_immediate_label(BAR, g_aside_rows[i], DAMKA, random));
  }
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

  for (int row_i = 0; row_i < weights.size(); row_i++)
  {
    for (int col_i = 0; col_i < 3; col_i++)
    {
      program.add_below(xnor_and_copy(weights[row_i][col_i], x_rows[2*col_i], x_rows[2*col_i+1], col_i));
    }
  
    program.add_below(maj3());
  
    program.add_below(row_copy(g_comp_rows[0], g_aside_rows[row_i]));
  }
  
  // read out the aside rows for validation:
  for (int i = 0; i < weights.size(); i++)
  {
    random = rand();
    program.add_below(rdRow_immediate_label(BAR, g_aside_rows[i], random));
  }
  */
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
    printf("Usage: \n ./nn <bank_id> <out_file>\n");
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
/*
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
*/
Program program = bnn_prog(bank_id);
platform.execute(program);
std::cout << "DEBUG: exit DRAM Bender program" << std::endl;

// Read out data
uint8_t row[8192];  
// Retrieve 8192 bytes from the FPGA buffer (which is filled with content read from DRAM
for (int i = 0; i < 6; i++)
{
  std::cout << "DEBUG: start of ask data from FPGA" << std::endl;
  platform.receiveData((void*)row, 8192);
  std::cout << "DEBUG: end of ask data from FPGA" << std::endl;
  for (int j = 0; j < 8192; j++)
  {
    out_file << std::to_string(row[j]) << endl;
  }
}

out_file.close();

return 0;
}