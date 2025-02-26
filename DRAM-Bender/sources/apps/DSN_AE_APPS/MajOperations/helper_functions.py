import warnings
warnings.simplefilter(action='ignore', category=FutureWarning)

def b2i(binary):
    return int(binary, 2)

def d2b(decimal,length):
    return bin(decimal)[2:].zfill(length)

def maj_all_1_0_pattern_creator(n_open_rows,input_size,r_frac_idx,pattern): # (rows,majX,r_frac_idx,pattern)
    lst = []
    pattern_str = d2b(pattern, input_size) # Convert pattern from Decimal to Binary
    for i in range(input_size):
        lst.append(b2i(pattern_str[i]*32))
    lst = lst*int((n_open_rows)/input_size) # replicate inputs. e.g. maj3, open = 4 -> inputs appear once
    remaning = n_open_rows - len(lst) # remaining = neutral rows e.g. 1
    for i in range(remaning):
        lst.append(b2i('1'*32)) # insert 1 as place holders for the neutral rows
    if remaning > 1:
        # Swap place with inputs so frac indexes are placed where intended by r_frac_idx
        # (I think this permutes the inputs order also...)
        for lst_idx,i in enumerate(r_frac_idx):    
            #swap with random element
            lst[n_open_rows-remaning+lst_idx] = lst[i]
            lst[i] = b2i('1'*32)
    elif remaning == 1: # TOFIX: merge with general logic
        lst[-1] = lst[r_frac_idx[0]]
        lst[r_frac_idx[0]] = b2i('1'*32)
    return lst

def write_to_file(arr,file_name):
    with open(file_name, 'w') as fp:
        for item in arr:
            # write each item on a new line
            fp.write("%s\n" % item)

def read_result_file(file_name):
    res = []
    with open(file_name, 'r') as fp:
        for item in fp.read().split(','):
            res.append(float(item))
    return res