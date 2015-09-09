plot4 <- function(){
  # place the household_power_consumption.txt in the same folder as this script
  
  Sys.setlocale("LC_TIME", "C")
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  data$Date <- strptime(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
  data$Time <- NULL
  startDate = as.POSIXlt("2007-02-01");
  endDate = as.POSIXlt("2007-02-03");
  data <- subset(data, Date >= startDate & Date < endDate)
  png(file = "plot4.png", width = 480, height = 480, units = "px", bg = "transparent")
  par(mar = c(5,4,3,2))
  par(mfcol=c(2,2))
  plot(data$Date,data$Global_active_power, type="n", ylab="Global Active Power", xlab = "")
  lines(data$Date,data$Global_active_power, type = "l")
  axis.Date(side = 1, data$Date, format = "%a")
  
  plot(data$Date,data$Sub_metering_1, type="n", ylab="Energy sub metering", xlab = "")
  lines(data$Date,data$Sub_metering_1, type = "l", col = "black")
  lines(data$Date,data$Sub_metering_2, type = "l", col = "red")
  lines(data$Date,data$Sub_metering_3, type = "l", col = "blue")
  axis.Date(side = 1, data$Date, format = "%a")
  legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1),col=c("black","red","blue"), bty = "n") 
  
  plot(data$Date,data$Voltage, type="n", ylab="Voltage", xlab = "datetime")
  lines(data$Date,data$Voltage, type = "l")
  axis.Date(side = 1, data$Date, format = "%a")
  
  plot(data$Date,data$Global_reactive_power, type="n", ylab="Global_reactive_power", xlab = "datetime")
  lines(data$Date,data$Global_reactive_power, type = "l")
  axis.Date(side = 1, data$Date, format = "%a")
  
  dev.off()  
}