# load data
d <- read.table("household_power_consumption.txt",sep=";",header=T,stringsAsFactors =F,na.strings="?")
d1 <- d[d$Date=="1/2/2007" | d$Date=="2/2/2007",]

filename <- "plot1.png"
#png(filename=filename, width=480, height=480)

# call to draw hist()
hist(d1$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

# save histogram to file
dev.copy(png,file=filename)
dev.off()
