setwd("C:/Users/Xiang/Desktop/R-Coursera/Plot/Week4")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Q4

SCC$relation <- grepl("coal", SCC$SCC.Level.Three, ignore.case=TRUE)
SCC_related<- SCC[SCC$relation==1,]
NEI_related <- NEI[NEI$SCC %in% SCC_related$SCC,]
combustion_emissions <- aggregate(Emissions ~ year,NEI_related, sum)
plot_4 <- plot(combustion_emissions, type="l", main = "Coal Combustion Emissions", ylab = "Emissions [Tons]" , xlab= "Year")
