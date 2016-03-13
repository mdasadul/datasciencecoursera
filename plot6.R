
dir= "/Users/asad/R/datasciencecoursera/specdata/data/"
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS(paste(dir,"summarySCC_PM25.rds",sep=""))
SCC <- readRDS(paste(dir,"Source_Classification_Code.rds",sep=""))

NEI_<-subset(NEI,fips=="24510"&type=="ON-ROAD")
NEI_logangel<-subset(NEI,fips=="06037"&type=="ON-ROAD")
losangels<-tapply(NEI_logangel$Emissions,factor(NEI_logangel$year),sum)

baltimore<-tapply(NEI_$Emissions,factor(NEI_$year),sum)

#merge them togather
emm<-rbind(baltimore,losangels)

library(ggplot2)
library(reshape2)
melted_cormat <- melt(emm)

png('/Users/asad/R/datasciencecoursera/plot6.png')


ggplot(data = melted_cormat, aes(x=Var2, y=value,color=Var1)) + 
  geom_line()+
  labs( colour = "City",
        x = "Year",
        y = "PM2.5 in Kilotons",
        title = "Total PM2.5 in Baltimore City and LosAngels only from motor vehicle")


dev.off()