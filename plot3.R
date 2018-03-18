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
dp3<-subset(hpc,DateTime>="2007-02-01" & DateTime<="2007-02-03")
dp3$DateTime <- as.POSIXct(strptime(dp3$DateTime, "%Y-%m-%d %H:%M:%S"))
### Generate Plot 3
png("plot3.png",width = 480,height = 480,units = "px")
plot(dp3$DateTime,dp3$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(dp3$DateTime,dp3$Sub_metering_2,col="red")
lines(dp3$DateTime,dp3$Sub_metering_3,col="blue")
legend("topright", col=c("black", "red", "blue"),lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

