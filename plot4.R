## Course Project 1
## Plot 4

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

png("plot4.png", width=480, height=480)

par(mfrow = c(2,2))

#First plot - same as plot2
plot(powcons$DateTime, powcons$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

plot(powcons$DateTime, powcons$Voltage, type = "l", xlab = "datetime", ylab = "Voltage")

plot(powcons$DateTime, powcons$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering", col = "black")
lines(powcons$DateTime, powcons$Sub_metering_2, type = "l", col = "red")
lines(powcons$DateTime, powcons$Sub_metering_3, type = "l", col = "blue")
legend(x = "topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lwd = 2.5)

plot(powcons$DateTime, powcons$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

dev.off()
