# JHU Data Science Specialization - Exploratory Data Analysis
# Course Project 1 - Making Plots
# Student: Mark Drummond <8med5@queensu.ca>
plot4 <- function () {
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
  png(filename = "plot4.png", width = 480, height = 480)
  par(mfrow = c(2,2))
  
  # Plot 1 - Top Left
  plot(my.data$DateTime, my.data$Global_active_power,
       type = "l",
       xlab = "", ylab = "Global Active Power")

  # Plot 2 - Top Right
  plot(my.data$DateTime, my.data$Voltage,
       type = "l",
       xlab = "datetime", ylab = "Voltage")
  
  # Plot 3 - Bottom Left
  plot(my.data$DateTime, my.data$Sub_metering_1,
       type = "l",
       xlab = "", ylab = "Energy sub metering")
  lines(my.data$DateTime, my.data$Sub_metering_2,
        col = "red")
  lines(my.data$DateTime, my.data$Sub_metering_3,
        col = "blue")
  legend("topright", bty = "n", lty = 1,
         col = c("black","red","blue"),
         legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  
  # Plot 4 - Bottom Right
  plot(my.data$DateTime, my.data$Global_reactive_power,
       type = "l",
       xlab = "datetime", ylab = "Global_reactive_power")
  
  dev.off()
}