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

# Create Plot 2
plot(data$Global_active_power ~ data$datetime, type = "l",
     ylab = "Global Active Power (kilowatts)", xlab=  "")

# Save file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()