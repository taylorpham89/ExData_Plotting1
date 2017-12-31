plot1 <- function () {
  data <- read.table("hpc.txt", header = TRUE, sep=";", stringsAsFactors = FALSE)
  
  ##Formet the date
  data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
  
  ##selecting relevant subset
  sorted_data <- data[data$Date >= "2007-02-01" & data$Date <= "2007-02-02",]
  
  ##creating histogram with lables and name
  hist(globalActivePower, col="red", main ="Global Active Power", xlab ="Global Active Power (kilowatts)")
  
  ##save to png file
  dev.copy(png,"Plot1.png")
  dev.off()
}