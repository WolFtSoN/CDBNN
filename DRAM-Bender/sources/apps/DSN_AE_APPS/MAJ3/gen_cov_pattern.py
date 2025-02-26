import subprocess
import os
import helper_functions as hf
import warnings
warnings.simplefilter(action='ignore')

try:
    os.mkdir('patterns')
except:
    pass

majX = 3
rows = 8

r_frac_idx = [i for i in range(rows%majX)] # The index of the frac row

os.system('rm ./patterns/*')
for i,pattern in enumerate(range(1,2**majX-1)):
    wr_pattern = hf.maj_all_1_0_pattern_creator(rows,majX,r_frac_idx,pattern)
    print(f"input pattern: {pattern}, generated: {wr_pattern}")
    pattern_file_name = f'./patterns/pattern_{i}.txt'
    hf.write_to_file(wr_pattern,pattern_file_name)
