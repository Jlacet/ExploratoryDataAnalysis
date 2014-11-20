## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## question 6
baltveh <- subset (NEI, fips == "24510" & type == "ON-ROAD")

# Aggregate Baltimore

baltveh <- aggregate(baltveh[, "Emissions"], by = list(baltveh$year), sum)
colnames(baltveh) <- c("year", "emissions")
baltveh$town <- "Baltimore"

losaveh <- subset (NEI, fips == "06037" & type == "ON-ROAD")

# Aggregate Los Angeles

losaveh <- aggregate(losaveh[, "Emissions"], by = list(losaveh$year), sum)
colnames(losaveh) <- c("year", "emissions")
losaveh$town <- "Los Angales"

# Combine the two cities 
totalveh <- rbind(baltveh,losaveh)

#png("plot6.png",width=480,height=480,units="px",bg="transparent")
png("plot6.png")


ggplot(totalveh, aes(factor(year), emissions, fill=town)) +
        geom_bar(aes(fill=year),stat="identity") +
        facet_grid(.~town) +
        guides(fill=FALSE) + 
        labs(x="year", y=expression("Total" ~ PM[2.5] ~ "emissions (tons)")) + 
        labs(title=expression("Total emissions of vehicles in Baltimore and Los Angeles"))


dev.off()

