import numpy as np
import random
 
LenX = 8 # Length of X vectors (in bits)
# ========================= X & W GENERATION =========================
def generate_x(N, binary=False):
    """
    Generates N X vectors, either as decimal numbers or 32-bit binary strings.
    
    Parameters:
    N (int): Number of elements in X.
    binary (bool): If True, stores X as binary strings. Otherwise, stores as decimal.
    
    Returns:
    List of X values (either as binary strings or integers).
    """
    X = [random.randint(0, 2**LenX - 1) for _ in range(N)]  # Random 32-bit values
    if binary:
        return [f"{x:032b}" for x in X]
    return X  # Return as decimal values


def generate_w(M, N):
    """
    Generates a binary W matrix of shape (M, N).
    
    Parameters:
    M (int): Number of rows in W.
    N (int): Number of columns in W (matches X size).
    
    Returns:
    2D NumPy array of binary values (0 or 1).
    """
    return np.random.randint(0, 2, size=(M, N))


def save_to_file(data, filename):
    """ Saves a list or 2D matrix to a file. """
    with open(filename, "w") as f:
        if isinstance(data, list):
            for item in data:
                f.write(str(item) + "\n")
        else:  # If it's a matrix
            for row in data:
                f.write(" ".join(map(str, row)) + "\n")

# ========================= MAIN EXECUTION =========================

N = 32   # Number of X elements (columns in W)
M = 10   # Number of rows in W

# Generate and save X and W
X = generate_x(N, binary=False)  # Generate X in decimal
W = generate_w(M, N)  # Generate W in binary

save_to_file(X, "X.txt")
save_to_file(W, "W.txt")

print("X.txt and W.txt generated!")