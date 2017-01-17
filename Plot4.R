# Reading, naming and subsetting power consumption data
data <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
              "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subdata <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

subdata$Timestamp <- paste(subdata$Date, subdata$Time)
subdata$Time <- strptime(subdata$Timestamp, format="%d/%m/%Y %H:%M:%S")

#Sets graphing parameters so that 4 graphs are drawn by column
par(mfcol = c(2,2))

# converting columns to numeric
subdata$Global_reactive_power<-as.numeric(as.character(subdata$Global_reactive_power))
subdata$Global_active_power<-as.numeric(as.character(subdata$Global_active_power))
subdata$Voltage<-as.numeric(as.character(subdata$Voltage))
subdata$Sub_metering_1<-as.numeric(as.character(subdata$Sub_metering_1))
subdata$Sub_metering_2<-as.numeric(as.character(subdata$Sub_metering_2))
subdata$Sub_metering_3<-as.numeric(as.character(subdata$Sub_metering_3))

# calling the basic plot function that calls different plot functions to build the 4 plots that form the graph
with(data,{
  
# Creates graph of date/time vs global active power data
  plot(subdata$Time,subdata$Global_active_power,type="l",  xlab="",ylab="Global Active Power")  

# Creates first graph in column 2 
# Creates plot of date/time v Sub metering 1 data
 plot(subdata$Time,subdata$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
 with(subdata,lines(Time,Sub_metering_1))
 with(subdata,lines(Time,Sub_metering_2,col="red"))
 with(subdata,lines(Time,Sub_metering_3,col="blue"))
 
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  
# Creates second graph in column 1
# Creates plot of date/time v Voltage
plot(subdata$Time,subdata$Voltage, type="l",xlab="datetime",ylab="Voltage")

# Creates second graph in column 2 
# This plots datetime v global reactive power
    plot(subdata$Time,subdata$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
})


