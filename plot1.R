setwd("~/Документы/Courses/Exploratory_Data_Analysis/ExData_Plotting1")

colClasses <- c("character","character",rep("numeric",7))
dataset <- read.table(file = "household_power_consumption.txt",
                      sep = ";", 
                      na.strings="?", 
                      header=TRUE,
                      colClasses = colClasses)
subset <- dataset[dataset$Date %in% c("1/2/2007","2/2/2007"),]

hist(x = subset$Global_active_power, 
     col = "red", 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png,"figure/plot1.png",width=480,height=480)
dev.off()
