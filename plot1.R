NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

emissions_year <- with(NEI, aggregate(Emissions, by = list(year), sum))

png("Plot1.png",width=480,height=480)

plot(emissions_year, type = "o", main = "Total PM2.5 Emissions", xlab = "Year", 
     ylab = "PM2.5 Emissions", pch = 19, col = "darkblue", lty = 6)

dev.off()