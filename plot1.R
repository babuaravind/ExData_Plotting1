# Required Libraries
library(data.table)
# Loads the data
data <- read.table('household_power_consumption.txt', header=TRUE, sep=";",col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2", "Sub_metering_3"), na.strings = "?", stringsAsFactors = FALSE)

# Subsetting data from 2007-02-01 to 2007-02-02
# data$Date <- as.Date(data$Date, format="%d/%m/%Y")
# subset(data, date> "31/01/2007" & date < "2/02/2007")
# setDT(data)[date %between% c('1/2/2007', '2/2/2007')]
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Plots a histogram
hist(data$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts", ylab="Frequency")

# Saves a png copy
dev.copy(png, file='plot1.png')
dev.off()