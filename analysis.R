# This file performs statistical analysis. It doesn't neccessarly need it's own folder, 
# but sometimes your analysis may get complicated enough that you want to compartmentalize it. 
# Separating different types of analyses into different scripts contained in the same folder can
# facilitate this

library(urca)

# This line runs the source code that fetched your raw data and cleaned it. Now it is available 
# for conducting analysis.
source('data-raw/fetch-raw-data.R')

# Store results of ADF tests for Corn and Soybeans in a list
adf      <- list()
adf[[1]] <- ur.df(CZ2016)
adf[[2]] <- ur.df(SX2016) 


# Store results of a Johansen cointegration test for Corn and Soybeans 
jct      <- ca.jo(cbind(CZ2016, SX2016))

# Save these results so that it can be pulled into the manuscript without re-running analysis.
save(adf, jct, file = 'analysis-output/results.rda')


