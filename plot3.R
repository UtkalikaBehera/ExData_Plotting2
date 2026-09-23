library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")
balt <- NEI[NEI$fips=="24510",]
balt_type_year <- aggregate(Emissions ~ year + type, balt, sum)
png("plot3.png", width=480, height=480)
qplot(year, Emissions, data=balt_type_year, color=type, geom=c("point","line")) + ggtitle("Baltimore Emissions by Type") + xlab("Year") + ylab("Emissions")
dev.off()
