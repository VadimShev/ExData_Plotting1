setwd("C:/BigData/4 Exploratory Data Analysis/1 неделя/data")
Sys.setlocale("LC_TIME", "English")
vars <- c("character", "character", rep("numeric", 7)) 
tabvar<-read.table("household_power_consumption.txt", h=1, nrows=70000, sep=";", colClasses=vars, na.strings="?")
tabvar$Date <- strptime(paste(tabvar$Date,tabvar$Time), "%d/%m/%Y %H:%M:%S")

tab<-tabvar[(tabvar$Date>="2007-02-01 00:00:00" & tabvar$Date<"2007-02-03 00:00:00"),]

par(mfrow = c(2, 2), pch=".", bg = "transparent", cex=0.5)

with(tab, {
  plot(Date, Global_active_power, xlab="", ylab="Global Active Power")
  lines(Date, Global_active_power, lwd=1)
})

with(tab, {
  plot(Date, Voltage, xlab="", ylab="Voltage")
  lines(Date, Voltage, lwd=1)
})

with(tab, {
        plot(Date,  Sub_metering_1, xlab="",  ylab=" ", ylim=c(0,38))
        lines(Date, Sub_metering_1, lwd=1, ylim=c(0,38) )
})       
par(new=T)
with(tab, {
         plot(Date,  Sub_metering_2, xlab="", ylab=" ", col="red", ylim=c(0,38))
         lines(Date, Sub_metering_2, lwd=1, col="red", ylim=c(0,38))
})   
par(new=T)
with(tab, {
     plot(Date, Sub_metering_3, xlab="", ylab="Energy metering", col="blue", ylim=c(0,38))
     lines(Date, y=Sub_metering_3, lwd=1, col="blue", ylim=c(0,38))
})
legend("topright", lwd=1, col = c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
## Create plot on screen device 

with(tab, {
  plot(Date, Global_reactive_power, xlab="", ylab="Global Reactive Power")
  lines(Date, Global_reactive_power, lwd=1)
})

dev.copy(png, file = "plot4.png",  width=480, height=480) ## Copy my plot to a PNG file
dev.off() ##  close the PNG device!
