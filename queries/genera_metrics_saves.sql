with initial_table as (
    select
        dataFechaActualizado as "timestamp", -- No es en intervalos regulares
        strptime(timestamp_saved, '%m/%d/%Y %I:%M %p') as timestamp_saved,
        Index as "index",
        "Desc" as "desc",
        "value",
    -- from read_csv_auto('https://raw.githubusercontent.com/jzavala-gonzalez/scraping-luma/main/genera/historical/dataMetrics_historical.csv')
    from read_csv_auto('samples/dataMetrics_historical.csv')
)

select *
from initial_table
