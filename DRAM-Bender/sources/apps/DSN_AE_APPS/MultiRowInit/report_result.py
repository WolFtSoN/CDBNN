import pandas as pd

# Load the CSV file
df = pd.read_csv("multirow_2_10_1.csv", index_col=0)

# Calculate averages
avg_all_0 = df['all_0'].mean()
avg_all_1 = df['all_1'].mean()

# Calculate percentage of rows where both all_0 and all_1 are 1.0
both_ones = ((df['all_0'] == 1.0) & (df['all_1'] == 1.0)).mean() * 100

# Print results
print(f"Average of 'all_0': {avg_all_0}")
print(f"Average of 'all_1': {avg_all_1}")
print(f"Percentage of rows with both 'all_0' and 'all_1' equal to 1.0: {both_ones:.2f}%")
