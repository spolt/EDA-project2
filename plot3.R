emissions <- readRDS("summarySCC_PM25.rds")

baltimore_data <- subset(emissions, emissions$fips=="24510")
baltimore_type_year <- aggregate(baltimore_data$Emissions, 
                                 by=list(baltimore_data$type, baltimore_data$year), 
                                 FUN=sum)
colnames(baltimore_type_year) <- c("Type", "Year", "Emissions")

## create plot with ggplot2
library(ggplot2)
png(filename = "plot3.png")
qplot(Year, Emissions, data = baltimore_type_year, color = Type, geom = "line") +
        ggtitle("Total Emissions of PM2.5 in Baltimore City By pollutant type") + 
        ylab("Total Emissions (tons)") + 
        xlab("Year") 
dev.off()