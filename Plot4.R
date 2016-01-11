#4th plot script
#Download the electric power consumption file from 
#https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
#Unzip the file and the location of your unzipped as your working directory (setwd())

hpc <- subset(read.table("household_power_consumption.txt", header = TRUE, 
                         sep = ";", na.strings = "?", 
                         stringsAsFactors = FALSE), 
              Date %in% c("1/2/2007", "2/2/2007"))
a <- hpc

a <- transform (a, Date = strptime(Date, "%d/%m/%Y"), 
                Time = format(strptime(Time, "%H:%M:%S"), "%H:%M:%S"))

a <- transform (a, Date_time = paste(Date, Time, sep = " "))
a <- transform (a, Date_time = strptime(Date_time, "%Y-%m-%d %H:%M:%S"))

png(filename = "plot4.png") # Default arguments width = 480, height = 480, units = "px"
par(mfrow = c(2,2))

with(a, plot(x = Date_time, y= Global_active_power, 
             type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))
with(a, plot(x = Date_time, y= Voltage, 
             type = "l", xlab = "datetime", ylab = "Voltage"))

with(a, plot(x = Date_time, y= Sub_metering_1, 
             type = "l", xlab = "", ylab = "Energy sub metering"))
with(a, lines(Date_time, Sub_metering_2, col = "red"))
with(a, lines(Date_time, Sub_metering_3, col = "blue"))
legend("topright", lwd = 1, col = c("black", "red", "blue"), bty = "n", cex = .5,
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(a, plot(x = Date_time, y= Global_reactive_power, 
             type = "l", xlab = "", ylab = "Global_reactive_power"))
dev.off()