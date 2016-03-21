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

#PLOT 1
png(filename = "plot1.png", width = 480, height = 480)
with(data, hist(as.numeric(Global_active_power), xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power", col = "red"))
dev.off()