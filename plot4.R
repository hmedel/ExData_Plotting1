library(data.table)
library(dplyr)
## Read the data set from file
hpc<-fread("./household_power_consumption.txt",na.strings = "?")

## Format Date and Time
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
hpc<-cbind( paste(hpc$Date,hpc$Time, " ") , select(hpc, -c(1,2)) )
colnames(hpc)[1]<-"DateTime"
# 
## Subset data to dates of interest
dp4<-subset(hpc,DateTime>="2007-02-01" & DateTime<="2007-02-03")
dp4$DateTime <- as.POSIXct(strptime(dp4$DateTime, "%Y-%m-%d %H:%M:%S"))
### Generate Plot 4
par(mfrow=c(2,2))
png("plot4.png",width = 480,height = 480,units = "px")
plot(dp2$DateTime,dp2$Global_active_power,type="l",xlab="",ylab = "Global Active Power (kilowatts)")
plot(dp2$DateTime,dp2$Voltage,type="l",xlab="",ylab = "Voltage (volts)")
plot(dp3$DateTime,dp3$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(dp3$DateTime,dp3$Sub_metering_2,col="red")
lines(dp3$DateTime,dp3$Sub_metering_3,col="blue")
legend("topright", col=c("black", "red", "blue"),lwd=c(1,1,1),c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(dp2$DateTime,dp2$Global_reactive_power,type="l",xlab="",ylab = "Global Reactive Power (kilowatts)")
dev.off()

