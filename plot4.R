NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
coal_SCC <- SCC[grepl("Coal", SCC$Short.Name), "SCC"]
coal_NEI <- NEI[NEI$SCC %in% coal_SCC,]
coal_year <- aggregate(Emissions ~ year, coal_NEI, sum)
png("plot4.png", width=480, height=480)
barplot(height=coal_year$Emissions/1000, names.arg=coal_year$year, xlab="Year", ylab="Coal Emissions (thousand tons)", main="Coal Related PM2.5 Emissions US")
dev.off()
