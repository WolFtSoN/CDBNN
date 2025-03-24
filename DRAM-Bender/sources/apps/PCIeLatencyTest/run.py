import numpy as np
import util as utl
import subprocess
import os

bank_id = 0

# Run make file:
print("\nRun make (compile CPP):")
sp = subprocess.run(["make"], shell=True, check=True)

out_file = "./cpp_out.txt"
os.system(f'rm {out_file}')
os.system(f'touch {out_file}')
cmd = ("./latency_test" + " " + str(bank_id) + " " + str(out_file))
sp = subprocess.run([cmd], shell=True, check=True)
