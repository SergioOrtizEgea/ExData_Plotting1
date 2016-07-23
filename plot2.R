###Plot 2
UserPath <- "./ExploratoryData/Project1/"
if(!dir.exists(UserPath)) UserPath <- "./"

#Reading the data only from 1/2/2007 to 2/2/2007
household_power_consumption <- paste(UserPath, "household_power_consumption.txt", sep ="")
household_dataset <- read.table(text = grep("^[1,2]/2/2007",readLines(household_power_consumption),value=TRUE), sep = ';', na.strings = '?')
names(household_dataset)<- c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3");

#Transforming the Date and Time into Date/Time classes
household_dataset$Global_active_power <- as.numeric(household_dataset$Global_active_power)
household_dataset$Datetime <- strptime(paste(household_dataset$Date, household_dataset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

#Open device
png(filename = paste(UserPath,'plot2.png',sep=""), width = 480, height = 480, units='px')

#plotting
with(household_dataset, plot(Datetime,Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l'))
#plot(datetime,household_dataset$global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')

#Closing the device
dev.off()


