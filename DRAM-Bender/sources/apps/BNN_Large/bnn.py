import numpy as np
import util as utl
import subprocess
import os
from scipy.io import loadmat


# MAJ function
def MAJ(a, b, c):
    return (a & b) | (a & c) | (b & c)

# gen input file
# format for input:
# list of 32b (512b?) words represnting X
# another file for W:
## Stage 1: binary, row by row.
## Stage 2: denser format (32b words?) for better space efficiency - if needed

# Dimnesions of input layer, output layer
in_dim = 128
out_dim = 1
batch_size = 512

num_heuris_same_as_maj = 0
num_dram_same_heuris = 0
num_dram_same_maj = 0
seed_list = []


iters = 2
for k in range(0, iters):
    # Initilize seed
    np.random.seed(k)
    #Generate input vector X, and wight matrix W. output y = W*x
    # x = np.random.randint(0, 2, size=in_dim)
    x = np.random.randint(0, 2, size=(in_dim,batch_size)) # Generate a random bit vector of size in_dim
    inverted_x = 1 - x                                    # Invert the random bit vector
    # Stack original and inverted rows to form a 128x2 row structure
    final_matrix = np.zeros((in_dim * 2, batch_size),dtype=np.uint8)

    for i in range(in_dim):
        final_matrix[i * 2, :batch_size] = x[i]  # Original row
        final_matrix[i * 2 + 1, :] = inverted_x[i]  # Inverted row next to it
        
    # for i in range(in_dim):
    #     final_matrix

    # Convert each 32-bit chunk to an integer
    final_matrix_32b = np.zeros((in_dim * 2, int(batch_size/32)), dtype=np.uint32)
    for i in range(in_dim * 2):
        for j in range(int(batch_size/32)):
            # Convert every 32-bit segment to an integer
            bits = final_matrix[i, j * 32:(j + 1) * 32]
            final_matrix_32b[i, j] = int("".join(map(str, bits)), 2)

    # print(f'final_matrix_32b: {final_matrix_32b}')
    # x = np.array([1, 1, 0, 1, 1, 1, 0, 0, 1])
    # print("Random Bit Vector x:", x)
    # Expand and interleave negations
    x_comp = np.repeat(x, 2).reshape(-1, 2) # repeat each element twice for complementary
    x_comp[:, 1] = 1 - x_comp[:, 0]
    # Flatten back into a 1D array
    x_comp = x_comp.flatten()
    # to 32bit values
    # x_32b = x_comp * (2 ** 32 - 1)

    # utl.write_to_file(x, "input_layer.txt")
    utl.write_matrix_to_file(final_matrix_32b, "input_layer.txt")

    # utl.write_matrix_to_file(x_mat, "input_layer.txt")

    W = np.random.randint(0, 2, size=(out_dim, in_dim))
    # W = np.array([[0, 1, 0, 0, 1, 0, 0, 0, 1]])
    # print("Random Bit Matrix W:\n", W)
    utl.write_matrix_to_file(W, "weights_matrix.txt")

    # Golden model
    # Use 1, -1 weights, and compare to a threshold of 0

    expected_result = (np.dot(2*W-1,2*x -1) > 0) * 1

    # Maj of Maj to check intermediate results -> (MAJ(MAJ))
    y = x
    hieriarchy = 1 # number of hieriarchies
    # padding -> the number of times we need to copy 0 or 1 to make the number of elements in y a multiple of 3 in memory
    padd_file = "padding.txt"
    padding_list = []

    len_y = y.shape[0]

    # print(f'\nY: {y} in hieriarchy: {hieriarchy}')
    while len_y > 1: # while there are more than 1 element in y
        if len_y % 3 != 0: # if the number of elements in y is not a multiple of 3
            padding = 3 - len(y) % 3 # calculate the padding needed
            for i in range(padding):
                # Generate a random bit 
                num = np.random.randint(0, 2, size=1)
                padding_list.append(int(num))
                y = np.append(y, num * np.ones((1,batch_size), dtype=np.uint8), axis=0) # append the random bit to y
            # print(f'\nY: {y} in hieriarchy after padding: {hieriarchy}')
        else:
            padding = 0
        
        y_maj = []
        for i in range(0, len_y, 3): # for each 3 elements in y
            if hieriarchy == 1:
                if W[0][i] == 1: 
                    a = y[i]
                else:
                    a = 1 - y[i]

                if i+1 >= in_dim:
                    b = y[i+1]
                else:
                    if W[0][i+1] == 1:
                        b = y[i+1]
                    else:
                        b = 1 - y[i+1]

                if i+2 >= in_dim:
                    c = y[i+2]
                else:
                    if W[0][i+2] == 1:
                        c = y[i+2]
                    else:
                        c = 1 - y[i+2] 

                y_maj.append(MAJ(a, b, c)) # MAJ of 3 elements
            else:
                y_maj.append(MAJ(y[i], y[i+1], y[i+2]))
                # print(f'y_major: {y_maj}')
        y = y_maj # update y
        len_y = len(y)
        hieriarchy += 1
        # print(f'Y: {y} in hieriarchy {hieriarchy}')


    # Write padding to file
    utl.write_to_file(padding_list, padd_file)

    # send to DRAM Bender and check results

    # Run make file:
    print("\nRun make (compile CPP):")
    sp = subprocess.run(["make"], shell=True, check=True)

    out_file = "./cpp_out.txt"
    os.system(f'rm {out_file}')
    os.system(f'touch {out_file}')
    bank_id = 0
    cmd = ("./bnn-exe" + " " + str(bank_id) + " " + str(out_file))
    # sp = subprocess.run([cmd], shell=True, check=True, stdout=subprocess.PIPE, universal_newlines=True)
    sp = subprocess.run([cmd], shell=True, check=True)

    # print("\nMultiplication result:")
    # print(expected_result[0])

    # print("\nGolden for MAJ(maj):")
    # print(y[0])

    # Read cpp_out.txt
    res_cpp_out = utl.read_from_file(out_file)
    res_cpp_out = np.array(res_cpp_out, dtype=np.uint32)
    # Unpack to bits – each uint8 becomes 8 bits (MSB first by default)
    res_cpp_out = ((res_cpp_out[:, None] >> np.arange(31, -1, -1)) & 1).astype(np.uint8)
    res_cpp_out = res_cpp_out.flatten()
    # print("\nMAJ(maj) from DRAM:")
    # print(res_cpp_out)
    # print("Comparison:")
    # Compare results between Golden MAJ(maj) result and cpp_out.txt
    # print(1*(y[0] == res_cpp_out))
    if ((~(y[0] == res_cpp_out)).any()):
        seed_list.append(k)
    
        
    # Statistics for expected result and Golden MAJ(maj) result
    # if (expected_result == y[0]):
    num_heuris_same_as_maj = num_heuris_same_as_maj + np.sum(expected_result == y[0])
    num_dram_same_heuris = num_dram_same_heuris + np.sum(y[0] == res_cpp_out)
    num_dram_same_maj = num_dram_same_maj + np.sum(expected_result == res_cpp_out)


percentage_heu_maj = num_heuris_same_as_maj / (iters * batch_size) * 100
percentage_dram_heu = num_dram_same_heuris / (iters * batch_size) * 100
percentage_dram_maj = num_dram_same_maj / (iters * batch_size) * 100


print(f'\nSeed list for which the results are not matching: {seed_list}')
print(f'\nHeuristic vs Real MAJ: {percentage_heu_maj}\n')
print(f'\nHeuristic vs DRAM: {percentage_dram_heu}\n')
print(f'\nDRAM vs Real MAJ: {percentage_dram_maj}\n')