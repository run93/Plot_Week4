setwd("C:/Users/Xiang/Desktop/R-Coursera/Plot/Week4")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Q6 try ggplot


SCC$vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCC_vehicles<- SCC[SCC$vehicles==1,]


LA_NEI<-NEI[NEI$fips=="06037",]
LA_NEI$city<-"Los Angeles County"
baltimore_NEI<-NEI[NEI$fips=="24510",]
baltimore_NEI$city<-"Baltimore City"
two_NEI<-rbind (LA_NEI, baltimore_NEI)
vehicles <- two_NEI[two_NEI$SCC %in% SCC_vehicles$SCC,]

plot_6 <- ggplot(data=vehicles, mapping=aes(factor(year), Emissions))+
      geom_bar(stat="identity")+
      facet_grid(.~city)+
      labs(y="Emissions [Tons]")+
      labs(x="Year")+
      labs(title="Motor Vehicle Source Emissions in Baltimore & LA, 1999-2008")
plot_6