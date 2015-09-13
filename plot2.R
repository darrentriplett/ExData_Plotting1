
power <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?", stringsAsFactors = F)

#Convert Date to "Date" class
power$Date <-format(power$Date, format = "%d %m %Y")
power$Date <-as.Date(power$Date, format = "%d/%m/%Y")

#Subset data based on date
power2 <- subset(power, Date == "2007-02-01" | Date == "2007-02-02" )

#Create one variable for Date and time
power2$Date.time <- paste(power2$Date, power2$Time)

power2$Date.time <- strptime(power2$Date.time, "%Y-%m-%d %H:%M:%S")

#save plot to working folder as .png
png('plot2.png')
plot(power2$Date.time, power2$Global_active_power, type="l",  ylab="Global Active Power (kilowatts)", xlab="")


dev.off()
