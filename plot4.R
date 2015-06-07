##Data1: load all data
TopData1<-read.table("household_power_consumption.txt", nrows=50, header=TRUE, sep=";" )
DataClass<-sapply(TopData1, class)
Data1<-read.table("household_power_consumption.txt", header=TRUE,sep=";",colClass=DataClass, na.strings="?")

##Data2: extract data from 2007-02-01 and 2007-02-02.
Data1$Date<-as.Date(Data1$Date, format = "%d/%m/%Y")
Date2007<-as.Date(c("2007-02-01","2007-02-02"))
Data2<-Data1[Data1$Date %in% Date2007, ]

##Data3: conbine Date and Time
Date1<-as.character(Data2$Date)
Time1<-as.character(Data2$Time)
DT<-paste(Date1,Time1)
DT<-strptime(DT, format="%Y-%m-%d %H:%M:%S")
Data3<-cbind(Data2,DT)


##Plot4

par(mfrow=c(2,2))
#1
with(Data3,plot(Data3$DT,Data3$Global_active_power,xlab="", ylab="Global Active Power(kilowatts)", type="l"))
#2
with(Data3,plot(Data3$DT,Data3$Voltage, xlab="datatime", ylab="Voltage", type="l"))
#3
plot(Data3$DT,Data3$Sub_metering_1, xlab="",type="l",col="black",ylab="Energy sub metering")
lines(Data3$DT,Data3$Sub_metering_2, xlab="",type="l",col="red")
lines(Data3$DT,Data3$Sub_metering_3, xlab="",type="l",col="blue")
legend("topright",lty=c(1,1,1),col=c("black","red","blue"),legend=c("Sub_meeting_1","Sub_meeting_2","Sub_meeting_3"),cex = 0.5,bty="n")
#4
with(Data3,plot(Data3$DT,Data3$Global_reactive_power, xlab="datatime", ylab="Global_reactive_power", type="l"))
#png file
dev.copy(png,file="plot4.png",width = 480, height = 480, units = "px")
dev.off()
