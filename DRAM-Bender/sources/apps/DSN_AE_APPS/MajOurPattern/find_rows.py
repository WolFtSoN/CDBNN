import pandas as pd
import os

clk_ns = 1.5
rows = 8#4
t_12 = 1#
t_23 = 0#
best_rows_id = 39#94 # use avg.py to find best rows for maj - argmax

maj_cov_csv = f"maj_coverage_{rows}_{t_12}_{t_23}.csv"
or_csv = "open_rows_0-6.csv"#"open_rows_0-6.csv"

# Retrieve best MAJ rows parameters
maj_df = pd.read_csv(maj_cov_csv)

best_rows = maj_df.iloc[best_rows_id]

# These should have 1-1 mapping - i.e. define the row group completly
best_rows_params = best_rows.loc[["t_12","t_23", "r_first", "r_second"]]

print(best_rows_params.index)

# Use retrieved data to search for the full parameters of the row group
or_df = pd.read_csv(or_csv)
# More elegant but didn't due to different namings in the open rows csv:
# filtered = or_df[
#     (or_df[list(best_rows_params.index)] == best_rows_params.values).all(axis=1)
# ]
filtered = or_df[
    (or_df[["t_12","t_23", "Rfirst", "Rsecond"]] == best_rows_params.values).all(axis=1)
]

line_number = filtered.index[0]
r1 = filtered.iloc[0]["Rfirst"]
r2 = filtered.iloc[0]["Rsecond"]
rows_ids = filtered.iloc[0]["all_open_indices"]
subarray_id = filtered.iloc[0]["s_id"]

print(f"File: {or_csv}, Line: {line_number} | t_12: {t_12}, t_23: {t_23} | R1: {r1}, R2: {r2} | Rows in group: {rows_ids} | Subarray ID: {subarray_id}")
