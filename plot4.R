
power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = F)

#Convert Date to "Date" class
power$Date <-format(power$Date, format = "%d %m %Y")
power$Date <-as.Date(power$Date, format = "%d/%m/%Y")

#Subset data based on date
power2 <- subset(power, Date == "2007-02-01" | Date == "2007-02-02" )

#Create one variable for Date and time
power2$Date.time <- paste(power2$Date, power2$Time)

power2$Date.time <- strptime(power2$Date.time, "%Y-%m-%d %H:%M:%S")

#Create png and graphs
png('plot4.png')
par(mfrow = c(2,2))
with(power2, {
  plot(Date.time, Global_active_power, type="l", ylab="Global Active Power")
  plot(Date.time, Voltage, type="l", ylab= "Voltage", xlab="datetime")
  
  with(power2, plot(Date.time, Sub_metering_1, type="l", ylab="Energy sub metering", xlab=""))
  with(power2, points(Date.time, Sub_metering_2, col="red", type="l"))
  with(power2, points(Date.time, Sub_metering_3, col="blue", type="l"))
  legend("topright", lwd= 2, cex=0.9, bty="n", col=c("black", "blue", "red"),legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
  
  plot(Date.time, Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")
})

dev.off()


