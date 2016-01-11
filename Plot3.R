#3rd plot script
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

png(filename = "plot3.png") # Default arguments width = 480, height = 480, units = "px"
with(a, plot(x = Date_time, y= Sub_metering_1, 
             type = "l", xlab = "", ylab = "Energy sub metering"))
with(a, lines(Date_time, Sub_metering_2, col = "red"))
with(a, lines(Date_time, Sub_metering_3, col = "blue"))
legend("topright", lwd = 2, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()