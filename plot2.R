library(data.table)
library(dplyr)
library(lubridate)
## Read the data set from file
hpc<-fread("./household_power_consumption.txt",na.strings = "?")

## Format Date and Time
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
hpc<-cbind( paste(hpc$Date,hpc$Time, " ") , select(hpc, -c(1,2)) )
colnames(hpc)[1]<-"DateTime"
# 
## Subset data to dates of interest
dp2<-subset(hpc,DateTime>="2007-02-01" & DateTime<="2007-02-03")
dp2$DateTime <- as.POSIXct(strptime(dp2$DateTime, "%Y-%m-%d %H:%M:%S"))
### Generate Plot 2
png("plot2.png",width = 480,height = 480,units = "px")
plot(dp2$DateTime,dp2$Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)")
dev.off()

