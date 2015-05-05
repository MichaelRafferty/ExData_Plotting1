# plot3.R 
## creates plot3.png

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
png(file="plot3.png")

## plot sub metering 1 against time
plot(power.data$Time, 
     power.data$Sub_metering_1, 
     type="l", 
     xlab="", 
     ylab="Energy sub metering")
## add plot of sub metering 2 against time to plot
points(power.data$Time, 
       power.data$Sub_metering_2, 
       type="l", 
       col="red")

## add plot of sub metering 3 against time to plot
points(power.data$Time, 
       power.data$Sub_metering_3, 
       type="l", 
       col="blue")
dev.off()