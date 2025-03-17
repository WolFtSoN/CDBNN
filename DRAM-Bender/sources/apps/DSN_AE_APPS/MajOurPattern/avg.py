import pandas as pd
import os
import argparse
import warnings
import time
from pathlib import Path

# Ignore warnings to keep output clean
warnings.simplefilter(action='ignore')

clk_ns = 1.5
rows = 8
# Iterate over t_12 and t_23 values
for t_12 in range(1, 7):
    for t_23 in range(0, 4):
        file_path = f"maj_coverage_{rows}_{t_12}_{t_23}.csv"  # Construct file name
        
        # Check if the file exists before trying to read it
        if os.path.exists(file_path):
            df = pd.read_csv(file_path)

            # Ensure column exists
            if "avg_stability" in df.columns:
                # Convert column to numeric, coercing errors to NaN
                df["avg_stability"] = pd.to_numeric(df["avg_stability"], errors="coerce")
                df["avg_coverage"] = pd.to_numeric(df["avg_coverage"], errors="coerce")

                # Compute average while ignoring NaN values
                avg_value = df["avg_stability"].mean()
                avg_value_cov = df["avg_coverage"].mean()

                # Compute highest value while ignoring NaN values
                max_value = df["avg_stability"].max()
                max_value_cov = df["avg_coverage"].max()

                arg_maxvalue = df["avg_stability"].idxmax()
                arg_maxvalue_cov = df["avg_coverage"].idxmax()

                print(f"File: {file_path} | Rows open: {rows} | Tras: {(t_12+1)*1.5} ns, Trp: {(t_23+1)*1.5} ns | Average-Stab: {avg_value:.4f}% | Max-Stab: {max_value:.4f}% | Argmax-Stab: {arg_maxvalue} | Average-cov: {avg_value_cov:.4f}% | Max-Cov: {max_value_cov:.4f} | Argmax-Cov: {arg_maxvalue_cov}")
            else:
                print(f"File: {file_path} | Column 'avg_stability' not found.")
        else:
            print(f"File not found: {file_path}")