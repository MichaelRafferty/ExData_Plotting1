# plot4.R 
## creates plot4.png

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
png(file="plot4.png")
## set 2x2 format populating columns first
par(mfcol=c(2,2))
with(power.data, {
    ## plot Global Active Power against time
    ### code from plot2.R
    plot(Time, 
         Global_active_power, 
         type="l", 
         xlab="", 
         ylab="Global Active Power")
    ## plot submetering 1,2, & 3 against time
    ### code from plot3.R
    plot(Time, 
         Sub_metering_1, 
         type="l", 
         xlab="", 
         ylab="Energy sub metering")
    points(power.data$Time, 
           power.data$Sub_metering_2, 
           type="l", 
           col="red")
    points(power.data$Time, 
           power.data$Sub_metering_3, 
           type="l", 
           col="blue")
    ## plot voltage against time
    plot(Time, Voltage, type="l", xlab="datetime", ylab="voltage")
    ## plot Global Reactive Power against time
    plot(Time, Global_reactive_power, type="l", xlab="datetime")
})
## close file
dev.off()