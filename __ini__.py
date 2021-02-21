from sql import my_sql


connector = my_sql()
connector.insert_tankvorgaenge_values()


# connector.alter_dienstwagen_table()
# connector.create_tankstellen_table()
# connector.create_tankvorgaenge_table()
# connector.insert_tankvorgaenge_values()