library(data.table)

## loading and reading data
file_url <- "household_power_consumption.txt"
data <- fread(file_url, colClasses = "character")

## subsetting data
data <- data[Date == c("1/2/2007", "2/2/2007")]

## convert the desired column from character to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

## combine Date and Time columns and convert them into Date type
DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%y%y %H:%M:%S")

## start the png device
png(file = "plot2.png", height = 480, width = 480)

## plot the diagram of Global Active Power values and weekdays
## and set the x-axis and y-axis lables
plot(DateTime, data$Global_active_power, type = "l",
     xlab = "", ylab = "Global Active Power (kilowatts)")

## turn off the png device
dev.off()