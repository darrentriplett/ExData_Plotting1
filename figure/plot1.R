library(lubridate)
power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = F)

#Convert Date to "Date" class
power$Date <-format(power$Date, format = "%d %m %Y")
power$Date <-as.Date(power$Date, format = "%d/%m/%Y")

#Subset data based on date
power2 <- subset(power, Date == "2007-02-01" | Date == "2007-02-02" )

#Create one variable for Date and time
power2$Date.time <- paste(power2$Date, power2$Time)

power2$Date.time <- strptime(power2$Date.time, "%Y-%m-%d %H:%M:%S")

#create histogram

hist (power2$Global_active_power, col="red", 
     xlab = "Global Active Power (kilowatts)",
      main= "Global Active Power")

#save histogram to working folder as .png
png('plot1.png')
hist (power2$Global_active_power, col="red", 
      xlab = "Global Active Power (kilowatts)",
      main= "Global Active Power", width=480, height=480)
dev.off()
