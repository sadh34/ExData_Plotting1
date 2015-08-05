dane <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = F, 
                   nrows = length(grep("^[12]/2/2007", readLines("household_power_consumption.txt"))), 
                   skip = grep("^[12]/2/2007", readLines("household_power_consumption.txt"))-1, na.strings = "?")


names(dane) <- names(read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = F, header = T))
dane$Date <- as.Date(dane$Date, format = "%d/%m/%Y")

png(filename = "plot4.png")
par(mfrow = c(2,2))
plot(dane$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab  ="", xlim = c(0,2880), xaxt = "n")
axis(side = 1, at = c(1,1441,2881), tick = T, labels = c("Thu", "Fri", "Sat"))
plot(dane$Voltage, type = "l", ylab = "Voltage", xlab  ="datetime", xaxt = "n")
axis(side = 1, at = c(1,1441,2881), tick = T, labels = c("Thu", "Fri", "Sat"))
plot(dane$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab  ="", xaxt = "n")
lines(dane$Sub_metering_2, type = "l", col = "red")
lines(dane$Sub_metering_3, type = "l", col = "blue")
legend("topright", lwd = 0.01, col=c("black","blue", "red"), legend = names(dane[7:9]), bty = "n")
axis(side = 1, at = c(1,1441,2881), tick = T, labels = c("Thu", "Fri", "Sat"))
plot(dane$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab  ="datetime", xaxt = "n")
axis(side = 1, at = c(1,1441,2881), tick = T, labels = c("Thu", "Fri", "Sat"))
dev.off()
