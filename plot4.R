###Plot 3
UserPath <- "./ExploratoryData/Project1/"
if(!dir.exists(UserPath)) UserPath <- "./"

#Reading the data only from 1/2/2007 to 2/2/2007
household_power_consumption <- paste(UserPath, "household_power_consumption.txt", sep ="")
household_dataset <- read.table(text = grep("^[1,2]/2/2007",readLines(household_power_consumption),value=TRUE), sep = ';', na.strings = '?')
names(household_dataset)<- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3");

#Transforming the Date and Time into Date/Time classes
household_dataset$Global_active_power <- as.numeric(household_dataset$Global_active_power)
household_dataset$Datetime <- strptime(paste(household_dataset$Date, household_dataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
household_dataset$subMetering1 <- as.numeric(household_dataset$Sub_metering_1)
household_dataset$subMetering2 <- as.numeric(household_dataset$Sub_metering_2)
household_dataset$subMetering3 <- as.numeric(household_dataset$Sub_metering_3)
household_dataset$GlobalReactivePower <- as.numeric(household_dataset$Global_reactive_power)
household_dataset$voltage <- as.numeric(household_dataset$Voltage)

#Open device
png(filename = paste(UserPath,'plot4.png',sep=""), width = 480, height = 480, units='px')

#Making 4 subplots
par(mfrow = c(2, 2)) 

#plotting

#plot(1,1)
with(household_dataset,plot(Datetime, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.2))

#plot(1,2)
with(household_dataset,plot(Datetime, voltage, type="l", xlab="datetime", ylab="Voltage"))

#plot(2,1)
with(household_dataset,plot(Datetime, subMetering1, type="l", ylab="Energy Submetering", xlab=""))
with(household_dataset,lines(Datetime, subMetering2, type="l", col="red"))
with(household_dataset,lines(Datetime, subMetering3, type="l", col="blue"))
with(household_dataset,legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty ="o"))

#plot(2,2)
with(household_dataset,plot(Datetime, GlobalReactivePower, type="l", xlab="datetime", ylab="Global reactive power"))

#Closing the device
dev.off()


