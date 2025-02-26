import pandas as pd
import os

clk_ns = 1.5
rows = 4
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

                # Compute average while ignoring NaN values
                avg_value = df["avg_stability"].mean()

                # Compute highest value while ignoring NaN values
                max_value = df["avg_stability"].max()

                print(f"File: {file_path} | Rows open: {rows} | Tras: {(t_12+1)*1.5} ns, Trp: {(t_23+1)*1.5} ns | Average: {avg_value:.4f}% | Max: {max_value:.4f}%")
            else:
                print(f"File: {file_path} | Column 'avg_stability' not found.")
        else:
            print(f"File not found: {file_path}")