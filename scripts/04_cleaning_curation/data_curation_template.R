## David Klinges
## dklinges@ufl.edu
## This script provides a template of organization for reproducible workflows

## BAD BAD BAD BAD BAD
setwd("Users/David/Desktop")

## 1. Workspace prep ##############

# Where we load the dependencies of the script (software packages and data)

## Load packages
# Workspace/system
library(here)
# Data curation
library(tidyverse) # library() returns error, require() returns warning
# Working with date-times
library(lubridate)
# Spatial data
library(raster)

## Read in data
iris_raw <- read.csv("data/raw_data/iris.csv") # Pretty standard
iris_raw <- read_csv(Sys.glob("*/*/iris*.csv")) # Throw in wildcards
# Harder to read, but possibly useful if you have tons of folders
iris_raw <- read_csv(list.files(recursive = TRUE)[ # list all files in my project
  grepl("iris.csv", list.files(recursive = TRUE)) # grepl to get those with "iris.csv"
  ])

# Written code should be within a margin that most users will be able to view 
# without having to move their panes around or scroll. This text is cut off at
# around 80 characters for a line length.

# There are exceptions: for instance strings that need to be on a single line
# such as file paths

# Tools>Global Options>Code>Display>Show Margin> 60 or 80 are common

## Load source functions
source("scripts/00_source/hello_world.R")
source(Sys.glob("scripts/*_source/hello_world.R"))
source(here(Sys.glob("scripts/*_source/hello_world.R")))

## 2. Data curation #############

## Make some changes just in case

## 3. Data QA/QC ##############

## 4. Write out derived data ###########

# Common practice stemming from when RStudio and other IDE's weren't as popular:
####################################################
############# THIS IS A HEADER LOOK AT ME #####################
####################################################

## But this is also a header ############

## And this is a header ---------------


## Alt + O to collapse all headers on Windows & Linux
## Alt + Cmd + O to collapse all headers on Mac

## Shift + Alt + O to expand all headers on Windows & Linux
## Shift + Alt + Cmd + O to collapse all headers on Mac
