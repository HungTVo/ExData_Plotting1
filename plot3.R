# load data
d <- read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors =F,na.strings="?")
d1 <- d[d$Date=="1/2/2007" | d$Date=="2/2/2007",]

filename <- "plot3.png"

# make x, y
# x from Date and Time
t1 <- paste(d1$Date, d1$Time, sep=" ")
x <- strptime(t1, "%d/%m/%Y %H:%M:%S")

png(filename=filename, width=480, height=480)  
# call to draw
plot(x,d1$Sub_metering_1,type="l",xlab="", ylab="Energy sub metering")
lines(x, d1$Sub_metering_2, col="red")
lines(x, d1$Sub_metering_3, col="blue")

# make legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lwd=c(1,1,1),col=c("black","red","blue"))

# save histogram to file
# dev.copy(png,file=filename)
dev.off()
