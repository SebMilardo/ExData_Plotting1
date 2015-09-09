plot1 <- function(){
  # place the household_power_consumption.txt in the same folder as this script
  
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  data$Date <- strptime(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
  data$Time <- NULL
  startDate = as.POSIXlt("2007-02-01");
  endDate = as.POSIXlt("2007-02-03");
  data <- subset(data, Date >= startDate & Date < endDate)
  png(file = "plot1.png", width = 480, height = 480, units = "px", bg = "transparent")
  par(mar = c(4,4,2,2))
  hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()  
}