# Filename: fetch-raw-data.R
# This file fetches the raw data and performs pre-processing (cleaning) to get it ready for analyzs

library(RCurl)
library(xts)
library(Quandl)
Quandl.api_key("79SfoMaQc1npRAuq9ExZ")
# Define Dates of Analysis
  start  <- '2015-01-01'
  today  <- format(Sys.time(),"%Y-%m-%d")

# Fetch Corn and Soybean Prices
  CZ2016 <- Quandl("CME/CZ2016", type = "xts")
  SX2016 <- Quandl("CME/SX2016", type = "xts")

# Trim the dates
  CZ2016 <- CZ2016[paste0(start,'/',today), 'Settle']
  SX2016 <- SX2016[paste0(start,'/',today), 'Settle']
