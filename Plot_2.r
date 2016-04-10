setwd("C:/Users/Xiang/Desktop/R-Coursera/Plot/Week4")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Q2

baltimore_NEI<-NEI[NEI$fips=="24510",]
baltimore_emissions<-aggregate(Emissions ~ year,baltimore_NEI, sum)
plot_2<-plot(baltimore_emissions, type="l", main = "Emissions", ylab = "Emissions [Tons]", xlab= "Year")
