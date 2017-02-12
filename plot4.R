library(lubridate)
# Read data
data <- read.table("household_power_consumption.txt",as.is=TRUE,sep=";",header=TRUE)
# Convert date to Date class
data$Date <- as.Date(strptime(data$Date,"%d/%m/%Y"))
# Read only relevant dates
data2 <- na.omit(data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",])
# Add weekday field and concatenate date + time
data3 <- transform(data2, wday = wday(data2$Date), DateTime = as.POSIXlt(paste(data2$Date,data2$Time)))
# Change locale so x-axis labels don't show in my native language :)
Sys.setlocale(category = "LC_ALL", locale = "english")
par(mfcol=c(2,2))
plot(data3$DateTime,data3$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
plot(data3$DateTime,data3$Sub_metering_1,type="l",xlab="",ylab="Enery sub metering")
lines(data3$DateTime,data3$Sub_metering_2,col="red")
lines(data3$DateTime,data3$Sub_metering_3,col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=2,col=c("black","red","blue"),bty="n")
plot(data3$DateTime,data3$Voltage,xlab="datetime",ylab="Voltage",type="l")
plot(data3$DateTime,data3$Global_reactive_power,xlab="datetime",ylab="Global_reactive_power",type="l")
dev.copy(png,file="plot4.png")
dev.off()