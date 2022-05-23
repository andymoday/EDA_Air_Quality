NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

totals <- with(NEI,tapply(Emissions, year, sum))