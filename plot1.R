##This code plots a histogram of "Global Active Power" for the two days of 1/2/2007 and 2/2/2007

##Read the data
df <- read.csv("household_power_consumption.txt",sep=";")[,c("Date","Time","Global_active_power")]

##subset the data for the required dates
df2 <- subset(df,Date=="1/2/2007"|Date=="2/2/2007")

##convert the class of Global_active_power from "factor" to "numeric
df2$Global_active_power <- as.numeric(as.character(df2$Global_active_power))

##Open graphic device
png(filename="plot1.png")

##Plot
hist(df2$Global_active_power,xlab="Global Active Power (kilowatts)",col="red", ylab="Frequency", main = "Global Active Power")

##Close graphic device
dev.off()