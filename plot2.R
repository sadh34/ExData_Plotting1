dane <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = F, 
                   nrows = length(grep("^[12]/2/2007", readLines("household_power_consumption.txt"))), 
                   skip = grep("^[12]/2/2007", readLines("household_power_consumption.txt"))-1, na.strings = "?")


names(dane) <- names(read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = F, header = T))
dane$Date <- as.Date(dane$Date, format = "%d/%m/%Y")

png(filename = "plot2.png")
plot(dane$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab  ="", xlim = c(0,2880), xaxt = "n")
axis(side = 1, at = c(1,1441,2881), tick = T, labels = c("Thu", "Fri", "Sat"))
dev.off()
