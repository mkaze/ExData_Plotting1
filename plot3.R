library(data.table)

## loading and reading data
file_url <- "household_power_consumption.txt"
data <- fread(file_url, colClasses = "character")

## subsetting data
data <- data[Date == c("1/2/2007", "2/2/2007")]

## convert the desired columns from character to numeric
data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

## combine Date and Time columns and convert them into Date type
DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%y%y %H:%M:%S")

## start the png device
png(file = "plot3.png", height = 480, width = 480)

## plot the diagram of Sub metring values and weekdays one by one
## in the same figure and set the x-axis and y-axis lables
plot(DateTime, data$Sub_metering_1, type = "l",
     xlab = "", ylab = "Energy sub metering", col = "black")
lines(DateTime, data$Sub_metering_2, col = "red")
lines(DateTime, data$Sub_metering_3, col = "blue")

## draw the legend
legend("topright", col = c("black", "red", "blue"), pch = "_", pt.cex = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## turn off the png device
dev.off()
