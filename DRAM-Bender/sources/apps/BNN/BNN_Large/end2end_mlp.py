# Get inputs:
## 1. input activations (x_dim x batch_size)
## 2. weights array (out_dim x in_dim) - one wieght matrix for each layer

import numpy as np

def chunk_and_pad(arr, chunk_size=81):
    K, batch_size = arr.shape
    pad_len = (-K) % chunk_size  # padding needed on K dimension
    if pad_len > 0:
        pad_shape = ((0, pad_len), (0, 0))  # only pad the K dimension
        arr = np.pad(arr, pad_shape, mode='constant')
    return arr.reshape(-1, chunk_size, batch_size)

def chunk_and_pad_along_input(weights_in, chunk_size=81):
    hidden_dim, input_dim = weights_in.shape
    pad_len = (-input_dim) % chunk_size  # padding needed along input_dim
    if pad_len > 0:
        pad_shape = ((0, 0), (0, pad_len))  # pad only input_dim (axis=1)
        weights_in = np.pad(weights_in, pad_shape, mode='constant')
    # Reshape and move chunk dimension first
    chunks = weights_in.reshape(hidden_dim, -1, chunk_size)
    return np.transpose(chunks, (1, 0, 2))  # (num_chunks, hidden_dim, chunk_size)

rmaj3_size = 81 # we work in chinks of 81 inputs
input_dim = 163 #4096
hidden_dim = 2
output_dim = 10
batch_size = 512 # constant, can't change
dll_duplications = 32 # constant, can't change
dll_batch_size = batch_size/dll_duplications

input_activation = np.ones(shape=(input_dim, batch_size)) 
#np.random.randint(0, 2, size=(input_dim, batch_size)) # Generate a random bit vector of size in_dim
weights_in = np.ones(shape=(hidden_dim, input_dim))
#np.random.randint(0, 2, size=(hidden_dim, input_dim)) # Generate a random weight matrix of size (out_dim x in_dim)
weights_out = np.ones(shape=(output_dim, hidden_dim))
#np.random.randint(0, 2, size=(output_dim, hidden_dim)) # Generate a random weight matrix of size (out_dim x in_dim)

# For each layer:
## Split the input activation into groups of 81
## For each group of 81 inputs, perform XNOR+RMAJ3 (CPP)
## Aggregate results
## input_activation <- results of the previous layer

# input layer
input_chunks = chunk_and_pad(input_activation,rmaj3_size)
input_weights_chunks = chunk_and_pad_along_input(weights_in, rmaj3_size)
for (chunk_input, chunk_weight) in zip(input_chunks,input_weights_chunks):
    print("input activation chunk.shape: ", chunk_input.shape)
    print("input activation chunk: ", chunk_input)
    print("input weights chunk.shape: ", chunk_weight.shape)
    print("input weights chunk: ", chunk_weight)
    ## Call CPP
    ## Aggregate results

# Last layer is done with DLL
