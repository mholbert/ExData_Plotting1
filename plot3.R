# read in the bulk table
tblBulk <- read.table("household_power_consumption.txt", nrows=150000, header=TRUE, sep=";", stringsAsFactors=FALSE,na.strings="?")

# convert the date column
tblBulk$Date <- as.POSIXct(paste(tblBulk$Date, tblBulk$Time), format="%d/%m/%Y %H:%M:%S")

# subset the data
tblSub <- subset(tblBulk, Date>=as.POSIXct("2007-02-01 00:00:00") & Date<=as.POSIXct("2007-02-02 23:59:59"))
na.omit(tblSub)

# draw the graph
plot(tblSub$Date, tblSub$Sub_metering_1, type="1", xlab="", ylab="Energy sub metering")
lines(tblSub$Date, tblSub$Sub_metering_2,col="red")
lines(tblSub$Date, tblSub$Sub_metering_3,col="blue")
legend("topright", col = c("black","red","blue"), lty = c(1,1,1), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.copy(png, file="Plot3.png")
dev.off()