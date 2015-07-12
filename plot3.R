setwd("~/Документы/Courses/Exploratory_Data_Analysis/ExData_Plotting1")

colClasses <- c("character","character",rep("numeric",7))
dataset <- read.table(file = "household_power_consumption.txt",
                      sep = ";", 
                      na.strings="?", 
                      header=TRUE,
                      colClasses = colClasses)
subset <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]
subset$datetime <- strptime(paste(subset$Date, subset$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

plot(x = subset$datetime, 
     y = subset$Sub_metering_1, 
     type="l", 
     xlab="", 
     ylab="Global Active Power (kilowatts)")
lines(x = subset$datetime, 
      y = subset$Sub_metering_2, 
      type="l",
      col = 'Red')
lines(x = subset$datetime, 
      y = subset$Sub_metering_3, 
      type="l",
      col = 'Blue')
legend("topright", 
       col = c("black", "red", "blue"), 
       lty = 1,
       legend = c("Sub_metering_1", 
                  "Sub_metering_2", 
                  "Sub_metering_3"))

dev.copy(png,"figure/plot3.png",width=480,height=480)
dev.off()
