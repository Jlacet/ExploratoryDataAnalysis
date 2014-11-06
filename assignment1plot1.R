data <- read.csv("data/household_power_consumption.txt", header = T, sep=";", na.strings="?")
## head(data)
## nrow(data)
data$Date <- as.Date(data$Date, format="%d/%m/%Y") ## change data format
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",] ## use only two days

## make histogram with title

hist(data$Global_active_power, col = "red", main = "Global Active power", xlab = "Global Active Power (kilowatts)")

## save graph in png file

dev.copy(png, file = "plot1.png")
dev.off()