plot2 <- function(){
  # place the household_power_consumption.txt in the same folder as this script
  
  Sys.setlocale("LC_TIME", "C")
  data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
  data$Date <- strptime(paste(data$Date, data$Time),format="%d/%m/%Y %H:%M:%S")
  data$Time <- NULL
  startDate = as.POSIXlt("2007-02-01");
  endDate = as.POSIXlt("2007-02-03");
  data <- subset(data, Date >= startDate & Date < endDate)
  png(file = "plot2.png", width = 480, height = 480, units = "px", bg = "transparent")
  par(mar = c(4,4,2,2))
  plot(data$Date,data$Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab = "")
  lines(data$Date,data$Global_active_power, type = "l")
  axis.Date(side = 1, data$Date, format = "%a")
  dev.off()  
}