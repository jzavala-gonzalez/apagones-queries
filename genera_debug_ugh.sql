with some_sample as (
    select *
    from genera_metrics_saves
    where "index" = 7
)

select "timestamp", count(*) as thecount
from some_sample
group by "timestamp"
order by thecount desc