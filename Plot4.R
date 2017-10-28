
#library needed for the script 
library(dplyr)
library(lubridate)

# Set Working Directory
workingDir<-"C:/_R/ExData_Plotting1"
setwd(workingDir)

#Since I know the data types, I can convert to approprate data types during loading
#define col class - get the first 2 as character and merge it as date later
#change the class of last 7 to numeric
dataColClass<-c(rep('character',2),rep('numeric',7))

#read data
pwrConsumption <-read.table("./data/household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", colClasses = dataColClass)

#Filter/subset only for day 1 and 2 only 
pwrConsumption<-pwrConsumption[pwrConsumption$Date=='1/2/2007' | pwrConsumption$Date=='2/2/2007',]


#Plot 4
## open device, width and height = 480 px
png(filename="figure/plot4.png",width=480,height=480,units="px")
#prepare for 2 by 2 plot
par(mfrow=c(2,2))
plot(pwrConsumption$DateTime, pwrConsumption$Global_active_power, ylab="Global Active Power (Kilowatts)", xlab = "", type = "l")
plot(pwrConsumption$DateTime, pwrConsumption$Voltage, ylab="Voltage", xlab = "datetime", type = "l")

plot(pwrConsumption$DateTime, pwrConsumption$Sub_metering_1,ylab="Energy sub metering", xlab = "", type="l")
lines(pwrConsumption$DateTime, pwrConsumption$Sub_metering_2,col="Red")
lines(pwrConsumption$DateTime, pwrConsumption$Sub_metering_3,col="Blue")
legend("topright", legend=c("sub_metering_1", "sub_metering_2", "Sub_metering_3"), col=c("black","red", "blue"), lty = "solid")
plot(pwrConsumption$DateTime, pwrConsumption$Global_reactive_power, ylab = "Global_reactive_power", xlab = "datetime", type = "l")
dev.off()

