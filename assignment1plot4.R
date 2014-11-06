data <- read.csv("data/household_power_consumption.txt", header = T, sep=";", na.strings="?")
head(data)
## nrow(data)
data$Date <- as.Date(data$Date, format="%d/%m/%Y") ## change data format
data <- data[data$Date == "2007-02-01" | data$Date == "2007-02-02",] ## use only two days

datetime <- paste(as.Date(data$Date), data$Time)
data$datetime <- as.POSIXct(datetime)


## make a plot with 4 graphs

par(mfrow = c(2,2))
with(data, {
        plot(data$Global_active_power ~ data$datetime,type = "l", 
             ylab = "Global Active Power", xlab = "")
        plot(Voltage ~ datetime, type = "l", ylab = "Voltage", xlab = "datetime")
        plot(Sub_metering_1 ~ datetime, type = "l", ylab = "Energy sub metering", xlab = "")
        lines(Sub_metering_2 ~ datetime, col = "red")
        lines(Sub_metering_3 ~ datetime, col = "blue")
        legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 1,
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
               cex = 0.8)
        plot(Global_reactive_power ~ datetime, type = "l", xlab = "datetime")
})

## save graph in png file

dev.copy(png, file = "plot4.png", width = 700)
dev.off()

