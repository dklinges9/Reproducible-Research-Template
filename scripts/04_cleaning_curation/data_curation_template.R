## David Klinges
## dklinges@ufl.edu
## This script provides a template of organization for reproducible workflows

## 1. Workspace prep ##############

## Load packages
# Workspace/system
library(here)
# Data curation
library(tidyverse) # library() returns error, require() returns warning
# Working with date-times
library(lubridate)
# Spatial data
library(raster)
library(rgdal)


## BAD BAD BAD BAD BAD
# setwd("Users/David/Desktop")

## Read in data
ameriflux_raw <- read_csv("data/raw_data/meteorology/ameriflux/BASE_MeasurementHeight_20190902.csv")
ameriflux_raw <- read_csv(Sys.glob("*/*/*/*/*/*/BASE_MeasurementHeight_20190902.csv"))
ameriflux_raw <- read_csv(grepl("BASE_MeasurementHeight_20190902.csv"), list.files)

## Alt + O to collapse all headers

## Load source functions
source("scripts/01_data_selection/hello_world.R")
source(Sys.glob("scripts/*_data_selection/hello_world.R"))
source(here(Sys.glob("scripts/*_data_selection/hello_world.R")))

# Written code should be within a margin that most users will be able to view 
# without having to move their panes around or scroll. This text is cut off at
# around 80 characters for a line length.

# There are exceptions: for instance strings that need to be on a single line
# such as file paths

# Tools>Global Options>Code>Display>Show Margin> 60 or 80 are common



## 2. Data curation #############

## Make some changes just in case
## 3. Data QA/QC ##############

## 4. Write out derived data ###########

# Common practice stemming from when RStudio and other IDE's weren't as popular:
####################################################
############# THIS IS A HEADER #####################
####################################################


