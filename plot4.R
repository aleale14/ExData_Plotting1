plot4<-function() {
      #read data
      data<-read.csv2("household_power_consumption.txt",colClasses="character")
      #subset data to given dates
      d<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")
      #create temp variable to capture time data
      temp<-paste(d$Date,d$Time)
      #include the temp variable in the analysis dataset
      temp<-strptime(temp,"%d/%m/%Y %H:%M:%S")
      #include the temp variable in the analysis dataset
      d<-cbind(d,temp)
      #make target variables numeric
      d$Global_active_power<-as.numeric(d$Global_active_power)
      d$Voltage<-as.numeric(d$Voltage)
      d$Sub_metering_1<-as.numeric(d$Sub_metering_1)
      d$Sub_metering_2<-as.numeric(d$Sub_metering_2)
      d$Sub_metering_3<-as.numeric(d$Sub_metering_3)
      d$Global_reactive_power<-as.numeric(d$Global_reactive_power)
      #initialize window
      windows(width=5, height=5)
      #define number of graphs in window
      par(mfrow=c(2,2))
      #set margins
      par(mar=c(4,4,1,1))
      #plot on screen in order
      plot(d$temp,d$Global_active_power,type="l",ylab="Global Active Power", xlab=" ")
      plot(d$temp,d$Voltage,type="l",ylab="Voltage", xlab=" ")
      plot(d$temp,d$Sub_metering_1,type="l",col="black",xlab=" ",ylab=" ")
      lines(d$temp,d$Sub_metering_2,type="l",col="red",xlab=" ",ylab=" ")
      lines(d$temp,d$Sub_metering_3,type="l",col="blue",xlab=" ",ylab=" ")
      title(xlab=" ",ylab="Energy sub metering")
      legend("topright", lty=1, col = c("black","blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
      plot(d$temp,d$Global_reactive_power,type="l",ylab="Global_reactive_power", xlab="datetime")
      #copy plot on png
      dev.copy(png, file = "plot4.png", width=480, height=480)
      #close png
      dev.off()
}
