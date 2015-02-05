setwd("C:/BigData/4 Exploratory Data Analysis/1 неделя/data")

vars <- c("character", "character", rep("numeric", 7)) 
tabvar<-read.table("household_power_consumption.txt", h=1, nrows=70000, sep=";", colClasses=vars, na.strings="?")
tabvar$Date <- strptime(paste(tabvar$Date,tabvar$Time), "%d/%m/%Y %H:%M:%S")

tab<-tabvar[(tabvar$Date>="2007-02-01 00:00:00" & tabvar$Date<"2007-02-03 00:00:00"),]
par(mfrow = c(1, 1), pch=1, bg = "transparent")
hist(tab$Global_active_power, col="red",  main = "Global Active Power", xlab="Global Active Power (killowatts)")
## Create plot on screen device 
dev.copy(png, file = "plot1.png", width=480, height=480) ## Copy my plot to a PNG file
dev.off() ##  close the PNG device!

