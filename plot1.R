library(lubridate)
# Read data
data <- read.table("household_power_consumption.txt",as.is=TRUE,sep=";",header=TRUE)
# Convert date to Date class
data$Date <- as.Date(strptime(data$Date,"%d/%m/%Y"))
# Read only relevant dates
data2 <- na.omit(data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",])
# Generate plot!
hist(as.numeric(data2$Global_active_power),breaks=12,xlab="Global Active Power (kilowatts)",ylab="Frequency",col="red",main="Global Active Power")
# Save to file
dev.copy(png,file="plot1.png")
dev.off()