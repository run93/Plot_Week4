setwd("C:/Users/Xiang/Desktop/R-Coursera/Plot/Week4")
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

## Q1

total_emissions<-aggregate(Emissions ~ year,NEI, sum)
plot_1<-plot(total_emissions, type="l", main = "Emissions", ylab = "Emissions [Tons]", xlab= "Year")


## Q2

baltimore_NEI<-NEI[NEI$fips=="24510",]
baltimore_emissions<-aggregate(Emissions ~ year,baltimore_NEI, sum)
plot_2<-plot(baltimore_emissions, type="l", main = "Emissions", ylab = "Emissions [Tons]", xlab= "Year")

## Q3

library(ggplot2)

plot_3<- ggplot(data=baltimore_NEI, mapping=aes(factor(year),Emissions))+
      geom_bar(stat="identity")+
      facet_grid(.~type)+
      labs(y="Emissions [Tons]")+
      labs(x="Year")+
      labs(title="Emissions in Baltimore City Between 1999 to 2008")
plot_3

## Q4

SCC$relation <- grepl("coal", SCC$SCC.Level.Three, ignore.case=TRUE)
SCC_related<- SCC[SCC$relation==1,]
NEI_related <- NEI[NEI$SCC %in% SCC_related$SCC,]
combustion_emissions <- aggregate(Emissions ~ year,NEI_related, sum)
plot_4 <- plot(combustion_emissions, type="l", main = "Coal Combustion Emissions", ylab = "Emissions [Tons]" , xlab= "Year")

## Q5 try with basic plot

SCC$vehicles <- grepl("vehicle", SCC$SCC.Level.Two, ignore.case=TRUE)
SCC_vehicles<- SCC[SCC$vehicles==1,]
baltimore_NEI<-NEI[NEI$fips=="24510",]
baltimore_vehicles <- baltimore_NEI[baltimore_NEI$SCC %in% SCC_vehicles$SCC,]
baltimore_vehicles_emissions <- aggregate(Emissions ~ year,baltimore_vehicles, sum)
plot_5 <- plot(baltimore_vehicles_emissions, type="l", main = "Vehicles Emissions in Baltimore", ylab = "Emissions [Tons]" , xlab= "Year")

## Q6 try ggplot

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