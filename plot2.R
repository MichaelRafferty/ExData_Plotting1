# plot2.R 
## creates plot2.png

## first download the data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", 
              "power.zip")

## first read the data:
power.data <- read.table(
    unz("power.zip", "household_power_consumption.txt"),
    header=TRUE, sep=";", na.strings="?")

## subset to the dates we care about
power.data <- subset(power.data, Date=="1/2/2007" | Date=="2/2/2007")

## fix date and time fields
power.data$Date <- as.Date(power.data$Date, "%d/%m/%Y")
power.data$Time <- strptime(
    paste(power.data$Date, power.data$Time, sep=" "), 
    "%F %T")


## display Global Active Power over Time
## open png file
png(file="plot2.png")
## chart Global Active Power against Time
plot(power.data$Time, 
     power.data$Global_active_power, 
     type="l", 
     xlab="", 
     ylab="Global Active Power(kilowatts)")
## close file
dev.off()