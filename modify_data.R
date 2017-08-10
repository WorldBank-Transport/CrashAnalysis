# DATA PROCESSING
# This script was used to get a time of day variable and extract the columns
# of interest

# Note: Messy, however, running this should be unnecessary given the test_data.csv
# file is already in the GitHub repository

# Operations to complete for any new data file are:
# 1 - Add a weekdays variable
# 2 - Add a time of day variable
# 3 - extract columns of interest

# import data
# my data variable is data_20170405
# at this point, my data already has the weekdays variable

# strip the time of day
data_20170405$time_of_day <- format(strptime(format(data_20170405$record_date,format="%Y-%m-%d %H:%M:%S",usetz=FALSE), format = "%Y-%m-%d %H:%M:%S"),format="%H")
setwd("~/Documents/World_Bank/crash_project/CrashAnalysis")


# obtain the columns of interest
df <- data_20170405
new_df <- data.frame(df$record_date, df$lat, df$lon, df$severity, df$agency, df$weekday, df$time_of_day)
colnames(new_df) <- c("date", "lat", "lon", "severity", "agency", "weekday", "time_of_day")
write.csv(new_df,"task1_data.csv",row.names = FALSE) 





