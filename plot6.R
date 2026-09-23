library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
vehicle_SCC <- SCC[grepl("Vehicle", SCC$Short.Name), "SCC"]
vehicle_NEI <- NEI[NEI$SCC %in% vehicle_SCC & NEI$fips %in% c("24510","06037"),]
vehicle_NEI$city <- ifelse(vehicle_NEI$fips=="24510", "Baltimore", "Los Angeles")
vehicle_city_year <- aggregate(Emissions ~ year + city, vehicle_NEI, sum)
png("plot6.png", width=480, height=480)
qplot(year, Emissions, data=vehicle_city_year, color=city, geom=c("point","line")) + ggtitle("Motor Vehicle Emissions: Baltimore vs LA") + xlab("Year") + ylab("Emissions")
dev.off()
