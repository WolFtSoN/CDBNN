import numpy as np
import util as utl
import subprocess
import os
from scipy.io import loadmat

# MAJ function
def MAJ(a, b, c):
    return (a & b) | (a & c) | (b & c)

cpp_out_total = None
# Load the input and weight matrices from results.mat file
data = loadmat('results.mat')

# Extract specific matrices
w_mat = data['weights']     # Now w contains the weights matrix
x_mat = data['example_0']   # Now x contains the input matrix
x_mat = x_mat[:16, :]           # Take only 16 rows of the input matrix -> We make 32 duplicates of each row(X) so that the total number of rows is 512

print(f'x: {x_mat.shape}')
print(f'w: {w_mat.shape}')

# Transpose x_mat to be 128 x 16
x_mat = x_mat.T

print(f'x.T: {x_mat.shape}')


# Dimnesions of input layer, output layer
in_dim = x_mat.shape[1]
out_dim = 1
batch_size = 512

# Define parameters
n_duplicated = 32
flip_prob = 0.3


utl.write_matrix_to_file(x_mat, "input.txt")

# Write w as matrix to file
utl.write_matrix_to_file(w_mat, "weights.txt")


# Run on each row of the weights matrix 
for r in range(w_mat.shape[0]):

    # Write the first row of the weights matrix to a file
    w_row = w_mat[r]

    utl.write_vector_to_file(w_row, "weights_row.txt")



    # Maj of Maj to check intermediate results -> (MAJ(MAJ))
    y = x_mat
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
                y = np.append(y, num * np.ones((1,x_mat.shape[1]), dtype=np.uint8), axis=0) # append the random bit to y
            # print(f'\nY: {y} in hieriarchy after padding: {hieriarchy}')
        else:
            padding = 0
        
        y_maj = []
        for i in range(0, len_y, 3): # for each 3 elements in y
            if hieriarchy == 1:
                if w_mat[r][i] == 1: 
                    a = y[i]
                else:
                    a = 1 - y[i]

                if i+1 >= in_dim:
                    b = y[i+1]
                else:
                    if w_mat[r][i+1] == 1:
                        b = y[i+1]
                    else:
                        b = 1 - y[i+1]

                if i+2 >= in_dim:
                    c = y[i+2]
                else:
                    if w_mat[r][i+2] == 1:
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


    # Run make file:
    print("\nRun make (compile CPP):")
    sp = subprocess.run(["make"], shell=True, check=True)

    out_file = f"./cpp_out.txt"
    os.system(f'rm {out_file}')
    os.system(f'touch {out_file}')
    bank_id = 0
    cmd = ("./bnn-exe" + " " + str(bank_id) + " " + str(out_file))
    # sp = subprocess.run([cmd], shell=True, check=True, stdout=subprocess.PIPE, universal_newlines=True)
    sp = subprocess.run([cmd], shell=True, check=True)


    # Read cpp_out.txt
    res_cpp_out = utl.read_from_file(out_file)
    res_cpp_out = np.array(res_cpp_out, dtype=np.uint32).reshape(-1, 1)

    # # Unpack to bits – each uint8 becomes 8 bits (MSB first by default)
    # res_cpp_out = ((res_cpp_out[:, None] >> np.arange(31, -1, -1)) & 1).astype(np.uint8)
    # res_cpp_out = res_cpp_out.flatten()

    if cpp_out_total is None:
        cpp_out_total = res_cpp_out
    else:
        cpp_out_total = np.hstack((cpp_out_total, res_cpp_out))


row_sums = np.sum(cpp_out_total, axis=1)
cpp_out_total = np.hstack((cpp_out_total, row_sums.reshape(-1, 1)))
print(f'cpp_out_total: {cpp_out_total.shape}')



# Write the output to a file
utl.write_matrix_to_file(cpp_out_total, "output.txt")
