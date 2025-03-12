### We verify potentially all rows can connect to computation rows

import os
import pandas as pd
import ast
import networkx as nx

out_csv_file = 'connected_rows.csv'

os.system(f'rm {out_csv_file}')

or_csv = 'open_rows_t1_10_t2_0_10.csv'
or_df = pd.read_csv(or_csv)

rows = 2
subarray_id = 0

# Filter out unrelevant rows (multi rows, not in subarray of interest, low success rate, duplicates)

samples_df = or_df.loc[or_df['total_open_row'] == rows]
samples_df = samples_df.loc[samples_df['s_id'] == subarray_id]
samples_df = samples_df.loc[samples_df['avg_success_rate'] > 0.95]

# Ensure uniqueness within the 'all_open_indices' column - Converted all_open_indices to a unique set using set(eval(x)) then sorted it and converted it back to a string.
samples_df['all_open_indices'] = samples_df['all_open_indices'].apply(lambda x: str(sorted(set(eval(x)))))

# Drop duplicates based on 'all_open_indices' - ensuring that duplicate row combinations don't appear.
samples_df = samples_df.drop_duplicates(subset=['all_open_indices'])


# Filter rows that cannot be connected to computation rows
computation_rows = [152, 153, 408, 409, 664, 665]

# Create a graph
G = nx.Graph()

# Add edges from "all_open_indices"
for _, row in samples_df.iterrows():
    nodes = ast.literal_eval(row["all_open_indices"])  # Convert string to list
    G.add_edge(nodes[0], nodes[1])  # Add edge to graph

# Compute shortest path distances from a given vertex v
# v = 0  # Replace with your desired source vertex
# if v in G:
#     distances = nx.shortest_path_length(G, source=v)
#     # print(dict(distances))  # Print shortest distances
# else:
#     print(f"Vertex {v} not found in graph!")

# Find the reachable set for each starting vertex
reachable_sets = [set(nx.node_connected_component(G, node)) for node in computation_rows]

# Compute the intersection of all reachable sets
common_reachable_nodes = set.intersection(*reachable_sets)

print("Nodes reachable from all start nodes:", common_reachable_nodes)

all_nodes = set(G.nodes)
print(f"Unreachable nodes: {all_nodes - common_reachable_nodes}")
