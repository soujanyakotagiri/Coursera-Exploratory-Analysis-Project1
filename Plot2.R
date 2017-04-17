library(ggplot2)
library(data.table)
library(dplyr)
library(gtools)
library(quantmod)
data_full <- read.table("household_power_consumption.txt",skip = 1,header = TRUE, sep = ";")
names(data_full) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


#subsetting the required data
data <- subset(data_full, data_full$Date == "1/2/2007" | data_full$Date == "2/2/2007")


#Transforming the Date and Time variables into objects of Date and POSIXct resp
datetime <- strptime(paste(data$Date ,data$Time, sep= " "),"%d/%m/%Y %H:%M:%S")
GlobalActivePower <- as.numeric(data$Global_active_power)
#datetime <- paste(as.Date(data$Date) ,data$Time)
#data$datetime <- as.POSIXct(datetime)

#Using Plot function
png("plot2.png", height = 480,width = 480)
plot(datetime,GlobalActivePower, type="l",ylab="Global Active Power (kilowatts)", xlab="")
#dev.copy(png, file="Plot2.png", height=480, width=480)
dev.off()




