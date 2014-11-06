data <- read.csv("data/household_power_consumption.txt", header = T, sep=";", na.strings="?")
head(data)
## nrow(data)
data$Date <- as.Date(data$Date, format="%d/%m/%Y") ## change data format
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",] ## use only two days

## convert datetime

datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime)

## make a line plot

plot(data$Global_active_power ~ data$datetime,type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")


## save graph in png file

dev.copy(png, file = "plot2.png")
dev.off()