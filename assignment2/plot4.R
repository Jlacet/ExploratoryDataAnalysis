## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## question 4

coal <- SCC[grepl("coal", SCC$Short.Name, ignore.case = TRUE), ]

# Merges data sets
merge <- merge(NEI, coal, by = 'SCC')

msum <- aggregate(merge[, 'Emissions'], by = list(merge$year), sum)
colnames(msum) <- c('Year', 'Emissions')

png("plot4.png")
ggplot(msum, aes(Year, Emissions)) + 
        geom_line(aes(group = 1, col = Emissions, lwd=1)) + 
        geom_point(color = "green", size = 5) +
        ggtitle(expression("Total " ~ PM[2.5] ~ "emissions by coal source")) + 
        ylab(expression(paste("Total" ~ PM[2.5] ~ "emissions (tons)"))) +
        theme(legend.position = 'none')+
        scale_color_gradient(low="darkkhaki", high="darkgreen")

dev.off()

