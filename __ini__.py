from sql import my_sql


connector = my_sql()

# Step 1
connector.alter_dienstwagen_table()
connector.generate_random_kilometer()

# Step 2
connector.create_tankstellen_table()
connector.insert_tankstellen()

# Step 3
connector.create_tankvorgaenge_table()

# Step 4
connector.insert_tankvorgaenge_values()