import numpy as np
import util as utl
import subprocess
import os
from scipy.io import loadmat


# MAJ function
def MAJ(a, b, c):
    return (a & b) | (a & c) | (b & c)

# Dimnesions of input layer, output layer
in_dim = 81
out_dim = 1 # Currently works only with out_dim = 1
batch_size = 512 # Curently works only with batch_size = 512
row_capacity = 65536
replication_factor = int(65536/512)

num_heuris_same_as_maj = 0
num_dram_same_heuris = 0
num_dram_same_maj = 0
seed_list = []

iters = 100000
for k in range(0, iters):
    # Initilize seed
    np.random.seed(k)
    #Generate input vector X, and wight matrix W. output y = W*x
    x = np.random.randint(0, 2, size=(in_dim,batch_size)) # Generate a random bit vector of size in_dim
    utl.write_matrix_to_file(x, "input.txt")

    W = np.random.randint(0, 2, size=(out_dim, in_dim))
    utl.write_matrix_to_file(W, "weights_matrix.txt")

    # Golden models
    # Actual MAJ (dot product + threshold)
    # Use 1, -1 weights, and compare to a threshold of 0
    expected_result = (np.dot(2*W-1,2*x -1) > 0) * 1

    # Golden model for recursive MAJ3
    # Maj of Maj to check intermediate results -> (MAJ(MAJ))
    y = x
    # padding -> the amount of dummy inputs needed to make the number of inputs a multiple of 3
    pad_file = "padding.txt"
    padding_list = []

    len_y = y.shape[0]

    # Step 1: XNOR with weights:
    for i in range(0, len_y): # for each 3 elements in y
        if W[0][i] == 1:
            y[i] = y[i]
        else:
            y[i] = 1 - y[i]

    # Step 2: MAJ3 reductions recursively
    while len_y > 1: # Continue until all MAJ3 levels are done
        if len_y % 3 != 0: # if the number of elements in y is not a multiple of 3
            padding = 3 - len(y) % 3 # calculate the padding needed
            for i in range(padding):
                # Generate a random bit 
                num = np.random.randint(0, 2, size=1)
                padding_list.append(int(num))
                y = np.append(y, num * np.ones((1,batch_size), dtype=np.uint8), axis=0) # append the random bit to y
        else:
            padding = 0
        
        y_maj = []
        for i in range(0, len_y, 3): # for each 3 elements in y
            y_maj.append(MAJ(y[i], y[i+1], y[i+2]))
        y = y_maj # update y
        len_y = len(y)

    # Write padding to file (for consistency we use same padding in DRAM and Python)
    utl.write_to_file(padding_list, pad_file)

    # send to DRAM Bender and check results

    # Run make file:
    print("\nRun make (compile CPP):")
    sp = subprocess.run(["make"], shell=True, check=True)
    bank_id = 0
    skip_comp = 0
    trace_power = 0
    dll = 0
    runs = 1
    cmd = ("./bnn-exe" + " " + str(bank_id) + " " + str(skip_comp) + " " + str(trace_power) + " " + str(dll) + " " + str(runs))
    sp = subprocess.run([cmd], shell=True, check=True)

    # Read cpp_out.txt
    out_file = "cpp_output/output.txt"
    res_cpp_out = utl.read_from_file(out_file)
    res_cpp_out = np.array(res_cpp_out, dtype=np.uint32)

    # accomodate input replication 512 -> 65536
    y = np.tile(y, (1, replication_factor))
    expected_result = np.tile(expected_result, (1, replication_factor))  
    if ((~(y[0] == res_cpp_out)).any()):
        seed_list.append(k)
    
    # Statistics for expected result and Golden MAJ(maj) result
    num_heuris_same_as_maj = num_heuris_same_as_maj + np.sum(expected_result == y[0])
    num_dram_same_heuris = num_dram_same_heuris + np.sum(y[0] == res_cpp_out)
    num_dram_same_maj = num_dram_same_maj + np.sum(expected_result == res_cpp_out)


percentage_heu_maj = num_heuris_same_as_maj / (iters * row_capacity) * 100
percentage_dram_heu = num_dram_same_heuris / (iters * row_capacity) * 100
percentage_dram_maj = num_dram_same_maj / (iters * row_capacity) * 100


# print(f'\nSeed list for which the results are not matching: {seed_list}')
print(f'\nHeuristic vs Real MAJ: {percentage_heu_maj}\n')
print(f'\nHeuristic vs DRAM: {percentage_dram_heu}\n')
print(f'\nDRAM vs Real MAJ: {percentage_dram_maj}\n')