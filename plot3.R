# Exploratory data analysis - course project 1 - plot 3

# Getting the data
# Download the data and place it wherever you want, following line asks you to choose the file.
data_full<-read.csv(file.choose(),
                    header=T, sep=';', na.strings="?", 
                    nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

data_full$Date<-as.Date(data_full$Date,format="%d/%m/%Y")

# Subsetting required data.
data<-subset(data_full,subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(data_full)

#Converting dates.
datetime<-paste(as.Date(data$Date), data$Time)
data$Datetime<-as.POSIXct(datetime)

# Creating plot #3.
with(data, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Energy Sub Metering", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Saving plot #3 to file.
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()