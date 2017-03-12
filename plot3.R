##This code plots a time-series of Sub_metering 1,2 & 3 for the two days of 1/2/2007 and 2/2/2007

##Read the relevant data
df <- read.csv("household_power_consumption.txt",sep=";")[,c("Date","Time","Sub_metering_1","Sub_metering_2","Sub_metering_3")]

##subset the data for the required dates
df2 <- subset(df,Date=="1/2/2007"|Date=="2/2/2007")

##Combine the Date and Time and convert to "POSIXlt" and "POSIXt" classes
df2$Date <- strptime(paste(df2$Date,df2$Time),format ="%d/%m/%Y %H:%M:%S")

df2$Sub_metering_1 <- as.numeric(as.character(df2$Sub_metering_1))
df2$Sub_metering_2 <- as.numeric(as.character(df2$Sub_metering_2))
df2$Sub_metering_3 <- as.numeric(as.character(df2$Sub_metering_3))


##Open graphic device
png(filename="plot3.png")

##Plot graph
plot(df2$Date,df2$Sub_metering_1,xlab="", ylab="Energy sub metering",type="n")
lines(df2$Date,df2$Sub_metering_1,xlab="",ylab="Energy sub metering",type="l")
lines(df2$Date,df2$Sub_metering_2,col="red",xlab="",ylab="Energy sub metering",type="l")
lines(df2$Date,df2$Sub_metering_3,col="blue",xlab="",ylab="Energy sub metering",type="l")

##Add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"))

##Close graphic device
dev.off()