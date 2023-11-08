with initial_table as (
select
    row_number() over (partition by "timestamp", "index", "desc") as row_num,
    *
from genera_metrics_saves
),

one_save_per_timestamp as (
select * exclude row_num
from initial_table
where row_num = 1
)

-- TODO: Incluir NULLs para timestamps no guardados.
-- Q: cuan frecuente se guardan?
-- better Q: Hay un intervalo frecuente at all??

select *
from one_save_per_timestamp