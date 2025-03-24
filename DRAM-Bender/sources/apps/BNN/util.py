def write_to_file(arr,file_name):
    with open(file_name, 'w') as fp:
        for item in arr:
            # write each item on a new line
            fp.write("%s\n" % item)

def write_matrix_to_file(matrix, file_name):
    with open(file_name, 'w') as fp:
        for row in matrix:
            fp.write(",".join(map(str, row)) + "\n")

def read_from_file(file_name):
    arr = []
    try:
        with open(file_name, 'r') as fp:
            for line in fp:
                arr.append(int(line.strip()))  # Convert to int and remove whitespace
    except Exception as e:
        print(f"Error reading file {file_name}: {e}")
    return arr