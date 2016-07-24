#Read Dataset
plot2Data<-read.table("./ExData_Plotting1/household_power_consumption.txt", header = TRUE, sep =";", dec = ".",stringsAsFactors=FALSE)

#We will only be using data from the dates 2007-02-01 and 2007-02-02
data<-plot2Data[plot2Data$Date %in% c("1/2/2007","2/2/2007"),]

#reformat datetime
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalAPData <- as.numeric(data$Global_active_power)

png("./ExData_Plotting1/plot2.png")
plot(datetime, globalAPData, type="l", xlab="", ylab="Global Active Power (kilowatts)")
##close device
dev.off()


