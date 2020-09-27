library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

VhclsBaltimoreNEI <- VhclsNEI[VhclsNEI$fips == 24510,]
VhclsBaltimoreNEI$city <- "Baltimore City"
VhclsLANEI <- VhclsNEI[VhclsNEI$fips=="06037",]
VhclsLANEI$city <- "Los Angeles County"
bothNEI <- rbind(VhclsBaltimoreNEI,VhclsLANEI)

png("Plot6.png",width=500,height=400,units="px",bg="transparent")

ggp <- ggplot(bothNEI, aes(x=factor(year), y=Emissions, fill=city)) +
        geom_bar(aes(fill=year),stat="identity") +
        facet_grid(scales="free", space="free", .~city) +
        guides(fill=FALSE) + theme_bw() +
        labs(x="year", y=expression("Total PM"[2.5]*" Emission (Kilo-Tons)")) + 
        labs(title=expression("PM"[2.5]*" Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008"))

print(ggp)
dev.off()