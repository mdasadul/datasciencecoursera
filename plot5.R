
dir= "/Users/asad/R/datasciencecoursera/specdata/data/"
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS(paste(dir,"summarySCC_PM25.rds",sep=""))
SCC <- readRDS(paste(dir,"Source_Classification_Code.rds",sep=""))

NEI_<-subset(NEI,fips=="24510"&type=="ON-ROAD")
emmision<-tapply(NEI_$Emissions,list(factor(NEI_$year)),sum)
png('/Users/asad/R/datasciencecoursera/plot5.png')

library(ggplot2)
library(reshape2)
melted_cormat <- melt(emmision)
ggplot(data = melted_cormat, aes(x=Var1, y=value)) + 
  geom_line()+
  labs( colour = "Types",
        x = "Year",
        y = "PM2.5 in Kilotons",
        title = "Total PM2.5 in Baltimore City only from motor vehicle")
dev.off()