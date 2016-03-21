library(chron)
library(plyr)
file <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(file, "temp.zip")
unzip("temp.zip")


data <- read.csv2("household_power_consumption.txt", as.is = TRUE)
data$DT <-paste(data$Date, data$Time)
data$Date <- strptime(data$Date, "%d/%m/%Y")
data$DT <- strptime(data$DT, "%d/%m/%Y %H:%M:%S")
data <- subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#PLOT 4
png(filename = "plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
with(data, plot(type = "l", x=DT,y=as.numeric(Global_active_power), xlab="", ylab = "Global Active Power (kilowatts)"))
with(data, plot(type = "l", x=DT,y=as.numeric(Sub_metering_1), xlab="", ylab = "Energy sub metering", col="black"))
with(data, lines(x=DT,y=as.numeric(Sub_metering_2), col="red"))
with(data, lines(x=DT,y=as.numeric(Sub_metering_3), col="blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = "solid")
with(data, plot(type = "l", x=DT,y=as.numeric(Voltage), xlab="datetime", ylab = "Voltage"))
with(data, plot(type = "l", x=DT,y=as.numeric(Global_reactive_power), ylab="Global_reactive_power", xlab="datetime"))
dev.off()
