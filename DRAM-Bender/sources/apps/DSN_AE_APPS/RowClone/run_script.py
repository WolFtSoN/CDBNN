import subprocess
import os
import pandas as pd
import warnings
import rowclone_functions as rf
from random import randrange
import argparse
warnings.simplefilter(action='ignore', category=FutureWarning)

parser = argparse.ArgumentParser()
#module type
parser.add_argument('--module', type=str, required=True, help='Module codename, e.g., new_data_tested_module')
parser.add_argument('--apps_path', type=str, required=True, help='Path to the DSN_AE_APPS directory')
args = parser.parse_args()
module = args.module
apps_path = args.apps_path


exe_path ="RowClone/"
exe_file ="row-clone-exe"

exe = apps_path + exe_path + exe_file
out_file = apps_path + exe_path + "row_clone.txt"
rc_csv = apps_path + exe_path + 'row-clone_{2}.csv'
sa_csv = apps_path + exe_path+ 'all_subarrays.csv'

r_first = 0
# Maximal suspected sub-array size (maximal range to search from r_first):
num_rows = 831 # 1024
counter = 0
csv_lst = []

os.system(f'rm {out_file}')
os.system(f'rm {rc_csv}')
os.system(f'rm {sa_csv}')
os.system(f'sudo {apps_path}../ResetBoard/full_reset.sh')

csv_lst = []
# Maximum range in Bank(?) to search in.
while r_first < 832: # 1025
    lst = pd.DataFrame(columns=['r_first','r_second','t_12','t_23'])
    lst.to_csv(rc_csv)
    print(f'Search in {r_first} - {r_first+num_rows}')
    # This (should) check all pairs (r_first, i) in range:
    rf.first_search(lst,r_first,r_first+num_rows,r_first,num_rows,rc_csv,out_file,exe)
    # This returns a list of rows participating in the same subarray as r_first:
    subarray_list = rf.subarray_list(r_first,rc_csv)
    csv_lst.append([len(subarray_list),counter,subarray_list])
    # Start of new subarray is +1 of end of current subarray:
    r_first = subarray_list[-1] + 1

## My code: ##
# processed_rows = set() # Track rows that have been used as r_first
# print(f'processed_rows: {processed_rows}')

# while r_first < 1025:
#     if r_first in processed_rows:
#         r_first += 1 # Ensure each row gets a chance to be first
#         continue

#     lst = pd.DataFrame(columns=['r_first','r_second','t_12','t_23'])
#     lst.to_csv(rc_csv)
#     print(f'Search in {r_first} - {r_first+num_rows}')
#     subarray_list = rf.subarray_list(r_first,rc_csv)
#     csv_lst.append([len(subarray_list), counter, subarray_list])
#     processed_rows.add(r_first)  # Mark this row as checked

#     if len(subarray_list) > 1:
#         r_first = subarray_list[-1] + 1
#     else:
#         r_first += 1  # Move to the next row sequentially
    
csv_lst = pd.DataFrame(csv_lst,columns=['n_rows','group','rows'])
csv_lst.to_csv(sa_csv)


send_file = sa_csv
cp_path = f'{apps_path}../../../../experimental_data/{module}/'          
send_cmd = f'cp -r {send_file} {cp_path}'  
sp = subprocess.run([send_cmd], shell=True, check=True, stdout=subprocess.PIPE, universal_newlines=True)
