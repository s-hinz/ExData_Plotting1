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
png(file = "plot1.png")

# create histogram for Global_active_power
hist(	restricted_data$Global_active_power, col="red", 
	xlab = "Global Active Power (kilowatts)", main = "Global Active Power"
	)

# close png file device
dev.off()
