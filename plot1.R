## Read in the File from working directory
        powah<-read.csv("household_power_consumption.txt",sep=";",na.strings="?")
        
#strip out just the two days in feb we care about
        powfeb<-subset(powah,Date=="1/2/2007"|Date=="2/2/2007")
        
# Make a new column with Date+time and actually make it a date
        powfeb$DateTime<-(as.POSIXct(paste(powfeb$Date,powfeb$Time),format="%d/%m/%Y %H:%M:%S"))
        
# Add day of the week column for later
        powfeb$DOTW<-weekdays(powfeb$DateTime)

        
#Because this isnt the first thing I've done today, reset my grid to 1x1
        par(mfrow=c(1,1))

#Draw a red histogram with a title and xlabel to make sure it looks right
        hist(powfeb$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")

#Could have copied it but where's the fun in that
        png(filename = "plot1.png", width = 480, height = 480)
        hist(powfeb$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
        dev.off()