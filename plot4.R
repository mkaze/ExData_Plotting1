library(data.table)

## loading and reading data
file_url <- "household_power_consumption.txt"
data <- fread(file_url, colClasses = "character")

## subsetting data
data <- data[Date == c("1/2/2007", "2/2/2007")]

## convert the desired columns from character to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Voltage <- as.numeric(data$Voltage)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)

## combine Date and Time columns and convert them into Date type
DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%y%y %H:%M:%S")

## start the png device
png(file = "plot4.png", height = 480, width = 480)

## set the mfrows
par(mfrow = c(2,2))

## plot of Global Active Power and weekdays
plot(DateTime, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power")

## plot of voltage and weekdays
plot(DateTime, data$Voltage, type = "l",
     xlab = "datatime", ylab = "Voltage")

## plot of Energy Sub metering and weekdays and its legend
plot(DateTime, data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering", col = "black")
lines(DateTime, data$Sub_metering_2, col = "red")
lines(DateTime, data$Sub_metering_3, col = "blue")

legend("topright", col = c("black", "red", "blue"), pch = "_", pt.cex = 2,
       bty = "n", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## plot of global reactive power and weekdays
plot(DateTime, data$Global_reactive_power, type = "l",
     xlab = "datetime", ylab = "Global_reactive_power")

## turn off the png device
dev.off()

