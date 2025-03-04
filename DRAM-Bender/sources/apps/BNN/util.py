def write_to_file(arr,file_name):
    with open(file_name, 'w') as fp:
        for item in arr:
            # write each item on a new line
            fp.write("%s\n" % item)
