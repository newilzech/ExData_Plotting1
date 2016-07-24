#Read Dataset
plot3Data<-read.table("./ExData_Plotting1/household_power_consumption.txt", header = TRUE, sep =";", dec = ".",stringsAsFactors=FALSE)

#We will only be using data from the dates 2007-02-01 and 2007-02-02
data<-plot3Data[plot3Data$Date %in% c("1/2/2007","2/2/2007"),]

#reformat datetime
datetime <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalAPData <- as.numeric(data$Global_active_power)

#Submeter
submeter1<-as.numeric(data$Sub_metering_1)
submeter2<-as.numeric(data$Sub_metering_2)
submeter3<-as.numeric(data$Sub_metering_3)




png("./ExData_Plotting1/plot3.png")
plot(datetime, submeter1, type="l", ylab="Energy Submetering", xlab="",col="black")
lines(datetime, submeter2, type="l", col="red")
lines(datetime, submeter3, type="l", col="blue")
#create legend with width =1
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1, lwd=1,col=c("black","red","blue"))
##close device
dev.off()


