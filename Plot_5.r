setwd("C:/Users/Xiang/Desktop/R-Coursera/Plot/Week4")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Q5 try with basic plot

SCC$vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCC_vehicles<- SCC[SCC$vehicles==1,]
baltimore_NEI<-NEI[NEI$fips=="24510",]
baltimore_vehicles <- baltimore_NEI[baltimore_NEI$SCC %in% SCC_vehicles$SCC,]
baltimore_vehicles_emissions <- aggregate(Emissions ~ year,baltimore_vehicles, sum)
plot_5 <- plot(baltimore_vehicles_emissions, type="l", main = "Vehicles Emissions in Baltimore", ylab = "Emissions [Tons]" , xlab= "Year")
