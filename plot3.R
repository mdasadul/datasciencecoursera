
dir= "/Users/asad/R/datasciencecoursera/specdata/data/"
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS(paste(dir,"summarySCC_PM25.rds",sep=""))
SCC <- readRDS(paste(dir,"Source_Classification_Code.rds",sep=""))

NEI<-subset(NEI,fips=="24510")
emmision<-tapply(NEI$Emissions,list(factor(NEI$year),as.factor(NEI$type)),sum)
png('/Users/asad/R/datasciencecoursera/plot3.png')

library(ggplot2)
library(reshape2)
melted_cormat <- melt(emmision)
ggplot(data = melted_cormat, aes(x=Var1, y=value,color=Var2)) + 
  geom_line()+
labs( colour = "Types",
     x = "Year",
     y = "PM2.5 in Kilotons",
     title = "Total PM2.5 in Baltimore City")
dev.off()