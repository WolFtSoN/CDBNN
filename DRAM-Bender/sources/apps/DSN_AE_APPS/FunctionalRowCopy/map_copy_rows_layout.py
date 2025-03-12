import os
import pandas as pd
import ast
import networkx as nx

############################################################################
# Filter all rows that can perform 2-rows opening (and hopefully row-copy) #
############################################################################

out_csv_file = 'row_copy_eligible.csv'

os.system(f'rm {out_csv_file}')

or_csv = 'open_rows_t1_10_t2_0_10.csv'
or_df = pd.read_csv(or_csv)

rows = 2
subarray_id = 0 # sub-array of interest

# Filter out unrelevant rows (multi rows, not in subarray of interest, low success rate, duplicates)
samples_df = or_df.loc[or_df['total_open_row'] == rows]
samples_df = samples_df.loc[samples_df['s_id'] == subarray_id]
samples_df = samples_df.loc[samples_df['avg_success_rate'] > 0.99]
samples_df = samples_df.loc[samples_df['t_23'] == 1]
# Ensure uniqueness within the 'all_open_indices' column - Converted all_open_indices to a unique set using set(eval(x)) then sorted it and converted it back to a string.
samples_df['all_open_indices'] = samples_df['all_open_indices'].apply(lambda x: str(sorted(set(eval(x)))))
# Drop duplicates based on 'all_open_indices' - ensuring that duplicate row combinations don't appear.
samples_df = samples_df.drop_duplicates(subset=['all_open_indices'])

samples_df.to_csv(out_csv_file)

######################################
# Create row-copy connectivity graph #
######################################

# Create a graph represnting row-copy connectivity
G = nx.Graph()

# Add edges from "all_open_indices"
for _, df_row in samples_df.iterrows():
    nodes = ast.literal_eval(df_row["all_open_indices"])  # Convert string to list
    G.add_edge(nodes[0], nodes[1])  # Add edge to graph

#####################
# Get all data rows #
#####################

computation_rows = [152, 153, 408, 409, 664, 665] # From previous MAJ test
# routing_rows = [24, 25, 536] # From inspection - might have better candidates / can enlarge this
routing_groups = [[24, 25, 536], [88, 89, 600], [136, 137, 648]]
routing_rows = [24, 25, 536, 88, 89, 600, 136, 137, 648]
# (24 <-> 152, 408) (25 <-> 153, 409) (536<->664,665) (24<-> 25, 536)
# (88 <-> 152) (89 <-> 153) (600<->664) (88<-> 89, 600)
# (136 <-> 152) (137 <-> 153) (648<->664) (136<-> 137, 648)
# routing_rows = set()
# for computation_row in computation_rows:
#     routing_rows = routing_rows | set(G.neighbors(computation_row))
# routing_rows = routing_rows - set(computation_rows)
print ("Routing rows:")
print(routing_groups)

routing_rows_lvl_2 = set()
for routing_row in routing_rows:
    routing_rows_lvl_2 = routing_rows_lvl_2 | set(G.neighbors(routing_row))
routing_rows_lvl_2 = routing_rows_lvl_2 - set(computation_rows) - set(routing_rows)

# data rows = unique neighbors of routing rows that aren't computation rows:
data_rows = set()

# Union of all neighbors of routing rows
# for routing_row in routing_rows:
    # data_rows = data_rows | set(G.neighbors(routing_row))

for routing_row in routing_rows_lvl_2:
    data_rows = data_rows | set(G.neighbors(routing_row))

# Leave out computation rows, routing rows
# data_rows = data_rows - set(computation_rows) - set(routing_rows)
data_rows = data_rows - set(computation_rows) - set(routing_rows) - set(routing_rows_lvl_2)

print("Eligible data rows:")
print(data_rows)
print(f"Amount of data rows: {len(data_rows)}")

######################
# Check timing param #
######################

# We now add the constraint all of these are to work with the same timing parameter t23
# This will simplify implementation

# selected_rows = list(data_rows | set(computation_rows) | set(routing_rows))
selected_rows = list(data_rows | set(computation_rows) | set(routing_rows) | set(routing_rows_lvl_2))

subG = nx.Graph(G.subgraph(selected_rows))

# Get a list of edges in the subgraph (canonical form)
subgraph_edges = set(tuple(sorted(edge)) for edge in subG.edges())

for t23 in range(5): # From inspection, t23 creates 2 rows openining only if it is up to 4
    samples_df = or_df.loc[or_df['total_open_row'] == rows]
    samples_df = samples_df.loc[samples_df['s_id'] == subarray_id]
    samples_df = samples_df.loc[samples_df['avg_success_rate'] >= 0.99]
    samples_df = samples_df.loc[samples_df['t_23'] == t23]
    t23_rows = set(tuple(sorted(ast.literal_eval(df_row))) for df_row in samples_df['all_open_indices'])
    # print(subgraph_edges - t23_rows)
    if not (subgraph_edges - t23_rows): # Check this logic, suspicious
        print(f"All sub-graph rows are working with t23 = {t23}")
