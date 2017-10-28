
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


## Plot 1 
## open device, width and height = 480 px
png(filename="figure/plot1.png",width=480,height=480,units="px")

#plot 
hist(pwrConsumption$Global_active_power, col="Red", xlab="Global Active Power(Kilowatts)", main="Global Active Power" )
dev.off()
