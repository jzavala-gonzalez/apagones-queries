with initial_table as (
select
    row_number() over (partition by "timestamp", "place") as row_num,
    *
from genera_fuel_cost_saves
),

one_save_per_timestamp as (
select * exclude row_num
from initial_table
where row_num = 1
)

select *
from one_save_per_timestamp
order by "timestamp", place