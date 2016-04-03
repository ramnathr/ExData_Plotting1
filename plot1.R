## Course Project 1
## Plot 1

# Read in only the data for Feb 1, 2007 - Feb 2, 2007
powcons <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE, skip = 66636, nrows = 2880)
colnames(powcons) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3")

global_data <- powcons$Global_active_power
png("plot1.png", width=480, height=480)
hist(global_data, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
