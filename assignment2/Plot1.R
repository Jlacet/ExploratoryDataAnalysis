## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

### Question 1
total <- tapply(NEI$Emissions, NEI$year, sum)
## plot 1
par(mar = c(2, 2, 4, 2))
par(mfrow = c(1,1))
png("plot1.png")

plot(names(total), total, type="b", xlab = "Year", ylab = expression ("Total " ~ PM[2.5] ~"emissions (tons)"), main = expression("Total " ~ PM[2.5] ~ "emissions by year, in the US"), 
     col="olivedrab",lwd = 5)

dev.off()