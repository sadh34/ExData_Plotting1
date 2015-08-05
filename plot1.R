dane <- read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = F, 
                    nrows = length(grep("^[12]/2/2007", readLines("household_power_consumption.txt"))), 
                    skip = grep("^[12]/2/2007", readLines("household_power_consumption.txt"))-1)


names(dane) <- names(read.table("household_power_consumption.txt", sep = ";", stringsAsFactors = F, header = T))

png(filename = "plot1.png")
hist(dane$Global_active_power, col ="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()
