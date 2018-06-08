# Read data
data<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),sep=";")

# Format date/time
data$datetime<-paste(data$Date,data$Time)
data$datetime<-strptime(data$datetime,format="%d/%m/%Y %H:%M:%S")

#Subset data (pick one of either commands)
data<-subset(data,datetime>=("2007/02/01")&datetime<"2007/02/03")

# Create Plot 4
par(mfcol=c(2,2),mar=c(5,4,2.5,1))
#top left
with(data,plot(datetime,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)"))
with(data,lines(datetime,Global_active_power))
#bottom left
with(data,plot(datetime,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
with(data, lines(datetime,Sub_metering_1,col="black"))
with(data, lines(datetime,Sub_metering_2,col="red"))
with(data, lines(datetime,Sub_metering_3,col="blue"))
legend("topright",legend=c(names(data)[7:9]),lty=1,col=c("black","red","blue"),box.lty=0,cex=0.75)
#top right
with(data,plot(datetime,Voltage,type="n"))
with(data,lines(datetime,Voltage))
#bottom right
with(data,plot(datetime,Global_reactive_power,type="n"))
with(data,lines(datetime,Global_reactive_power))
dev.copy(png,"plot4.png")
dev.off()