import subprocess
import os
import pandas as pd
import helper_functions as hf
import argparse
import warnings
import time
warnings.simplefilter(action='ignore')


parser = argparse.ArgumentParser()
#module type
parser.add_argument('--module', type=str, required=True, help='Module type: hytgXX, hyttXX')
# parser.add_argument('--temperature', type=str, required=True, help='Temp: 50, 60, etc.')
parser.add_argument('--apps_path', type=str, required=True, help='Path to the DSN_AE_APPS directory')
args = parser.parse_args()
module = args.module
# temperature = args.temperature
apps_path = args.apps_path

exe_path ="MajOperations/"
exe_file ="maj-exe"


open_rows_file_name = apps_path + exe_path + "open_rows_0-6.txt"
r_frac_idx_file_name = apps_path + exe_path + "r_frac_indices.txt"

out_file = apps_path + exe_path + "maj.txt"
os.system(f'rm {out_file}')


or_csv = f'{apps_path}../../../../experimental_data/{module}/open_rows_0-6.csv'
or_df = pd.read_csv(or_csv)

try:
    os.mkdir(apps_path + exe_path + 'patterns')
except:
    pass

os.system(f'{apps_path}../ResetBoard/full_reset.sh')


stability_iter_count = 1000
n_frac_times = 3
t_frac = 0

for rows in [12,16,24,32]: # [4,8,16,32]
    # if temperature == '50':
    #     t_12_lst = [0,1,2,3]
    #     t_23_lst = [0,1,2,3]
    #     # bank_lst = [0,1,2,3]
    #     bank_lst = [0]
    # else:
    #     t_12_lst = [0]
    #     t_23_lst = [1]
    #     bank_lst = [0,1,2,3]
    t_12_lst = [0,1,2]#[0,1,2,3]
    t_23_lst = [0,1,2]#[0,1,2,3]
    bank_lst = [0]
    # t_12 = t_12_lst[0]
    # t_23 = t_23_lst[0]

    for t_12 in t_12_lst:
        for t_23 in t_23_lst:
            sample_csv = f'{apps_path}../../../../experimental_data/{module}/samples_{rows}_{t_12}_{t_23}.csv'
            samples_df = or_df.loc[or_df['total_open_row'] == rows]
            print(f"Samples after 'total_open_row' filter: {len(samples_df)}")
            samples_df = samples_df.loc[samples_df['avg_success_rate'] == 1.0]
            print(f"Samples after 'avg_success_rate' filter: {len(samples_df)}")
            samples_df = samples_df.loc[samples_df['t_12'] == t_12] # Instead of: samples_df = samples_df.loc[samples_df['t_12'] == 0]
            print(f"Samples after 't_12 == {t_12}' filter: {len(samples_df)}")
            samples_df = samples_df.loc[samples_df['t_23'] == t_23] # Instead of: samples_df = samples_df.loc[samples_df['t_23'] == 1]            
            print(f"Samples after 't_23 == {t_23}' filter: {len(samples_df)}")
            if len(samples_df) > 100:
                samples_df = samples_df.sample(n=100).reset_index(drop=True)
            else:
                samples_df = samples_df.sample(n=len(samples_df)).reset_index(drop=True)
            samples_df.to_csv(sample_csv)
            #send_cmd = f'cp {sample_csv} {main_dir_path}/experimental_data/{module}/'  
            #sp = subprocess.run([send_cmd], shell=True, check=True, stdout=subprocess.PIPE, universal_newlines=True)
            lst = pd.DataFrame(columns=['t_12','t_23','n_frac_times','t_frac','bank_id','r_first','r_second','s_id','majX','avg_coverage','full_coverage_cells','avg_stability','full_stable_cells'])
            csv_file = f'maj9_strong_coverage_{rows}_{t_12}_{t_23}.csv'
            lst.to_csv(csv_file)
            for majX in [9]: # Instead of checking for [3,5,7,9] we only need to check for 3
                if (majX > rows):
                    break
                r_frac_idx = [i for i in range(rows%majX)] # The index of the frac row
                os.system('rm ./patterns/*')
                for i,pattern in enumerate(range(1,2**majX-1)):
                    wr_pattern = hf.maj_all_1_0_pattern_creator(rows,majX,r_frac_idx,pattern)
                    pattern_file_name = apps_path + exe_path + f'./patterns/pattern_{i}.txt'
                    hf.write_to_file(wr_pattern,pattern_file_name)
                    current_time = time.time()
                    end_time = 0
                print(f'Open Rows: {rows}, #Sample: {len(samples_df)}, #MAJ: {majX}, Pattern: {pattern}')
                for sample_iter,e_idx in enumerate(samples_df.index):
                    start_time = time.time()
                    element     = samples_df.iloc[[e_idx]]
                    r_first     = element['Rfirst'][e_idx]
                    r_second    = element['Rsecond'][e_idx]
                    n_open_rows = element['total_open_row'][e_idx]  
                    min_row_idx = element['min_row_addr'][e_idx]
                    max_row_idx = element['max_row_addr'][e_idx]
                    s_id = element['s_id'][e_idx]
                    open_rows   = [int(e) for e in element['all_open_indices'][e_idx][1:-1].split(',')]
                    hf.write_to_file(open_rows,open_rows_file_name)
                    hf.write_to_file(r_frac_idx,r_frac_idx_file_name)
                    for bank_id in bank_lst:
                        os.system(f'touch {out_file}')
                        cmd = ( apps_path + exe_path + exe_file + " " + str(pattern_file_name) + " " + 
                                str(r_frac_idx_file_name) + " " + str(r_first)  + " " + str(r_second) + " " + 
                                str(min_row_idx) + " " + str(max_row_idx)  + " " + str(n_open_rows) + " " +
                                str(open_rows_file_name) + " " + str(1) + " " + str(bank_id) + " " + 
                                str(majX) + " " + str(t_12) + " " + str(t_23) + " " +
                                str(n_frac_times) + " " + str(t_frac) + " " +str(out_file) 
                        )
                        sp = subprocess.run([cmd], shell=True, check=True, stdout=subprocess.PIPE, universal_newlines=True) 
                        if(os.stat(out_file).st_size != 0):
                            res_lst = (hf.read_result_file(out_file))
                            temp_data = [[t_12,t_23,n_frac_times,t_frac,bank_id, r_first, r_second, s_id, majX, res_lst[0], res_lst[1], res_lst[2], res_lst[3]]]
                            df = pd.DataFrame(temp_data, columns=['t_12','t_23','n_frac_times','t_frac','bank_id','r_first','r_second','s_id','majX','avg_coverage','full_coverage_cells','avg_stability','full_stable_cells'])
                            df.to_csv(csv_file, mode='a', header=False)
                            os.system(f'rm {out_file}')
                    end_time = time.time()
                    print(f'Open Rows: {rows}, Sample: {sample_iter}/{len(samples_df)} iter took {end_time-start_time} seconds')           
            send_path = apps_path + exe_path + csv_file
            cp_path = f'{apps_path}../../../../experimental_data/{module}/ '           
            send_cmd = f'cp -r {send_path} {cp_path}'  
            sp = subprocess.run([send_cmd], shell=True, check=True, stdout=subprocess.PIPE, universal_newlines=True)
            
    

# maj9_strong_coverage_12_1_0.csv | Rows open: 12 | Tras: 3.0 ns, Trp: 1.5 ns | Average-Stab: 70.4965% | Max-Stab: 77.2020% | Argmax-Stab: 15 | Average-cov: 72.6917% | Max-Cov: 78.5351 | Argmax-Cov: 30
# | R1: 436, R2: 744 | Rows in group: [232, 236, 240, 244, 424, 428, 432, 436, 744, 748, 752, 756]

# maj9_strong_coverage_16_2_0.csv | Rows open: 16 | Tras: 4.5 ns, Trp: 1.5 ns | Average-Stab: 59.9909% | Max-Stab: 69.5867% | Argmax-Stab: 27 | Average-cov: 58.3895% | Max-Cov: 69.8810 | Argmax-Cov: 27
# | R1: 629, R2: 704 | Rows in group: [576, 577, 580, 581, 624, 625, 628, 629, 704, 705, 708, 709, 752, 753, 756, 757] 

# maj9_strong_coverage_24_2_0.csv | Rows open: 24 | Tras: 4.5 ns, Trp: 1.5 ns | Average-Stab: 73.7798% | Max-Stab: 81.9397% | Argmax-Stab: 77 | Average-cov: 74.5424% | Max-Cov: 81.9801 | Argmax-Cov: 77
# | R1: 372, R2: 779 | Rows in group: [266, 267, 268, 269, 306, 307, 308, 309, 330, 331, 332, 333, 370, 371, 372, 373, 778, 779, 780, 781, 818, 819, 820, 821] 

# maj9_strong_coverage_32_2_0.csv | Rows open: 32 | Tras: 4.5 ns, Trp: 1.5 ns | Average-Stab: 76.7083% | Max-Stab: 83.6645% | Argmax-Stab: 69 | Average-cov: 77.8610% | Max-Cov: 84.3199 | Argmax-Cov: 54
# | R1: 234, R2: 805 | Rows in group: [226, 227, 228, 229, 234, 235, 236, 237, 290, 291, 292, 293, 298, 299, 300, 301, 738, 739, 740, 741, 746, 747, 748, 749, 802, 803, 804, 805, 810, 811, 812, 813]
