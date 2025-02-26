import subprocess
import os
import pandas as pd
import helper_functions as hf
import argparse
import warnings
import time

# Ignore warnings to keep output clean
warnings.simplefilter(action='ignore')

# Parse command-line arguments
parser = argparse.ArgumentParser()
#module type
parser.add_argument('--module', type=str, required=True, help='Module type: hytgXX, hyttXX')
parser.add_argument('--apps_path', type=str, required=True, help='Path to the DSN_AE_APPS directory')
args = parser.parse_args()
module = args.module
apps_path = args.apps_path

# Define paths for executables and files
exe_path ="MAJ3/"
exe_file ="maj-exe"
open_rows_file_name = apps_path + exe_path + "open_rows.txt"
r_frac_idx_file_name = apps_path + exe_path + "r_frac_indices.txt"
out_file = apps_path + exe_path + "maj.txt"

# Remove the output file if it exists
os.system(f'rm {out_file}')

# # Read the CSV file containing open rows information
# or_csv = f'{apps_path}../../../../experimental_data/{module}/open_rows.csv'
# or_df = pd.read_csv(or_csv)

# Create the patterns directory if it doesn't exist
# try:
#     os.mkdir(apps_path + exe_path + 'patterns')
# except:
#     pass

# Perform a full reset of the board before execution
os.system(f'{apps_path}../ResetBoard/full_reset.sh')


# Define variables for stability iterations
# stability_iter_count = 1000
pattern_file_name = "kuku" # this isnt actually used in the CPP
num_iters = 1 # Should be number of repeats of coverage test, but seems to bug out if isn't equal to 1
majX = 3
bank_id = 0
n_frac_times = 3
t_frac = 0 # consider t_frac = 1

# Specify the rows you want to perform MAJ3 on manually
r1, r2 = (246, 376) #Best 6 (408,665) # Best for 4 rows MAJ3 (540,544)
t12, t23 = (1, 0) # Best For 4 rows MAJ3: (1,0)
selected_rows = [240, 246, 248, 254, 368, 374, 376, 382]#Best 6 [152, 153, 408, 409, 664, 665] # Best For 4 rows MAJ3:[536, 540, 544, 548]
hf.write_to_file(selected_rows, open_rows_file_name)

# # Set up MAJ3 parameters - Ensure we are performing MAJ3
# majX = 3
# r_frac_idx = [i for i in range(len(selected_rows) % majX)]

# Remove existing pattern files before generating new ones
# os.system('rm ./patterns/*')

# Generate binary patterns for MAJ3
# for i, pattern in enumerate(range(1, 2**majX - 1)):
#     wr_pattern = hf.maj_all_1_0_pattern_creator(len(selected_rows), majX, r_frac_idx, pattern)
#     pattern_file_name = apps_path + exe_path + f'./patterns/pattern_{i}.txt'
#     hf.write_to_file(wr_pattern, pattern_file_name)

print(f'Performing MAJ3 on selected rows: {selected_rows}')

# Construct command to execute maj-exe with necessary parameters
cmd = (
    apps_path + exe_path + exe_file + " " +
    str(pattern_file_name) + " " +
    str(r_frac_idx_file_name) + " " +
    str(r1) + " " + str(r2) + " " +
    str(min(selected_rows)) + " " + str(max(selected_rows)) + " " +
    str(len(selected_rows)) + " " + str(open_rows_file_name) + " " +
    str(num_iters) + " " + str(bank_id) + " " +
    str(majX) + " " + str(t12) + " " + str(t23) + " " +
    str(n_frac_times) + " " + str(t_frac) + " " + str(out_file)
)

# Execute the command and capture output
sp = subprocess.run([cmd], shell=True, check=True, stdout=subprocess.PIPE, universal_newlines=True)

# Read and print results if output file is not empty
# if os.stat(out_file).st_size != 0:
#     res_lst = hf.read_result_file(out_file)
#     print(f'MAJ3 Results: {res_lst}')

#  # Compute expected MAJ3 result from patterns
#     patterns = []
#     for i in range(len(selected_rows)):
#         with open(f"{apps_path}{exe_path}patterns/pattern_{i}.txt", "r") as f:
#             patterns.append(int(f.readline().strip()))  # Convert to integer

#     def software_maj3(patterns, r_frac_idx):
#         n_patterns = len(patterns)
#         bit_maj = []
#         for j in range(32):  # Iterate over 32-bit values
#             temp = 0
#             for i in range(n_patterns):
#                 temp += (patterns[i] >> j) & 0x1  # Count 1s in each bit position
#             for i in r_frac_idx:
#                 temp -= (patterns[i] >> j) & 0x1  # Remove faulty bits
#             inp_size = n_patterns - len(r_frac_idx)
#             bit_maj.append(1 if temp > inp_size / 2 else 0)  # Majority rule
#         return bit_maj

#     expected_maj_result = software_maj3(patterns, r_frac_idx)
#     print(f'Expected MAJ3 Result (Software Computed): {expected_maj_result}')

#     # Compare software vs hardware result
#     if res_lst == expected_maj_result:
#         print("✅ MAJ3 SUCCESS: Hardware matches expected software result.")
#     else:
#         print("❌ MAJ3 FAILED: Mismatch between software and hardware.")
    
#     os.system(f'rm {out_file}')

    
    

