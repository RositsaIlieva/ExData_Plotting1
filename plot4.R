
#Reading the data

Dataset <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?",
                      nrows= 1000000, 
                      stringsAsFactors=FALSE)

#Format the Date as Date format

Dataset$DateTime <- paste(Dataset$Date, Dataset$Time)
Dataset$DateTime <- as.Date(Dataset$DateTime, format = "%d/%m/%Y %H:%M:%S")

#Susbset the data only for the dates 2007-02-01 and 2007-02-02

library(dplyr)
subsetted_dataset <- filter(Dataset, DateTime >= as.Date("2007-02-01 00:00:00"), 
                            DateTime < as.Date("2007-02-03 00:00:00"))
#plot4

datetime <- strptime(paste(subsetted_dataset$Date, subsetted_dataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subsetted_dataset$Global_active_power)
globalReactivePower <- as.numeric(subsetted_dataset$Global_reactive_power)
voltage <- as.numeric(subsetted_dataset$Voltage)
subMetering1 <- as.numeric(subsetted_dataset$Sub_metering_1)
subMetering2 <- as.numeric(subsetted_dataset$Sub_metering_2)
subMetering3 <- as.numeric(subsetted_dataset$Sub_metering_3)


png("plot4.png", width=480, height=480)
par(mfrow = c(2, 2)) 

plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()





