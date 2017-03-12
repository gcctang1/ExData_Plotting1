##This code plots a time-series of "Global Active Power" for the two days of 1/2/2007 and 2/2/2007

##Read the data
df <- read.csv("household_power_consumption.txt",sep=";")[,c("Date","Time","Global_active_power")]

##subset the data for the required dates
df2 <- subset(df,Date=="1/2/2007"|Date=="2/2/2007")

##convert the class of Global_active_power from "factor" to "numeric
df2$Global_active_power <- as.numeric(as.character(df2$Global_active_power))

##Combine the Date and Time and convert to "POSIXlt" and "POSIXt" classes
df2$Date <- strptime(paste(df2$Date,df2$Time),format ="%d/%m/%Y %H:%M:%S")


##Open graphic device
png(filename="plot2.png")

##Plot graph
plot(df2$Date,df2$Global_active_power, type = "l", xlab="", ylab="Global Active Power (kilowatts)", main = "")

##Close graphic device
dev.off()