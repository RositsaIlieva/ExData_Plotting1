

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
#plot2

datetime <- strptime(paste(subsetted_dataset$Date, subsetted_dataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
plot2 <- as.numeric(subsetted_dataset$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, plot2, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
