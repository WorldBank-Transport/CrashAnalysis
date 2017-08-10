#### NOT USED ####
#### NOT USED ####
#### NOT USED ####

### This file is for data aggregation ###
# Required: 
# A data file in the format of test_data.csv in the repository

# INPUTS:
# filePath - a string representing the path to the data file
# num_cells - an integer representing the number of 'cells' Manila should be divided into
filePath <- "~/Documents/World_Bank/crash_project/CrashAnalysis/test_data.csv"
num_cells <- 100
output_directory <- "~/Documents/World_Bank/crash_project/CrashAnalysis"

# required packages
require(readr)
require(dplyr)

# Load file into variable myData
myData <- read_csv(filePath)

# create geospatial bins
# start by clustering
# determine where cluster centers should be
kmodel <- kmeans(myData[,c('lat','lon')],num_cells)
# bin crash points into corresponding clusters
myData$bins <- kmodel$cluster

# Now, we can aggregate by time, weekday, and location
out <- myData %>% group_by(bins,weekday,time_of_day) %>% summarise(total_crashes = n())

# For CARTO, we add columns for latitude and longitude back
out$centroid_lat <- kmodel$centers[out$bins,'lat']
out$centroid_lon <- kmodel$centers[out$bins,'lon']

# output frame
output <- out[,c('centroid_lat','centroid_lon','weekday','time_of_day','total_crashes')]

# write into csv
setwd(output_directory)
write_csv(output,'aggregated_data.csv')
