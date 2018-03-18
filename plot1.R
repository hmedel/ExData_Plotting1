library(data.table)
## Read the data set from file
hpc<-read.csv("./household_power_consumption.txt",sep=";",header=TRUE, colClasses = "character")

## Format Date and Time
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
hpc$Time<-strptime(hpc$Time,"%H:%M:%S")

## Subset data to dates of interest
dataplot<-subset(hpc,Date>="2007-02-01" & Date<="2007-02-02")

### Generate Plot 1
png("plot1.png",width = 480,height = 480,units = "px")
hist(as.numeric(datap1$Global_active_power),col="red",xlab = "Global Active Power (kilowatts)",main="Global Active Power")
dev.off()

