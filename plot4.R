#Read Dataset
plot4Data<-read.table("./ExData_Plotting1/household_power_consumption.txt", header = TRUE, sep =";", dec = ".",stringsAsFactors=FALSE)

#We will only be using data from the dates 2007-02-01 and 2007-02-02
data<-plot4Data[plot4Data$Date %in% c("1/2/2007","2/2/2007"),]

#reformat datetime
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalAPData <- as.numeric(data$Global_active_power)
globalRPData <- as.numeric(data$Global_reactive_power)
volt<-as.numeric(data$Voltage)

#Submeter
submeter1<-as.numeric(data$Sub_metering_1)
submeter2<-as.numeric(data$Sub_metering_2)
submeter3<-as.numeric(data$Sub_metering_3)

png("./ExData_Plotting1/plot4.png")
#plot 2x2
par(mfrow=c(2,2))

#Plot 1
plot(datetime, globalAPData, type="l", xlab="", ylab="Global Active Power")

#Plot 2
plot(datetime, volt, type="l", xlab="datetime", ylab="Voltage")

#Plot 3
plot(datetime, submeter1, type="l", ylab="Energy Submetering", xlab="",col="black")
lines(datetime, submeter2, type="l", col="red")
lines(datetime, submeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=1, col=c("black","red","blue"),bty = "n")
#PLot 4
plot(datetime, globalRPData, type="l", xlab="datetime", ylab="Global_reactive_power")
##close device
dev.off()


