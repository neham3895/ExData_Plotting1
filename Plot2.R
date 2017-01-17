# Reading, naming and subsetting power consumption data
data <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                 "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subdata <- subset(data,data$Date=="4/2/2007" | data$Date =="5/2/2007")

subdata$Timestamp <- paste(subdata$Date, subdata$Time)
subdata$Time <- strptime(subdata$Timestamp, format="%d/%m/%Y %H:%M:%S")


# calling the basic plot function
subdata$Global_active_power<-as.numeric(as.character(subdata$Global_active_power))
plot(subdata$Time,subdata$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)") 

# naming graph
title(main="Global Active Power Vs Time")
