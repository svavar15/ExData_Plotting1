#Reading data
dataFile <- "./household_power_consumption.txt"

data <- read.table(dataFile, header=TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")

sub_data <- subset(data, Date %in% c("1/2/2007", "2/2/2007"))

sub_data$Date <- as.Date(sub_data$Date, format="%d/%m/%Y")

global_active_power <- as.numeric(sub_data$Global_active_power)

#Creating PNG
png("plot1.png", width = 480, height = 480)

#Creating Hist plot
hist(global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red")

dev.off()