# Reading, naming and subsetting power consumption data
data <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
              "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subdata <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

subdata$Timestamp <- paste(subdata$Date, subdata$Time)
subdata$Time <- strptime(subdata$Timestamp, format="%d/%m/%Y %H:%M:%S")

# converting columns to numeric
subdata$Sub_metering_1<-as.numeric(as.character(subdata$Sub_metering_1))
subdata$Sub_metering_2<-as.numeric(as.character(subdata$Sub_metering_2))
subdata$Sub_metering_3<-as.numeric(as.character(subdata$Sub_metering_3))

# calling the basic plot function
plot(subdata$Time,subdata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subdata,lines(Time,Sub_metering_1))
with(subdata,lines(Time,Sub_metering_2,col="red"))
with(subdata,lines(Time,Sub_metering_3,col="blue"))

# adding legend to graph
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

# naming graph
title(main="Energy sub-metering")

