with initial_table as (
    select
        dataFechaActualizado as "timestamp", -- No es en intervalos regulares
        strptime(timestamp_saved, '%m/%d/%Y %I:%M %p') as timestamp_saved,
        place,
        "value",
    -- from read_csv_auto('https://raw.githubusercontent.com/jzavala-gonzalez/scraping-luma/main/genera/historical/dataFuelCost_historical.csv')
    from read_csv_auto('samples/dataFuelCost_historical.csv')
)

select *
from initial_table