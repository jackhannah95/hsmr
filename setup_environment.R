#########################################################################
# Name of file - setup_environment.R
# Data release - Quarterly HSMR publication
# Original Authors - David Caldwell
# Orginal Date - April 2019
#
# Type - Reproducible Analytical Pipeline
# Written/run on - RStudio server
# Version of R - 3.5.1
#
# Description - Sets up environment required for running reproducible analytical
# pipeline process. This is the only file which should require updating every
# time the RAP process is run
#
# Approximate run time - xx minutes
#########################################################################

### 1 - Load packages ----
library(odbc)          # For accessing SMRA databases
library(dplyr)         # For data manipulation in the "tidy" way
library(haven)         # For reading in SPSS files
library(readr)         # For reading in csv files
library(janitor)       # For 'cleaning' variable names
library(magrittr)      # For %<>% operator
library(lubridate)     # For dates
library(tidylog)       # For printing results of some dplyr functions
library(tidyr)         # For data manipulation in the "tidy" way
library(stringr)       # For string manipulation and matching
library(ggplot2)       # For ggplot objects
library(ggrepel)       # For funnel plot labels
library(here)          # For the here() function
library(openxlsx)      # For manipulating Excel files
library(hsmr)          # For HSMR functions

### 2 - Define Whether Running on Server or Locally ----
# Covers both the old server and the pro one
if (sessionInfo()$platform %in% c("x86_64-redhat-linux-gnu (64-bit)",
                                  "x86_64-pc-linux-gnu (64-bit)")) {
  platform <- "server"
  } else {
  platform <- "locally"
}


# Define root directory for cl-out based on whether script is running locally or
# on server
plat_filepath <- dplyr::if_else(platform == "server",
                                '/conf/linkage/output/',
                                '//stats/cl-out/')


### 3 - Extract dates ----


# Define the dates that the data are extracted from and to
# Dates are in ddmmyyyy format


# The beginning of baseline period/extract window
start_date        <- lubridate::dmy(01012017)

# The beginning of baseline period/extract window for trend data
start_date_trends <- lubridate::dmy(01012015)

# The end of the baseline period (for model)
base_end          <- lubridate::dmy(31122019)

# Five years earlier for the five year look-back (pmorbs5)
start_date_5      <- lubridate::dmy(01012012)

# First day of latest quarter in current publication
qtr_start         <- lubridate::dmy(01102019)

# End date for the cut off for data
end_date          <- lubridate::dmy(31122019)


### END OF SCRIPT ###
