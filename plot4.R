##This code plots the four graphs required for the assignment

##Read the relevant data
df <- read.csv("household_power_consumption.txt",sep=";")[,c("Date","Time","Global_active_power", "Voltage","Sub_metering_1","Sub_metering_2","Sub_metering_3","Global_reactive_power")]

##subset the data for the required dates
df2 <- subset(df,Date=="1/2/2007"|Date=="2/2/2007")

##Combine the Date and Time and convert to "POSIXlt" and "POSIXt" classes
df2$Date <- strptime(paste(df2$Date,df2$Time),format ="%d/%m/%Y %H:%M:%S")

##Change the classes from "factor" to "class"
df2$Global_active_power <- as.numeric(as.character(df2$Global_active_power))
df2$Sub_metering_1 <- as.numeric(as.character(df2$Sub_metering_1))
df2$Sub_metering_2 <- as.numeric(as.character(df2$Sub_metering_2))
df2$Sub_metering_3 <- as.numeric(as.character(df2$Sub_metering_3))
df2$Voltage <- as.numeric(as.character(df2$Voltage))
df2$Global_reactive_power <- as.numeric(as.character(df2$Global_reactive_power))

##Open graphic device
png(filename="plot4.png")

##Set up the frame for plotting

par(mfrow=c(2,2))

##Plot first graph (top left)
plot(df2$Date,df2$Global_active_power, type = "l", xlab="", ylab="Global Active Power", main = "")


##Plot second graph (top right)
plot(df2$Date,df2$Voltage, type = "l", xlab="datetime", ylab="Voltage", main = "")


##Plot third graph (bottom left)
plot(df2$Date,df2$Sub_metering_1,xlab="", ylab="Energy sub metering",type="n")
lines(df2$Date,df2$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(df2$Date,df2$Sub_metering_2,col="red",xlab="",ylab="Energy sub metering",type="l")
lines(df2$Date,df2$Sub_metering_3,col="blue",xlab="",ylab="Energy sub metering",type="l")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty="n")

##Plot fourth graph (bottom right)
with(df2,plot(Date,Global_reactive_power,xlab="datetime",type="l"))



##Close graphic device
dev.off()
