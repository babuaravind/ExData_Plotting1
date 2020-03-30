# Required Libraries
library(data.table)
# Loads the data
data <- read.table('household_power_consumption.txt', header=TRUE, sep=";",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2", "Sub_metering_3"), na.strings = "?", stringsAsFactors = FALSE)

# Subsetting data from 2007-02-01 to 2007-02-02
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Plotting function
graph <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

par(mfrow=c(2,2))
#  Plot 1
plot(graph, data$Global_active_power, xlab="", ylab = "Global Active Power", type = 'l')

# Plot 2
plot(graph, data$Voltage, xlab="datetime", ylab = "Voltage", type='l')

# Plot 3
plot(graph, data$Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col= c('black', 'red', 'blue'))
lines(graph, data$Sub_metering_2, type='l', col='red')
lines(graph, data$Sub_metering_3, type='l', col='blue')

# Plot 4
plot(graph, data$Global_reactive_power, xlab="datetime", ylab = "Global_Reactive_Power", type='l')


# Saves a png copy
dev.copy(png, file='plot4.png')
dev.off()