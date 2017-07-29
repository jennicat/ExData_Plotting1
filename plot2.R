## Read in the File from working directory
        powah<-read.csv("household_power_consumption.txt",sep=";",na.strings="?")
        
#strip out just the two days in feb we care about
        powfeb<-subset(powah,Date=="1/2/2007"|Date=="2/2/2007")
        
# Make a new column with Date+time and actually make it a date
        powfeb$DateTime<-(as.POSIXct(paste(powfeb$Date,powfeb$Time),format="%d/%m/%Y %H:%M:%S"))
        
#Because this isnt the first thing I've done today, reset my grid to 1x1
        par(mfrow=c(1,1))

#Draw a timeseries graph on the screen to make sure it looks right
        plot(powfeb$DateTime, powfeb$Global_active_power,xlab="", ylab="Global Active Power (kilowatts)", type="n")
        lines(powfeb$DateTime,powfeb$Global_active_power)

# Copy it to png
        #png(filename = "plot2.png", width = 480, height = 480)
        dev.copy(png,"plot2.png",width=480,height=480)
        dev.off()