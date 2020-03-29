dataFile <- "./household_power_consumption.txt"

data <- read.table(dataFile, header=TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

sub_data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

sub_data$Date <- as.Date(sub_data$Date, format="%d/%m/%Y")

date_time <- paste(as.Date(sub_data$Date), sub_data$Time)

sub_data$DateTime <- as.POSIXct(date_time)

png("plot3.png", width = 480, height = 480)


with(sub_data, {
  plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy Sub Metering")
  })
  lines(sub_data$Sub_metering_2 ~ sub_data$DateTime, col = 'Red')
  lines(sub_data$Sub_metering_3 ~ sub_data$DateTime, col = 'Blue')
legend("topright", lty=1, lwd =2, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(main="Energy sub-metering")

dev.off()
