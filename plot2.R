# load data
d <- read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors =F,na.strings="?")
d1 <- d[d$Date=="1/2/2007" | d$Date=="2/2/2007",]

filename <- "plot2.png"
#png(filename=filename, width=480, height=480)

# make x, y
# x from Date and Time
t1 <- paste(d1$Date, d1$Time, sep=" ")
x <- strptime(t1, "%d/%m/%Y %H:%M:%S")
# y from Global_active_power
y <- d1$Global_active_power
  
# call to draw
plot(x,y,type="l",xlab="", ylab="Global Active Power (kilowatts)")

# save histogram to file
dev.copy(png,file=filename)
dev.off()
