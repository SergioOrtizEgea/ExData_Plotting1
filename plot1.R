###Plot1

UserPath <- "./ExploratoryData/Project1/"
if(!dir.exists(UserPath)) UserPath <- "./"

#Reading the data only from 1/2/2007 to 2/2/2007
household_power_consumption <- paste(UserPath, "household_power_consumption.txt", sep ="")
household_dataset <- read.table(text = grep("^[1,2]/2/2007",readLines(household_power_consumption),value=TRUE), sep = ';', na.strings = '?')
names(household_dataset)<- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3");

#variable we are going to represent
Global_active_power <- as.numeric(household_dataset$Global_active_power)

#Open device
png(paste(UserPath,'plot1.png',sep=""), width=480, height=480)

#Representing the histogram
hist(Global_active_power,  main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

#Closing the device
dev.off()