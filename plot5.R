NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get SCC codes where source is coal
motors <- (SCC[SCC$EI.Sector %like% "On-Road",])

# Get summary data to plot of total emissions for Motor Vehicle sources  in 
# Baltimore per year
totals <- NEI %>%
  filter(fips == "24510" & SCC %in% motors$SCC) %>%  
  group_by(year) %>%
  summarise(Freq = sum(Emissions))

#Opens png device
png(filename = "plot5.png", width = 480, height = 480, units = "px")

#Create plot
plot(totals, 
     type = "p", 
     pch = 20, 
     cex = 2,
     ylab = "PM2.5 Emissions (tons)", 
     xlab = "Year", 
     main = "Total PM2.5 Emissions by Year",
     sub = "(Baltimore Motor Vehicle related Sources)", 
     col = "red")
abline(lm(Freq ~ year, data = totals), col = "blue")

#closes png device
dev.off()