# load data
d <- read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors =F,na.strings="?")
d1 <- d[d$Date=="1/2/2007" | d$Date=="2/2/2007",]

filename <- "plot4.png"

# make x, y
# x from Date and Time
t1 <- paste(d1$Date, d1$Time, sep=" ")
x <- strptime(t1, "%d/%m/%Y %H:%M:%S")

# dev.off(); # dev.new(width=6, height=6)
# windows(record=TRUE, width=8, height=6)
	
par(mfrow=c(2,2))
par(mar=c(4,4,2,2))
# call to draw
t1 <- paste(d1$Date, d1$Time, sep=" ")
x <- strptime(t1, "%d/%m/%Y %H:%M:%S")

# png(filename=filename, width=480, height=480)  

# 1
plot(x,d1$Global_active_power,type="l",xlab="", ylab="Global Active Power")
plot(x,d1$Voltage,type="l",xlab="datetime", ylab="Voltage")

# 3
# call to draw
plot(x,d1$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
lines(x, d1$Sub_metering_2, col="red")
lines(x, d1$Sub_metering_3, col="blue")

# make legend
legend("top",
		c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
		lwd=c(1,1,1),col=c("black","red","blue"),
		cex=0.5,
		bty="n")#,
		# text.width=360)

# 4
plot(x,d1$Global_reactive_power,type="l",xlab="datetime", ylab="Global_reactive_power")


# save histogram to file
dev.copy(png,file=filename,width = 480,height = 480)
dev.off()
