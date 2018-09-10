# loading
power <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
names(power) <- tolower(names(power))

# subsetting 1-2/2/2007
power_feb <- subset(power, date == '1/2/2007' | date == '2/2/2007')

# changing factor to numeric
power_feb$sub_metering_1 <- as.numeric(power_feb$sub_metering_1)
power_feb$sub_metering_2 <- as.numeric(power_feb$sub_metering_2)
power_feb$sub_metering_3 <- as.numeric(power_feb$sub_metering_3)
energy_data <- data.frame(power_feb$date,power_feb$sub_metering_1, power_feb$sub_metering_2, power_feb$sub_metering_3)

# open png file
png(filename = "plot3.png")

#plotting
dimen <- dim(energy_data)
matplot(energy_data, type = "l", xaxt = 'n', yaxt = 'n', ylab = "Energy sub metering", 
        xlab = "", col = c(4,1,2))
axis(1, at=c(0,dimen[1]/2, dimen[1]),labels=c("Thu","Fri","Sat"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col=c(1,2,4), lty = 1, cex = 0.8)
axis(2, at = c(0,10,20,30), labels = c(0,10,20,30))

# close png file
dev.off()