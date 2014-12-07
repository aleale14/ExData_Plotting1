plot1 <- function(){
      #read data
      data<-read.csv2("household_power_consumption.txt",colClasses="character")
      #subset data to given dates
      d<-subset(data,Date=="1/2/2007" | Date=="2/2/2007")
      #make target variable numeric
      d$Global_active_power<-as.numeric(d$Global_active_power)
      #plot on screen
      hist(d$Global_active_power,xlim=c(0,6),ylim=c(0,1200),include.lowest=TRUE,col="red",xlab="Global Active Power (kilowatts)", main="Global active power")
      #copy plot on png
      dev.copy(png, file = "plot1.png",width=480,height=480)
      #close png
      dev.off()
}
