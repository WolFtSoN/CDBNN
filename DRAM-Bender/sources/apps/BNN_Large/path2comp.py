# Print to txt file the path from map_routing_rows for each operand like this: data_to_operand[OPERAND_A].push_back({128, 0, 24, 152, 408});

def load_data_rows(d_file):
    """
    Extracts 'Data Row' values from lines where 'Computation Row: 24' exists.
    """
    data_rows = []
    routing_rows = []
    main_rows = []

    with open(d_file, "r") as f:
        for line in f:
            parts = line.split("->")  # Split by "->"
            data_part = parts[0].strip()  # Extract "Data Row: X"
            data_part = data_part.split(":")[1].strip()  # Extract "X"
            routing_part = parts[1].strip()  # Extract "Level 2 Routing Row: Y"
            routing_part = routing_part.split(":")[1].strip() # Extract "Y"
            main_part = parts[2].strip()  # Extract "Main Routing Row: Z"
            main_part = main_part.split(":")[1].strip() # Extract "Z"

            data_rows.append(data_part)
            routing_rows.append(routing_part)
            main_rows.append(main_part)
            # comp_row.append(comp_value)
            # print(f"line: {line}")
            # print(f"data_value: {data_part} | routing_lvl2_value: {routing_part} | main_row: {main_part}")

    return (data_rows, routing_rows, main_rows)


# Define the dictionary
route_to_operand = {}

# Populate the dictionary
route_to_operand[(24,'A')] = [152, 408]
route_to_operand[(24,'B')] = [25, 153, 409]
route_to_operand[(24,'C')] = [536, 664, 665]
route_to_operand[(25,'A')] = [24, 152, 408]
route_to_operand[(25,'B')] = [153, 409]
route_to_operand[(25,'C')] = [24, 536, 664, 665]
route_to_operand[(536,'A')] = [24, 152, 408]
route_to_operand[(536,'B')] = [24, 25, 153, 409]
route_to_operand[(536,'C')] = [664, 665]
route_to_operand[(88,'A')] = [152, 408]
route_to_operand[(88,'B')] = [89, 153, 409]
route_to_operand[(88,'C')] = [600, 664, 665]
route_to_operand[(89,'A')] = [88, 152, 408]
route_to_operand[(89,'B')] = [153, 409]
route_to_operand[(89,'C')] = [88, 600, 664, 665]
route_to_operand[(600,'A')] = [88, 152, 408]
route_to_operand[(600,'B')] = [88, 89, 153, 409]
route_to_operand[(600,'C')] = [664, 665]
route_to_operand[(136,'A')] = [152, 408]
route_to_operand[(136,'B')] = [137, 153, 409]
route_to_operand[(136,'C')] = [648, 664, 665]
route_to_operand[(137,'A')] = [136, 152, 408]
route_to_operand[(137,'B')] = [153, 409]
route_to_operand[(137,'C')] = [136, 648, 664, 665]
route_to_operand[(648,'A')] = [136, 152, 408]
route_to_operand[(648,'B')] = [136, 137, 153, 409]
route_to_operand[(648,'C')] = [664, 665]

# Load data for each operand
data_rows, routing_rows , main_rows = load_data_rows("map_routing_rows.txt")


# for data, routing, main in zip(data, routing, main):
#     key = (main,'A') if data in route_to_operand[(24,'A')] else (main,'B') if data in route_to_operand[(24,'B')] else (main,'C') if data in route_to_operand[(24,'C')] else None
#     if key in route_to_operand:
#         comp_rows = route_to_operand[key]
#         print(f"data_to_operand[OPERAND_{key[1]}].push_back({data}, {routing}, {main}, {comp_rows[0]}, {comp_rows[1]});")

# Generate push_back statements
output_file = "data_to_operand.txt"
with open(output_file, "w") as f:
    for data, routing, main in zip(data_rows, routing_rows, main_rows):
        prefix = [data, routing, main]
        # print(f"Data: {data} | Routing: {routing} | Main: {main}")
        key = None
        main = int(main)
        for operand in ['A', 'B', 'C']:
            if (main, operand) in route_to_operand.keys():
                # print(f"Found match for {main} and {operand}")
                key = (main, operand)
                to_print = prefix + route_to_operand[key] 
                to_print = ",".join([str(i) for i in to_print])
                f.write(to_print +"\n")


print(f'Push_back statements written to {output_file}')



