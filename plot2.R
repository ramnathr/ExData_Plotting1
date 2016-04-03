## Course Project 1
## Plot 1

library(data.table)

# Read in only the data for Feb 1, 2007 - Feb 2, 2007
powcons <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, skip = 66636, nrows = 2880)
colnames(powcons) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

# Add a new column for date/time
### May not be needed. Possibly remove
powcons$DateTime <- paste(powcons$Date, powcons$Time, sep = " ")
powcons <- powcons[c("Date", "Time", "DateTime", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")]

# Convert to DateTime string to DateTime class and get day of week
powcons$DateTime <- strptime(powcons$DateTime, format = "%d/%m/%Y %H:%M:%S")
powcons$DayofWeek <- weekdays(powcons$DateTime)

png("plot2.png", width=480, height=480)
plot(powcons$DateTime, powcons$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()
