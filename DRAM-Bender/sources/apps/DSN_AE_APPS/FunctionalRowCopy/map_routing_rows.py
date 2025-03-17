import os
import pandas as pd
import ast
import networkx as nx

# Load CSV with valid row copies
out_csv_file = 'row_copy_eligible.csv'
or_csv = 'open_rows_t1_10_t2_0_10.csv'
or_df = pd.read_csv(or_csv)

rows = 2
subarray_id = 0  # Subarray of interest

# Filter rows based on criteria
samples_df = or_df.loc[(or_df['total_open_row'] == rows) & 
                       (or_df['s_id'] == subarray_id) & 
                       (or_df['avg_success_rate'] > 0.99) & 
                       (or_df['t_23'] == 1)]
samples_df['all_open_indices'] = samples_df['all_open_indices'].apply(lambda x: str(sorted(set(eval(x)))))
samples_df = samples_df.drop_duplicates(subset=['all_open_indices'])
samples_df.to_csv(out_csv_file)

# Create a connectivity graph
G = nx.Graph()
for _, df_row in samples_df.iterrows():
    nodes = ast.literal_eval(df_row["all_open_indices"])
    G.add_edge(nodes[0], nodes[1])  # Add edges between row-copy neighbors

# Define key row types
computation_rows = {152, 153, 408, 409, 664, 665}  # From previous tests
routing_groups = [[24, 25, 536], [88, 89, 600], [136, 137, 648]]
routing_rows = {24, 25, 536, 88, 89, 600, 136, 137, 648}

# Identify eligible data rows
routing_rows_lvl2 = dict()
for routing_group in routing_groups:
    for routing_row in routing_group:
        neighbors = set(G.neighbors(routing_row))
        neighbors = neighbors - computation_rows - routing_rows - routing_rows_lvl2.keys()
        for neighbor in neighbors:
            routing_rows_lvl2[neighbor] = routing_row
        # routing_rows_lvl2.update((neighbors - computation_rows - routing_rows))

# print("routing_rows_lvl2:")
# print(routing_rows_lvl2)


data_rows = dict()
for row in routing_rows_lvl2.keys():
    neighbors = set(G.neighbors(row))
    neighbors = neighbors - computation_rows - routing_rows - data_rows.keys()
    for neighbor in neighbors:
        data_rows[neighbor] = row

# print("Eligible data rows:")
# print(data_rows)        
        
# Map eligible data rows to computation rows via routing rows
routing_map = dict()

for data_row, routing_row in data_rows.items():
    comp_row = routing_rows_lvl2[routing_row]
    routing_map[data_row] = (routing_row, comp_row)

print("Routing map:")
print(routing_map)
print("Number of routing_map:")
print(len(routing_map))

# Write mapping to file
with open("map_routing_rows.txt", "w") as f:
    for data_row, (routing_row, comp_row) in routing_map.items():
        f.write(f"Data Row: {data_row} -> Routing Row: {routing_row} -> Computation Row: {comp_row}\n")


print("Done!!")