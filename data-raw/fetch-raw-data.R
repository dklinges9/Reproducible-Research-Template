# Filename: fetch-raw-data.R
# This file fetches the raw data and performs pre-processing (cleaning) to get it ready for analyzs
#install.packages("Quandl")
library(Quandl)
library(RCurl)
library(xts)


# Define Dates of Analysis
  start  <- '2015-01-01'
  today  <- format(Sys.time(),"%Y-%m-%d")

# Fetch Corn and Soybean Prices
  CZ2016 <- getURL("https://www.quandl.com/api/v1/datasets/CME/CZ2016.csv")
  SX2016 <- getURL("https://www.quandl.com/api/v1/datasets/CME/SX2016.csv")

  CZ2016 <- read.csv(text = CZ2016)
  SX2016 <- read.csv(text = SX2016)

# Define first column to be a date.
  CZ2016[,1] <- as.Date(CZ2016[,1])
  SX2016[,1] <- as.Date(SX2016[,1])

# Define the data objects to be xts objects, and keep only settlement prices
  CZ2016 <- xts(CZ2016[,'Settle'], order.by=CZ2016[,1])
  SX2016 <- xts(SX2016[,'Settle'], order.by=SX2016[,1])

# Trim the dates
  CZ2016 <- CZ2016[paste0(start,'/',today)]
  SX2016 <- SX2016[paste0(start,'/',today)]
