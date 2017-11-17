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

# Create Plot 4

par(mfrow = c(2,2), mar = c(4,4,1,1))

plot(data$Global_active_power ~ data$datetime, type = "l", 
       ylab = "Global Active Power", xlab = "")
  
plot(data$Voltage ~ data$datetime, type = "l", ylab = "Voltage", xlab = "datetime")
  
plot(data$Sub_metering_1 ~ data$datetime, type="l", 
       ylab = "Energy sub metering", xlab = "")
lines(data$Sub_metering_2 ~ data$datetime, col = 'Red')
lines(data$Sub_metering_3 ~ data$datetime, col = 'Blue')
legend("topright", col = c("black", "red", "blue"), lty = 1, bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
plot(data$Global_reactive_power ~ data$datetime, type = "l", 
       ylab = "Global_reactive_power",xlab = "datetime")

# Save file
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()