from utils import save_file

# Para descargar versiones locales de los archivos para evitar hit el servidor de GitHub todo el tiempo


save_file('https://raw.githubusercontent.com/jzavala-gonzalez/scraping-luma/main/regionsWithoutService_historical.parquet',
          'samples/regionsWithoutService_historical.parquet')

save_file('https://raw.githubusercontent.com/jzavala-gonzalez/scraping-luma/main/genera/historical/dataMetrics_historical.csv',
          'samples/dataMetrics_historical.csv')

save_file('https://raw.githubusercontent.com/jzavala-gonzalez/scraping-luma/main/genera/historical/dataByFuel_historical.csv',
          'samples/dataByFuel_historical.csv')

save_file('https://raw.githubusercontent.com/jzavala-gonzalez/scraping-luma/main/genera/historical/dataFuelCost_historical.csv',
          'samples/dataFuelCost_historical.csv')
