plot1 <- function () {
  data <- read.table("hpc.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
  ## subset the data
  sorted_data <- data[data$Date %in% c("1/2/2007","2/2/2007")]
  
  ## paste the time and date and format them accordingly
  time <- strptime(paste(sorted_data$Date, sorted_data$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")
  
  ##Convert global active power into numeric value before plotting
  global <- as.numeric(sorted_data$Global_active_power)
  
  ##Create t he plot
  plot(time, global, type="l",xlab="",ylab="Global Active Power (kilowatts)")
  
  ##save to png file
  dev.copy(png,"Plot2.png")
  dev.off()
}