## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Question 3

# Load ggplot2 library
install.packages("ggplot")
require(ggplot2)

baltimore <- subset (NEI, fips == "24510")

png("plot3.png") 
ggplot(baltimore,aes(factor(year), Emissions, fill=type)) +
        geom_bar(stat="identity", type = FALSE) +
        facet_grid(.~type) + 
        scale_fill_brewer(palette = 3) +
        guides(fill=FALSE) + 
        labs(x="year", y=expression("Total" ~ PM[2.5] ~ "emissions (tons)")) + 
        labs(title=expression("Total " ~ PM[2.5] ~ "emissions by year, in Baltimore, by source type"))

dev.off()

