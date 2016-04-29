# This file performs statistical analysis. It could be just one file, so it doesn't neccessarly 
#  need it's own folder, but sometimes your analysis may get complicated enough that you want 
# to compartmentalize it. Separating different types of analyses into different scripts contained
#  in the same folder can facilitate this

library(urca)
library(vars)
# This line runs the source code that fetched your raw data and cleaned it. Now it is available 
# for conducting analysis.
source('data-raw/fetch-raw-data.R')

# Store results of ADF tests for Corn and Soybeans in a list
adf      <- list()
adf[[1]] <- ur.df(CZ2016, type = 'drift', lags = 5)
adf[[2]] <- ur.df(SX2016, type = 'drift', lags = 5) 


# Store results of a Johansen cointegration test for Corn and Soybeans 
jct      <- ca.jo(cbind(CZ2016, SX2016), type = 'eigen', K = 5)


# Fit a VAR

lag_selection <- VARselect(cbind(CZ2016, SX2016), lag.max = 8)

var_model <- VAR(cbind(CZ2016, SX2016), p = 1, type = "const")

# Save these results so that it can be pulled into the manuscript without re-running analysis.
save(adf, jct, lag_selection, var_model, file = 'analysis-output/results.rda')

text_reg <- adf[[1]]@testreg
save(text_reg, file = 'analysis-output/reg_results.txt')


