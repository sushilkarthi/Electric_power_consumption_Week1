dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subsetdata$Date, subsetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
GAP <- as.numeric(subsetdata$Global_active_power)
GRP <- as.numeric(subsetdata$Global_reactive_power)
voltage <- as.numeric(subsetdata$Voltage)
png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
plot(datetime,GAP,xlab="", ylab="Global Active Power", type = "l")
plot(datetime,voltage, type = "l")
plot(datetime,s1, xlab = "", ylab = "Energy sub metering", type = "n")
points(datetime,s1, type="l")
points(datetime,s2, type="l", col="red")
points(datetime,s3, type="l", col="blue")
legend("topright", bty = "n", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue"))
plot(datetime,GRP, type = "l",ylab="Global_reactive_power")
dev.off()