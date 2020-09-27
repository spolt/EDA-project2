emissions <- readRDS("summarySCC_PM25.rds")
classification <- readRDS("Source_Classification_Code.rds")


coal_class_code <- classification[grepl("Coal", classification$Short.Name), ]
coal_emissions_data <- emissions[emissions$SCC %in% coal_class_code$SCC, ]
coal_emissions_year <- aggregate(coal_emissions_data$Emissions, 
                                 by=list(coal_emissions_data$year), FUN=sum)
colnames(coal_emissions_year) <- c("year", "emissions")

png(filename = "plot4.png")
plot(coal_emissions_year$year, coal_emissions_year$emissions, type = "o",
     xlab = "Year",
     ylab = "Total Emissions (tons)",
     main = "Coal Related Emissions of PM2.5 in US from 1999-2008")
dev.off()
