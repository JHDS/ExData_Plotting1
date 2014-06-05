# JHU Data Science Specialization - Exploratory Data Analysis
# Course Project 1 - Making Plots
# Student: Mark Drummond <8med5@queensu.ca>
plot2 <- function () {
  # Read and pre-process the data set
  my.data <- read.table("data/household_power_consumption.txt",
                        header = TRUE,
                        sep = ";",
                        na.strings = "?",
                        colClasses = c(rep("character",2),rep("numeric",7)),
                        comment.char = "")
  
  # Merge the Date and Time columns into something more useful
  my.data$DateTime <- paste(my.data$Date,my.data$Time)
  my.data$DateTime <- strptime(my.data$DateTime, "%d/%m/%Y %H:%M:%S", tz = "")
  
  # Generate the chart and write to file
  png(filename = "plot2.png",width = 480, height = 480)
  plot(my.data$DateTime,my.data$Global_active_power,
        type = "l",
        xlab = "", ylab = "Global Active Power (kilowatts)")
  dev.off()
}