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


##Plot1
with(Data3,hist(Data3$Global_active_power, xlab="Global Active Power(kilowatts)", main="Global Active Power",col=2))
dev.copy(png,file="plot1.png",width = 480, height = 480, units = "px")
dev.off()

