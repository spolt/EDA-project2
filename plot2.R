emissions <- readRDS("summarySCC_PM25.rds")


DataSub <- subset(emissions, emissions$fips=="24510")
Data_year <- aggregate(DataSub$Emissions, by=list(DataSub$year), 
                                 FUN=sum)

png(filename = "plot2.png")
plot(Data_year$Group.1, Data_year$x, type = "l", 
     main = "Total Emissions of PM2.5 in Baltimore City", xlab = "year", 
     ylab = "Total Emissions (tons)")
dev.off()