

setwd("C:/Users/wikpeter/Documents/Coursera - Data Science/exdata-016/ExData_Plotting1")

## Relevant data starts at row 66638 and is 2880 rows long
data <- read.table("./data/household_power_consumption.txt",sep=";",dec=".",skip=66637,nrows=2880,colClasses=c("character", "character", "numeric", "numeric","numeric","numeric","numeric","numeric","numeric"))
## Read header separately and add
header <- read.table("./data/household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
colnames(data) <- unlist(header)

## New datetime column
data$dateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y%H:%M:%S")

## Set right locale to show days of week in English
Sys.setlocale("LC_TIME", "English")

png(file="plot3.png")
plot(data$dateTime,data$Sub_metering_1,ylab="Energy sub metering",xlab="",type="l")
lines(data$dateTime,data$Sub_metering_2,col="red")
lines(data$dateTime,data$Sub_metering_3,col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
dev.off()