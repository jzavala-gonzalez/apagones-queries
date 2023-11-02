with initial_table as (
select
  strptime("timestamp", '%m/%d/%Y %I:%M %p') as "timestamp",
  strptime(timestamp_saved, '%m/%d/%Y %I:%M %p') as timestamp_saved,
  "type",
  region_name,
  totalClients as "total_clients",
  totalClientsWithoutService as total_clients_without_service,
  totalClientsWithService as total_clients_with_service,
  percentageClientsWithoutService as percentage_clients_without_service,
  percentageClientsWithService as percentage_clients_with_service
-- from read_parquet('https://raw.githubusercontent.com/jzavala-gonzalez/scraping-luma/main/regionsWithoutService_historical.parquet')
from read_parquet('samples/regionsWithoutService_historical.parquet')
),

all_timestamps as (
select
    unnest(generate_series(min("timestamp"), max("timestamp"), INTERVAL 5 MINUTE)) as "timestamp"
from initial_table
)

select *
from all_timestamps
left join initial_table
using ("timestamp")
-- order by "timestamp", timestamp_saved, "type", region_name