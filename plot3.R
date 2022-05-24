library(ggplot2)
NEI <- readRDS("summarySCC_PM25.rds")

# Get summary data to plot of total emissions in Baltimore City per year by type
totals <- NEI %>%
  filter(fips == "24510") %>%  
  group_by(year, type) %>%
  summarise(Freq = sum(Emissions))

#Opens png device
png(filename = "plot3.png", width = 480, height = 480, units = "px")

#Create plot
qplot(year,Freq,data = totals, ylim = c(0, 2110)) + 
  facet_wrap(vars(type)) +
  geom_smooth(method=lm, se=FALSE) +
  labs(x = "Year", 
       y = "Emissions (tons)", 
       title = "Emissions by Year and Type in Baltimore City")

#closes png device
dev.off()