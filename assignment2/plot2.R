## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Question 2
baltimore <- subset (NEI, fips == "24510")
total <- tapply(baltimore$Emissions, baltimore$year, sum)

## plot 2
png("plot2.png")
plot(names(total), total, type = "b", xlab="Year", ylab= expression("Total" ~ PM[2.5] ~ "emissions (tons)"), main=expression("Total " ~ PM[2.5] ~ "emissions by year, in Baltimore"), col = "seagreen",lwd = 5)


dev.off() 