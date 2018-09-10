# loading
power <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
names(power) <- tolower(names(power))

# subsetting 1-2/2/2007
power_feb <- subset(power, date == '1/2/2007' | date == '2/2/2007')

# changing factor to numeric
power_feb$global_active_power <- as.numeric(power_feb$global_active_power)
power_feb$voltage <- as.numeric(power_feb$voltage)
power_feb$global_reactive_power <- as.numeric(power_feb$global_reactive_power)
power_feb$sub_metering_1 <- as.numeric(power_feb$sub_metering_1)
power_feb$sub_metering_2 <- as.numeric(power_feb$sub_metering_2)
power_feb$sub_metering_3 <- as.numeric(power_feb$sub_metering_3)
energy_data <- data.frame(power_feb$date,power_feb$sub_metering_1, power_feb$sub_metering_2, power_feb$sub_metering_3)


# open png file
png(filename = "plot4.png")

#plotting
dimen <- dim(power_feb)
par(mfrow=c(2,2), mar = c(4,4,2,2))

# 1st plot
plot(power_feb$global_active_power, type = "l", xaxt = 'n', yaxt = "n",
     ylab = "Global Active Power", xlab = "")
axis(1, at=c(0,dimen[1]/2, dimen[1]),labels=c("Thu","Fri","Sat"))
axis(2, at = c(0, 1000, 2000, 3000), labels = c(0, 2, 4, 6))

# 2nd plot
plot(power_feb$voltage, type = "l", xaxt = 'n', yaxt = 'n',
     ylab = "Voltage", xlab = "datetime")
axis(1, at=c(0,dimen[1]/2, dimen[1]),labels=c("Thu","Fri","Sat"))
axis(2, at = c(800, 1200, 1600, 2000), labels = c(234, 238, 242, 246))

# 3rd plot
matplot(energy_data, type = "l", xaxt = 'n', yaxt = 'n', ylab = "Energy sub metering", 
        xlab = "", col = c(4,1,2))
axis(1, at=c(0,dimen[1]/2, dimen[1]),labels=c("Thu","Fri","Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c(1,2,4), lty = 1, cex = 0.6)
axis(2, at = c(0,10,20,30), labels = c(0,10,20,30))

# 4th plot
plot(power_feb$global_reactive_power, type = "l", xaxt = 'n', yaxt = 'n',
     ylab = "Global_reactive_power", xlab = "datetime")
axis(1, at=c(0,dimen[1]/2, dimen[1]),labels=c("Thu","Fri","Sat"))
axis(2, at = c(0, 40, 80, 120, 160, 200), labels = c(0, 0.1, 0.2, 0.3, 0.4, 0.5))

# close png file
dev.off()