# Required Libraries
library(data.table)
# Loads the data
data <- read.table('household_power_consumption.txt', header=TRUE, sep=";",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2", "Sub_metering_3"), na.strings = "?", stringsAsFactors = FALSE)

# Subsetting data from 2007-02-01 to 2007-02-02
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Plotting function
graph <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
plot(graph, data$Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c('black', 'red', 'blue'), lty=, lwd='2.2', bty='o')
lines(graph, data$Sub_metering_2, type='l', col='red')
lines(graph, data$Sub_metering_3, type='l', col='blue')


# Saves a png copy
dev.copy(png, file='plot3.png')
dev.off()