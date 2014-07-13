# read in the bulk table
tblBulk <- read.table("household_power_consumption.txt", nrows=150000, header=TRUE, sep=";", stringsAsFactors=FALSE,na.strings="?")

# convert the date column
tblBulk$Date <- as.Date(tblBulk$Date , "%d/%m/%Y")

# subset the data
tblSub <- subset(tblBulk, Date>="2007-02-01" & Date<="2007-02-02")
na.omit(tblSub)

# draw the graph
hist(tblSub$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.copy(png, file="Plot1.png")
dev.off()