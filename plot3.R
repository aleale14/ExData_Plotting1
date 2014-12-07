plot3<-function() {
      #read data
      data<-read.csv2("household_power_consumption.txt",colClasses="character")
      #subset data to given dates
      d<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")
      #create temp variable to capture time data
      temp<-paste(d$Date,d$Time)
      #make target variable in time format
      temp<-strptime(temp,"%d/%m/%Y %H:%M:%S")
      #include the temp variable in the analysis dataset
      d<-cbind(d,temp)
      #make target variables numeric
      d$Sub_metering_1<-as.numeric(d$Sub_metering_1)
      d$Sub_metering_2<-as.numeric(d$Sub_metering_2)
      d$Sub_metering_3<-as.numeric(d$Sub_metering_3)
      #initialize windows
      windows(width=5, height=5)
      #plot on screen
      plot(d$temp,d$Sub_metering_1,type="l",col="black",xlab=" ",ylab=" ")
      lines(d$temp,d$Sub_metering_2,type="l",col="red",xlab=" ",ylab=" ")
      lines(d$temp,d$Sub_metering_3,type="l",col="blue",xlab=" ",ylab=" ")
      title(xlab=" ",ylab="Energy sub metering")
      legend("topright", lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
      #copy plot on png
      dev.copy(png, file = "plot3.png", width=480, height=480)
      #close png
      dev.off()
}
