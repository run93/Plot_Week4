setwd("C:/Users/Xiang/Desktop/R-Coursera/Plot/Week4")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Q1

total_emissions<-aggregate(Emissions ~ year,NEI, sum)
plot_1<-plot(total_emissions, type="l", main = "Emissions", ylab = "Emissions [Tons]", xlab= "Year")
