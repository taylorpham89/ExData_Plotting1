plot1 <- function () {
  data <- read.table("hpc.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
  ## subset the data
  sorted_data <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
  
  ## paste the time and date and format them accordingly
  time <- strptime(paste(sorted_data$Date, sorted_data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
  
  ##Convert into numeric value before plotting
  global <- as.numeric(sorted_data$Global_active_power)
  sub1 <- as.numeric(sorted_data$Sub_metering_1)
  sub2 <- as.numeric(sorted_data$Sub_metering_2)
  sub3 <- as.numeric(sorted_data$Sub_metering_3)
  
  
  ##Create t he plot
  plot(time, sub1, type="l",xlab="",ylab="Energy SUbmetering")
  lines(time,sub2, type="l", col="red")
  lines(time,sub3, type="l", col="blue")
  legend("topright", c("Sub-Metering_1", "Sub-Metering_2", "Sub-Metering_3"), lty=1.2, lwd=2, col=c("black","red","blue"))
  
  ##save to png file
  dev.copy(png,"Plot3.png", width =550, height =500)
  dev.off()
}