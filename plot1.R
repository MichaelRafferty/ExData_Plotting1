# plot1.R 
## creates plot1.png

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


## open png file 
png(file="plot1.png")
## create histogram
hist(power.data$Global_active_power, 
     col="red", 
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
## close file
dev.off()