#### Preamble ####
# Purpose: Download data from opentoronto and save as csv file.
# Author: Avinash Dindial
# Data: 06 January 2022
# Contact: avinash.dindial@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
library(tidyverse)
library(opendatatoronto)
library(dplyr)

# get package
package <- show_package("fc4d95a6-591f-411f-af17-327e6c5d03c7")
package

# get all resources for this package
resources <- list_package_resources("fc4d95a6-591f-411f-af17-327e6c5d03c7")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
crime_rate_toronto <- filter(datastore_resources, row_number()==1) %>% get_resource()

write_csv(crime_rate_toronto, "starter_folder-main/inputs/data/crime_rate_toronto.csv")
# Just keep some variables that may be of interest (change 
# this depending on your interests)




         