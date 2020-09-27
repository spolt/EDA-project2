emissions <- readRDS("summarySCC_PM25.rds")


## subset data from Baltimore City from type "on road"
baltimore_car_data <- subset(emissions, emissions$fips=="24510" 
                             & emissions$type=="ON-ROAD")
baltimore_car_year <- aggregate(baltimore_car_data$Emissions, 
                                by=list(baltimore_car_data$year), FUN=sum)
colnames(baltimore_car_year) <- c("Year", "Emissions")

png(filename = "plot5.png")
plot(baltimore_car_year$Year, baltimore_car_year$Emissions,
     type = "o",
     xlab = "year",
     ylab = "Total Emissions (tons)",
     main = "Total Emissions of PM2.5 related to motor Vehicles",
     sub = "Baltimore City")
dev.off()