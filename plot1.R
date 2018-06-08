# Read data
data<-read.table("household_power_consumption.txt",header=TRUE,na.strings="?",colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),sep=";")

# Format date/time
data$datetime<-paste(data$Date,data$Time)
data$datetime<-strptime(data$datetime,format="%d/%m/%Y %H:%M:%S")

#Subset data (pick one of either commands)
data<-subset(data,datetime>=("2007/02/01")&datetime<"2007/02/03")

#Create Plot 1
with(data, hist(Global_active_power,col="red",xlab="Global Active Power (kilowatts)",main="Global Active Power"))
dev.copy(png,"plot1.png")
dev.off()
