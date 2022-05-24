NEI <- readRDS("summarySCC_PM25.rds")

# Get summary data to plot of total emissions per year
totals <- NEI %>%
          group_by(year) %>%
          summarise(Freq = sum(Emissions))

#Opens png device
png(filename = "plot1.png", width = 480, height = 480, units = "px")

#Create plot
plot(totals, 
     type = "p", 
     pch = 20, 
     cex = 2,
     ylab = "PM2.5 Emissions (millions)", 
     xlab = "Year", 
     main = "Total PM2.5 Emissions by Year", 
     col = "red",
     yaxt='n')
axis(2,
     at=marks <- c(3000000, 4000000, 5000000, 6000000, 7000000),
     labels=format(marks <- c(3, 4, 5, 6, 7),
                   scientific=FALSE))

#closes png device
dev.off()