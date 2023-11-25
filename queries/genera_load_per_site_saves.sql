with initial_table as (
    select
        -- TODO: Change so many names / aliases
        strptime(dataFechaActualizado, '%m/%d/%Y %I:%M:%S %p') as "timestamp",
        strptime(timestamp_saved, '%m/%d/%Y %I:%M %p') as timestamp_saved,

        site_index,
        "Type" as "type",
        "Desc" as "desc",
        SiteTotal as site_total,
        unit_index,
        Unit,
        MW,
        MVar,
        Cost,
        ParentId,
        -- fuel,
        -- "value"
    -- from read_csv_auto('https://raw.githubusercontent.com/jzavala-gonzalez/scraping-luma/main/genera/historical/dataByFuel_historical.csv')
    from read_parquet('samples/dataLoadPerSite_historical.parquet')
)

select *
from initial_table
