# read the data
source_data <- read.table(	"../household_power_consumption.txt", 
				sep = ";", header = TRUE, na.strings = "?", 
				colClasses = c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric")
 	 			)
							
# convert column Time into date/time							
source_data$Time <- 
	strptime(paste(source_data$Date, source_data$Time), "%d/%m/%Y %H:%M:%S", tz = "UTC")

# convert column Date into date
source_data$Date <- 
	as.Date(strptime(source_data$Date, "%d/%m/%Y"))
	
# restrict on data to 1st and 2nd of February 2007
restricted_data <- source_data[source_data$Date >= "2007-02-01" & source_data$Date <= "2007-02-02",]

# open png file device
png(file = "plot3.png")

# set locale to English so that the abbreviations for the weekdays show in English
Sys.setlocale("LC_TIME", "C")
# create an empty plot with correct labels
plot(restricted_data$Time, restricted_data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
# add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
# add lines for Sub_metering_1, Sub_metering_2, Sub_metering_3
lines(restricted_data$Time, restricted_data$Sub_metering_1, col="black")
lines(restricted_data$Time, restricted_data$Sub_metering_2, col="red")
lines(restricted_data$Time, restricted_data$Sub_metering_3, col="blue")

# close png file device
dev.off()
