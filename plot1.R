library(data.table)

## loading and reading data
file_url <- "household_power_consumption.txt"
data <- fread(file_url, colClasses = "character")

## subsetting data
data <- data[Date == c("1/2/2007", "2/2/2007")]

## convert the desired column from character to numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

## start the png device
png(file = "plot1.png", height = 480, width = 480)

## plot the histogram of Global Active Power values
## and set the x-axis lable, color and title
with(data, hist(Global_active_power, col = "red",
                xlab = "Global Active Power (kilowatts)",
                main = "Global Active Power"))

## turn off the png device
dev.off()