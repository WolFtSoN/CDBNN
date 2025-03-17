import subprocess
import os
import helper_functions as hf
import warnings
warnings.simplefilter(action='ignore')

def b2i(binary):
    return int(binary, 2)

def d2b(decimal,length):
    return bin(decimal)[2:].zfill(length)

option4order = 0 # A,B,A,B,C,C = 0 | A,A,B,B,C,C = 1

# Generates a pattern for MAJ3 logic following a specific order -> A,B,A,B,C,C = MAJ3(A,B,A,B,C,C)
def maj_all_1_0_pattern_creator(n_open_rows, input_size, r_frac_idx, pattern):
    
    # Convert pattern number to binary string (padded to input_size length)
    pattern_str = d2b(pattern, input_size)

    # Convert each binary bit to a 32-bit integer representation
    lst = [4294967295 if bit == '1' else 0 for bit in pattern_str]

    if option4order == 0:
        # Ensure specific ordering: A,B,A,B,C,C -> 99.96%
        if input_size == 3 and n_open_rows == 6:  # Ensuring correct size
            ordered_lst = [lst[0], lst[1], lst[0], lst[1], lst[2], lst[2]]
        else:
            ordered_lst = lst * (n_open_rows // input_size)  # Expand to fill n_open_rows
    elif option4order == 1:
        # Ensure specific ordering: A,A,B,B,C,C -> 99.99%
        if input_size == 3 and n_open_rows == 6:  # Ensuring correct size
            ordered_lst = [lst[0], lst[0], lst[1], lst[1], lst[2], lst[2]]
        else:
            ordered_lst = lst * (n_open_rows // input_size)  # Expand to fill n_open_rows
    
    return ordered_lst



try:
    os.mkdir('patterns')
except:
    pass

majX = 3
rows = 6

r_frac_idx = [i for i in range(rows%majX)] # The index of the frac row

os.system('rm ./patterns/*')
for i,pattern in enumerate(range(1,2**majX-1)):
    wr_pattern = maj_all_1_0_pattern_creator(rows,majX,r_frac_idx,pattern)
    print(f"input pattern: {pattern}, generated: {wr_pattern}")
    pattern_file_name = f'./patterns/pattern_{i}.txt'
    hf.write_to_file(wr_pattern,pattern_file_name)




