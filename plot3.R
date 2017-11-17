# Set working directory
setwd("./Documents/Github/ExData_Plotting1")

# Read text file
data <- read.table(file = "household_power_consumption.txt",header = TRUE, sep = ";", na.strings = "?")

# Convert Date variable to date class
data$Date <- as.Date(data$Date, "%d/%m/%Y")

# Subset the data based on dates 2007-02-01 and 2007-02-02
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

# Create a datetime variable
data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)

# Create Plot 3

plot(data$Sub_metering_1 ~ data$datetime, type = "l", 
     ylab = "Energy sub metering", xlab = "")
lines(data$Sub_metering_2 ~ data$datetime, col = "Red")
lines(data$Sub_metering_3 ~ data$datetime, col = "Blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save file
dev.copy(png, file = "plot3.png", height = 480, width = 480)
dev.off()