## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# question 5
# Baltimore - on road
NEI$year <- factor(NEI$year, levels = c('1999', '2002', '2005', '2008'))
baltveh <- subset (NEI, fips == "24510" & type == "ON-ROAD")

# Aggregate

baltveh <- aggregate(baltveh[, "Emissions"], by = list(baltveh$year), sum)
colnames(baltveh) <- c("year", "emissions")

png('plot5.png')
ggplot(baltveh, aes(year, emissions)) + 
        geom_bar(aes(fill= year), stat = "identity") + 
        ggtitle("Total emissions of vehicles in Baltimore") + 
        ylab(expression("Total" ~ PM[2.5] ~ "emissions (tons)")) + 
        xlab("Year") + 
        theme(legend.position = "none")  

dev.off()

