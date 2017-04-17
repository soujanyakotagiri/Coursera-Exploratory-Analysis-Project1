library(ggplot2)
library(data.table)
library(dplyr)
library(gtools)
library(quantmod)

data <- read.table("household_power_consumption.txt",skip = 1,header = TRUE, sep = ";")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")


#subsetting the required data
subsetData <- subset(data, data$Date == "1/2/2007"| data$Date =="2/2/2007")

#calling Base plot function
hist(as.numeric(as.character(subsetData$Global_active_power)),col="red", main="Global Active Power", xlab = "Global Active Power(kilowatts)")

#Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)##As specified
dev.off()##very important
