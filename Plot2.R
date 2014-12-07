plot2 <- function(){
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
      #make target variable numeric
      d$Global_active_power<-as.numeric(d$Global_active_power)
      #plot on screen
      plot(d$temp,d$Global_active_power,type="l",ylab="Global Active Power (kilowatts)", xlab=" ")
      #copy plot on png
      dev.copy(png, file = "plot2.png", width=480, height=480)
      #close png
      dev.off()
}
