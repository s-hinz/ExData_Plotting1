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
png(file = "plot2.png")

# set locale to English so that the abbreviations for the weekdays show in English
Sys.setlocale("LC_TIME", "C")
# create plot for Time and Global_active_power
plot(restricted_data$Time, restricted_data$Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# close png file device
dev.off()
