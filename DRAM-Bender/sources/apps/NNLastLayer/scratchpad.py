import numpy as np
import random
from numpy import size

# SEED
random.seed(1)

X_bits = 3 # Length of X vectors (in bits) | Also the number of columns in W matrix
Num_of_X_vectors = 1 # Number of X vectors (rows) 
Num_of_W_rows = 3 # Number of rows in W matrix

# def load_data_rows(d_file):
#     """
#     Load data rows from a txt file
#     """
#     with open(d_file, "r") as f:
#         # get the rows where the computation is 24
#         data_rows = [int(line.split()[10]) for line in f.readlines()]
#     return data_rows

def load_data_rows(d_file):
    """
    Extracts 'Data Row' values from lines where 'Computation Row: 24' exists.
    """
    data_rows = []
    routing_rows = []
    comp_row = []

    with open(d_file, "r") as f:
        for line in f:
            if "Main Routing Row: 24" in line or "Main Routing Row: 88" in line or "Main Routing Row: 136" in line or "Main Routing Row: 25" in line or "Main Routing Row: 89" in line:
                parts = line.split("->")  # Split by "->"
                data_part = parts[0].strip()  # Extract "Data Row: X"
                routing_part = parts[1].strip()  # Extract "Level 2 Routing Row: Y"
                # comp_part = parts[2].strip()  # Extract "Main Routing Row: Z"

                # Extract the numeric value after "Data Row:"
                data_value = int(data_part.split(":")[1].strip())
                routing_value = int(routing_part.split(":")[1].strip())
                # comp_value = int(comp_part.split(":")[1].strip())

                data_rows.append(data_value)
                routing_rows.append(routing_value)
                # comp_row.append(comp_value)
                # print(f"line: {line}")
                # print(f"data_value: {data_value} | routing_value: {routing_value} | comp_row: {comp_row}")
                print(f"data_value: {data_value} | routing_lvl2_value: {routing_value}")

    return (data_rows, routing_rows)

def generate_mif(x_file, w_file, output_file="memory.mif", d_file="../DSN_AE_APPS/FunctionalRowCopy/map_routing_rows.txt"):
    """
    Generates a MIF file for Vivado using X vectors and W matrix
    """
    
    depth = 1024  # Memory depth limited to 1024
    width = 32   # 32-bit width

    with open(output_file, "w") as f:
        # MIF Header
        f.write(f"DEPTH = {depth};\n")
        f.write(f"WIDTH = {width};\n")
        f.write("ADDRESS_RADIX = HEX;\n")
        f.write("DATA_RADIX = BIN;\n\n")
        f.write("CONTENT BEGIN\n")
        f.write("MSB -> LSB\n")

    # ======================= Handle X ======================= #
        # Store X vectors in DRAM (each row stores 32-bit values)
        x_arr = np.zeros((Num_of_X_vectors,X_bits))
        for i in range(size(x_arr,0)):
            for j in range(size(x_arr,1)):
                x_arr[i,j] = int(random.randint(0,1))
        # print(f'first row of x_arr before transpose: {x_arr[0]}')
        x_arr = np.transpose(x_arr)
        # print(f'x_arr: {x_arr}')
        

        for i, x_bin in enumerate(x_arr):
            x_bin = "".join(map(str, x_bin.astype(int)))  # Convert NumPy row to a binary string
            # print(f"x_bin: {x_bin}")
            f.write(f"  {i} : {x_bin.zfill(32)}; -- x{i+1}\n")
            # f.write(f"  {i*2+1:04X} : {x_neg_bin.zfill(32)}; -- ~x{i+1}\n")
    
    # ======================= Handle W ======================= #
        # Create W matrix 
        W = np.zeros((Num_of_W_rows, X_bits)) # X_bits is the number of columns in W matrix
        for i in range(size(W,0)):
            for j in range(size(W,1)):
                W[i,j] = int(random.randint(0,1))

        print(f'W: {W}')

        # Store W matrix
        addr_W_start = X_bits
        jump = (X_bits // 4) if X_bits > 3 else 1 # Jump 4 bits at a time if X_bits > 3
        part = 0
        sp_row_counter = 0
        for i, row in enumerate(W):
            # print(f'row {i}: {row}')
            # write len(row)/4 elements per row in W matrix
            if jump > 1:
                for j in range(0,len(row),jump):
                    part += 1
                    sp_row_counter += 1
                    row_bin = "".join(map(str, row[j:j+jump].astype(int)))  # Convert NumPy row to a binary string
                    f.write(f"  {addr_W_start + i + sp_row_counter} : {row_bin.zfill(32)}; -- W row {i+1} | part {part}\n")
                part = 0
            else:
                row_bin = "".join(map(str, row.astype(int)))
                f.write(f"  {addr_W_start + i} : {row_bin.zfill(32)}; -- W row {i+1}\n")

        # ======================= Handle Data & Routing ======================= #
        (data_rows, routing_rows) = load_data_rows(d_file)
        # print(f"data_rows: {data_rows}")
        print(f"Number of data rows: {len(data_rows)}")

        f.write("END;\n")

    print(f"MIF file '{output_file}' successfully generated!")


# ======================= Main ======================= #

generate_mif("X.txt", "W.txt", "sp.mif")
