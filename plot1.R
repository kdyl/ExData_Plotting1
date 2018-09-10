# loading
power <- read.table("household_power_consumption.txt", header = TRUE, sep=";")
names(power) <- tolower(names(power))


# subsetting 1-2/2/2007
power_feb <- subset(power, date == '1/2/2007' | date == '2/2/2007')

# changing factor to numeric
power_feb$global_active_power <- as.numeric(power_feb$global_active_power)

# open png file
png(filename = "plot1.png")
    
#plotting
dimen <- dim(power_feb)
hist(power_feb$global_active_power, col="red", xaxt = 'n',
     main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
axis(1, at=c(0,dimen[1]/3,dimen[1]*2/3, dimen[1]),labels=c(0,2,4,6))



# close png file
dev.off()