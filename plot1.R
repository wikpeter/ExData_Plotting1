

setwd("C:/Users/wikpeter/Documents/Coursera - Data Science/exdata-016/ExData_Plotting1")

## Relevant data starts at row 66638 and is 2880 rows long
data <- read.table("./data/household_power_consumption.txt",sep=";",dec=".",skip=66637,nrows=2880)
## Read header separately and add
header <- read.table("./data/household_power_consumption.txt", nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
colnames(data) <- unlist(header)

##setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y") )
##setAs("character","myTime", function(from) as.Date(from, format="%d/%m/%Y") )

png(file="plot1.png")
hist(data$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()