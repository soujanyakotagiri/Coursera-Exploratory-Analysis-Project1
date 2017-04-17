library(ggplot2)
library(data.table)
library(dplyr)
library(gtools)
library(quantmod)

data_full <- read.table("household_power_consumption.txt",skip = 1,header = TRUE, sep = ";",stringsAsFactors=FALSE, dec=".")
names(data_full) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")

#subsetting the required data
#data <- data_full[data_full$Date %in% c("1/2/2007","2/2/2007") ,]
data <- subset(data_full, data_full$Date == "1/2/2007" | data_full$Date == "2/2/2007")

#Transforming the Date and Time variables into objects of Date and time resp
datetime <- strptime(paste(data$Date ,data$Time, sep= " "),"%d/%m/%Y %H:%M:%S")

globalActivePower <- as.numeric(data$Global_active_power)
subMetering1 <- as.numeric(data$Sub_metering_1)
subMetering2 <- as.numeric(data$Sub_metering_2)
subMetering3 <- as.numeric(data$Sub_metering_3)


#Using Plot function
png("plot3.png", height = 480,width = 480)
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2,type = "l", col = "red")
lines(datetime, subMetering3,type = "l", col = "blue")
legend("topright", c("subMetering1","subMetering2","subMetering3"),lty = 1,lwd = 2.5,col = c("black","red","blue"))
dev.off()
  