import os
import duckdb
from utils import read_file

con = duckdb.connect('databases/test.db')

def create_table(query_name):
    if not os.path.exists(f'queries/{query_name}.sql'):
        raise ValueError(f'Query {query_name} does not exist')
    creation_string = (
    f'''
    CREATE OR REPLACE TABLE {query_name} AS (
    {read_file(f'queries/{query_name}.sql')}
    )
    ''')
    con.execute(creation_string)
    print(f'Table {query_name} created')
    return con.sql(f'select * from {query_name}')

print(
    create_table('regions_without_service_saves')
)

print(
    create_table('regions_without_service')
)

print(
   create_table('genera_metrics_saves')
)

print(
   create_table('genera_metrics')
)

print(
   create_table('genera_by_fuel_saves')
)

print(
   create_table('genera_by_fuel')
)

print(
   create_table('genera_fuel_cost_saves')
)

print(
   create_table('genera_fuel_cost')
)

print(
   create_table('genera_load_per_site_saves')
)

print(
   create_table('genera_load_per_site')
)