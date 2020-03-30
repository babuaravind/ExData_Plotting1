# Required Libraries
library(data.table)
# Loads the data
data <- read.table('household_power_consumption.txt', header=TRUE, sep=";",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2", "Sub_metering_3"), na.strings = "?", stringsAsFactors = FALSE)

# Subsetting data from 2007-02-01 to 2007-02-02
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Plots a histogram
graph <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(graph, data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)",type="l")
# Saves a png copy
dev.copy(png, file='plot2.png')
dev.off()