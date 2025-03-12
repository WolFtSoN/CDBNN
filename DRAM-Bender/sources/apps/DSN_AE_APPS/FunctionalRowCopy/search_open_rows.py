import os
import pandas as pd
# import helper_functions as hf
# import time

# out_csv_file = 'filter_open_row_computation_row.csv'
# copy4copy
# out_csv_file = 'copy4copy_rows'
out_csv_file = 'long_t1_check_computation_row.csv'

os.system(f'rm {out_csv_file}')

# or_csv = 'open_rows_0-6.csv'
or_csv = 'open_rows_t1_10_t2_0_10.csv'
or_df = pd.read_csv(or_csv)

rows = 2

subarray_id = 0

computation_rows = [152, 153, 408, 409, 664, 665]
# computation_rows = [24,88,128,136,144,154,156,158,160,168,176,184,216,281,344,472] # copy4copy

samples_df = or_df.loc[or_df['total_open_row'] == rows]
samples_df = samples_df.loc[samples_df['s_id'] == subarray_id]
samples_df = samples_df.loc[samples_df['avg_success_rate'] > 0.95]
samples_df = samples_df.loc[(samples_df['Rfirst'].isin(computation_rows) & ~(samples_df['Rsecond'].isin(computation_rows))) | 
                            (samples_df['Rsecond'].isin(computation_rows) & ~(samples_df['Rfirst'].isin(computation_rows)))]

# Ensure uniqueness within the 'all_open_indices' column - Converted all_open_indices to a unique set using set(eval(x)) then sorted it and converted it back to a string.
samples_df['all_open_indices'] = samples_df['all_open_indices'].apply(lambda x: str(sorted(set(eval(x)))))

# Drop duplicates based on 'all_open_indices' - ensuring that duplicate row combinations don't appear.
samples_df = samples_df.drop_duplicates(subset=['all_open_indices'])

samples_df.to_csv(out_csv_file)
