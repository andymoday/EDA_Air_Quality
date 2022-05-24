NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Get SCC codes where source is motor vehicles
motors <- (SCC[SCC$EI.Sector %like% "On-Road",])

# Get summary data to plot of total emissions for Motor Vehicle sources  in 
# Baltimore per year
baltimore <- NEI %>%
  filter(fips == "24510" & SCC %in% motors$SCC) %>%  
  group_by(year) %>%
  summarise(Freq = sum(Emissions))

# Get summary data to plot of total emissions for Motor Vehicle sources  in 
# Los Angeles per year
los_angeles <- NEI %>%
  filter(fips == "06037" & SCC %in% motors$SCC) %>%  
  group_by(year) %>%
  summarise(Freq = sum(Emissions))

#Opens png device
png(filename = "plot6.png", width = 480, height = 480, units = "px")

par(mfrow = c(2,1))

#Create plots
plot(baltimore, 
     type = "p", 
     pch = 20, 
     cex = 2,
     ylab = "PM2.5 Emissions (tons)", 
     xlab = "Year", 
     main = "Total PM2.5 Emissions by Year",
     sub = "(Baltimore Motor Vehicle related Sources)",
     col = "red")
abline(lm(Freq ~ year, data = baltimore), col = "blue")

plot(los_angeles, 
     type = "p", 
     pch = 20, 
     cex = 2,
     ylab = "PM2.5 Emissions (tons)", 
     xlab = "Year", 
     main = "Total PM2.5 Emissions by Year",
     sub = "(Los Angeles Motor Vehicle related Sources)", 
     col = "red")
abline(lm(Freq ~ year, data = los_angeles), col = "blue")

#closes png device
dev.off()