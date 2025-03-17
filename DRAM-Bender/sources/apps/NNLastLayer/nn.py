import numpy as np
import util as utl
import subprocess
import os

# gen input file
# format for input:
# list of 32b (512b?) words represnting X
# another file for W:
## Stage 1: binary, row by row.
## Stage 2: denser format (32b words?) for better space efficiency - if needed

# Dimnesions of input layer, output layer
in_dim = 3
out_dim = 3

#Generate input vector X, and wight matrix W. output y = W*x
x = np.random.randint(0, 2, size=in_dim)
# x = np.array([0, 1, 0])
print("Random Bit Vector x:", x)
# Expand and interleave negations
x_comp = np.repeat(x, 2).reshape(-1, 2)
x_comp[:, 1] = 1 - x_comp[:, 0]
# Flatten back into a 1D array
x_comp = x_comp.flatten()
# to 32bit values
x_32b = x_comp * (2 ** 32 - 1)

utl.write_to_file(x_32b, "input_layer.txt")

W = np.random.randint(0, 2, size=(out_dim, in_dim))
# W = np.array([[1, 1, 1], [1, 1, 1], [1, 1, 1]])
print("Random Bit Matrix W:\n", W)
utl.write_matrix_to_file(W, "weights_matrix.txt")

# Golden model
# Use 1, -1 weights, and compare to a threshold of 0
expected_result = (np.dot(2*W-1,2*x.T -1) > 0) * 1

print("Multiplication result:")
print(expected_result)

# send to DRAM Bender and check results

# Run make file:
print("Run make (compile CPP):")
sp = subprocess.run(["make"], shell=True, check=True)

out_file = "./cpp_out.txt"
os.system(f'rm {out_file}')
os.system(f'touch {out_file}')
bank_id = 0
cmd = ("./nn-exe" + " " + str(bank_id) + " " + str(out_file))
# sp = subprocess.run([cmd], shell=True, check=True, stdout=subprocess.PIPE, universal_newlines=True)
sp = subprocess.run([cmd], shell=True, check=True)

# if(os.stat(out_file).st_size != 0):
#     res_lst = (hf.read_result_file(out_file))
#     temp_data = [[t_12,t_23,n_frac_times,t_frac,bank_id, r_first, r_second, s_id, majX, res_lst[0], res_lst[1], res_lst[2], res_lst[3]]]
#     df = pd.DataFrame(temp_data, columns=['t_12','t_23','n_frac_times','t_frac','bank_id','r_first','r_second','s_id','majX','avg_coverage','full_coverage_cells','avg_stability','full_stable_cells'])
#     df.to_csv(csv_file, mode='a', header=False)
#     os.system(f'rm {out_file}')