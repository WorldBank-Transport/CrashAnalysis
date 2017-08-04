# import data
# my data variable is data_20170405
# at this point, my data already has the weekdays variable

# strip the time of day
data_20170405$time_of_day <- format(strptime(format(data_20170405$record_date,format="%Y-%m-%d %H:%M:%S",usetz=FALSE), format = "%Y-%m-%d %H:%M:%S"),format="%H")
setwd("~/Documents/World_Bank/crash_project")
#write.csv(data_20170405,"task1_data.csv",row.names = FALSE)

# obtain the columns of interest
df <- data_20170405
new_df <- data.frame(df$record_date, df$lat, df$lon, df$severity, df$agency, df$weekday, df$time_of_day)
colnames(new_df) <- c("date", "lat", "lon", "severity", "agency", "weekday", "time_of_day")
write.csv(new_df,"task1_data.csv",row.names = FALSE) 





