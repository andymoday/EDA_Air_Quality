NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get SCC codes where source is coal
coal<- (SCC[SCC$EI.Sector %like% "coal" | SCC$EI.Sector %like% "Coal" ,])

# Get summary data to plot of total emissions for coal sources per year
totals <- NEI %>%
  filter(SCC %in% coal$SCC) %>%  
  group_by(year) %>%
  summarise(Freq = sum(Emissions))

#Opens png device
png(filename = "plot4.png", width = 480, height = 480, units = "px")

#Create plot
plot(totals, 
     type = "p", 
     pch = 20, 
     cex = 2,
     ylab = "PM2.5 Emissions (tons)", 
     xlab = "Year", 
     main = "Total PM2.5 Emissions by Year (Coal related Sources)", 
     col = "red")
abline(lm(Freq ~ year, data = totals), col = "blue")

#closes png device
dev.off()