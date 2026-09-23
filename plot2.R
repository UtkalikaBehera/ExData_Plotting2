NEI <- readRDS("summarySCC_PM25.rds")
balt <- NEI[NEI$fips=="24510",]
balt_year <- aggregate(Emissions ~ year, balt, sum)
png("plot2.png", width=480, height=480)
barplot(height=balt_year$Emissions, names.arg=balt_year$year, xlab="Year", ylab="Emissions", main="Total PM2.5 in Baltimore 1999-2008")
dev.off()
