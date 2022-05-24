NEI <- readRDS("summarySCC_PM25.rds")

# Get summary data to plot of total emissions in Baltimore City per year
totals <- NEI %>%
  filter(fips == "24510") %>%  
  group_by(year) %>%
  summarise(Freq = sum(Emissions))

#Opens png device
png(filename = "plot2.png", width = 480, height = 480, units = "px")

#Create plot
plot(totals, 
     type = "p", 
     pch = 20, 
     cex = 2,
     ylab = "PM2.5 Emissions (tons)", 
     xlab = "Year", 
     main = "Total PM2.5 Emissions by Year in Baltimore City", 
     col = "red")

#closes png device
dev.off()