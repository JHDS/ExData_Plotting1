# JHU Data Science Specialization - Exploratory Data Analysis
# Course Project 1 - Making Plots
# Student: Mark Drummond <8med5@queensu.ca>
plot1 <- function () {
  # Read and pre-process the data set.
  my.data <- read.table("data/household_power_consumption.txt",
                        header = TRUE,
                        sep = ";",
                        na.strings = "?",
                        comment.char = "",
                        colClasses = c(rep("character",2),rep("numeric",7)))
  
  # Generate the chart and write to file
  png(filename = "plot1.png", width = 480, height = 480)
  hist(my.data$Global_active_power,
       col = "red", border = "black",
       main = "Global Active Power",
       xlab = "Global Active power (kilowatts)",
       xlim = c(0,6), ylim = c(0,1200))
  dev.off()
}