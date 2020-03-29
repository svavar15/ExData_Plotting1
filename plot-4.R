dataFile <- "./household_power_consumption.txt"

data <- read.table(dataFile, header=TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

sub_data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

sub_data$Date <- as.Date(sub_data$Date, format="%d/%m/%Y")

date_time <- paste(as.Date(sub_data$Date), sub_data$Time)

sub_data$DateTime <- as.POSIXct(date_time)

#Initializing 2x2 for plots

png("plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))

plot(sub_data$Global_active_power ~ sub_data$DateTime, type="l", xlab="", ylab="Global Active Power")
plot(sub_data$Voltage ~ sub_data$DateTime, type="l", xlab="datetime", ylab="Voltage")

with(sub_data, {plot(Sub_metering_1 ~ DateTime, type="l", xlab="", ylab="Energy sub metering")})
lines(sub_data$Sub_metering_2 ~ sub_data$DateTime, col = 'Red')
lines(sub_data$Sub_metering_3 ~ sub_data$DateTime, col = 'Blue')
legend("topright", lty=1, lwd =2, col=c("black","red","blue") ,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

plot(sub_data$Global_reactive_power ~ sub_data$DateTime, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()

