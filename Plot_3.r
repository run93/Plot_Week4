setwd("C:/Users/Xiang/Desktop/R-Coursera/Plot/Week4")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")


## Q3

baltimore_NEI<-NEI[NEI$fips=="24510",]

library(ggplot2)

plot_3<- ggplot(data=baltimore_NEI, mapping=aes(factor(year),Emissions))+
      geom_bar(stat="identity")+
      facet_grid(.~type)+
      labs(y="Emissions [Tons]")+
      labs(x="Year")+
      labs(title="Emissions in Baltimore City Between 1999 to 2008")
plot_3
