

library(tidycensus)

readRenviron("~/.Renviron")
census_api_key(Sys.getenv("CENSUS_API_KEY"), install = FALSE)

