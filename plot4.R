## Read in the File from working directory
        powah<-read.csv("household_power_consumption.txt",sep=";",na.strings="?")
        
#strip out just the two days in feb we care about
        powfeb<-subset(powah,Date=="1/2/2007"|Date=="2/2/2007")
        
# Make a new column with Date+time and actually make it a date
        powfeb$DateTime<-(as.POSIXct(paste(powfeb$Date,powfeb$Time),format="%d/%m/%Y %H:%M:%S"))
        
#Because this isnt the first thing I've done today, reset my grid to 2x2
        par(mfcol=c(2,2))

#Draw 2x2 grid of four graphs
        
        #upper left
        plot(powfeb$DateTime, powfeb$Global_active_power,xlab="", ylab="Global Active Power", type="n")
        lines(powfeb$DateTime,powfeb$Global_active_power)
        
        # lower left
        plot(powfeb$DateTime, powfeb$Sub_metering_1,xlab="", ylab="Energy sub metering", type="n")
        lines(powfeb$DateTime, powfeb$Sub_metering_1)
        lines(powfeb$DateTime, powfeb$Sub_metering_2,col="red")
        lines(powfeb$DateTime, powfeb$Sub_metering_3,col="blue")
        legend("topright",col=c("black","red","blue"),
               legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),bty="n",cex=0.75)
        
        #upper right
        plot(powfeb$DateTime, powfeb$Voltage,xlab="datetime", ylab="Voltage", type="n")
        lines(powfeb$DateTime,powfeb$Voltage) 
        
        #lower right
        plot(powfeb$DateTime, powfeb$Global_reactive_power,xlab="datetime", ylab="Global_reactive_power", type="n")
        lines(powfeb$DateTime,powfeb$Global_reactive_power) 

# Copy it to png
        #png(filename = "plot4.png", width = 480, height = 480)
        dev.copy(png,"plot4.png",width=480,height=480)
        dev.off()