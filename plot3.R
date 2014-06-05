# JHU Data Science Specialization - Exploratory Data Analysis
# Course Project 1 - Making Plots
# Student: Mark Drummond <8med5@queensu.ca>
plot3 <- function () {
  # Read and pre-process the data set
  my.data <- read.table("data/household_power_consumption.txt",
                        header = TRUE,
                        sep = ";",
                        na.strings = "?",
                        comment.char = "",
                        colClasses = c(rep("character",2),rep("numeric",7)))
  
  # Merge the Date and Time columns into something more useful
  my.data$DateTime <- strptime(paste(my.data$Date, my.data$Time),
                               "%d/%m/%Y %H:%M:%S", tz = "")
  
  # Generate the chart and write to file
  png(filename = "plot3.png", width = 480, height = 480)
  plot(my.data$DateTime, my.data$Sub_metering_1,
       type = "l",
       xlab = "", ylab = "Energy sub metering")
  lines(my.data$DateTime, my.data$Sub_metering_2,
        col = "red")
  lines(my.data$DateTime, my.data$Sub_metering_3,
        col = "blue")
  legend("topright", lty = 1,
         col = c("black","red","blue"),
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.off()
}