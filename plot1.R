#Read Dataset
plot1Data<-read.table("./ExData_Plotting1/household_power_consumption.txt", header = TRUE, sep =";", dec = ".",stringsAsFactors=FALSE)

#We will only be using data from the dates 2007-02-01 and 2007-02-02
data<-plot1Data[plot1Data$Date %in% c("1/2/2007","2/2/2007"),]

globalAPData <- as.numeric(data$Global_active_power)

png("./ExData_Plotting1/plot1.png")
hist(globalAPData, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
##close device
dev.off()


