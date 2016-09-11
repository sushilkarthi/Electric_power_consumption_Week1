dataFile <- "household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subsetdata <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
GAP <- as.numeric(subsetdata$Global_active_power)
png("plot1.png", width = 480, height = 480)
hist(GAP,xlab="Global Active Power (Kilowatts)", main = "Global Active Power", col = "red")
dev.off()