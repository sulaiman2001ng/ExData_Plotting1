#First plot script
if(!file.exists()){}

hpc <- subset(read.table("household_power_consumption.txt", header = TRUE, 
                         sep = ";", na.strings = "?", stringsAsFactors = FALSE), 
              Date %in% c("1/2/2007", "2/2/2007"))

hpc_transform <- transform (hpc, Date = strptime(Date, "%d/%m/%Y"), 
                            Time = format(strptime(Time, "%H:%M:%S"), "%H:%M:%S"))
