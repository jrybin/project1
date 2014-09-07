# Exploratory data analysis - course project 1 - plot 1

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

# Creating plot #1.
hist(data$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Saving plot #1 to file.
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()