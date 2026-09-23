NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
vehicle_SCC <- SCC[grepl("Vehicle", SCC$Short.Name), "SCC"]
balt_vehicle <- NEI[NEI$fips=="24510" & NEI$SCC %in% vehicle_SCC,]
balt_vehicle_year <- aggregate(Emissions ~ year, balt_vehicle, sum)
png("plot5.png", width=480, height=480)
barplot(height=balt_vehicle_year$Emissions, names.arg=balt_vehicle_year$year, xlab="Year", ylab="Emissions", main="Baltimore Motor Vehicle Emissions")
dev.off()
