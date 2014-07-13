# read in the bulk table
tblBulk <- read.table("household_power_consumption.txt", nrows=150000, header=TRUE, sep=";", stringsAsFactors=FALSE,na.strings="?")

# convert the date column
tblBulk$Date <- as.POSIXct(paste(tblBulk$Date, tblBulk$Time), format="%d/%m/%Y %H:%M:%S")

# subset the data
tblSub <- subset(tblBulk, Date>=as.POSIXct("2007-02-01 00:00:00") & Date<=as.POSIXct("2007-02-02 23:59:59"))
na.omit(tblSub)

# draw the graph
png("Plot2.png", width=480, height=480, units="px")
plot(tblSub$Date, tblSub$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#dev.copy(png, file="Plot2.png")
dev.off()