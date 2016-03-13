
dir= "/Users/asad/R/datasciencecoursera/specdata/data/"
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS(paste(dir,"summarySCC_PM25.rds",sep=""))
SCC <- readRDS(paste(dir,"Source_Classification_Code.rds",sep=""))

NEI<-subset(NEI,fips=="24510")
emmision<-tapply(NEI$Emissions,factor(NEI$year),sum)
png('/Users/asad/R/datasciencecoursera/plot2.png')
barplot(emmision, names.arg=names(emmision), 
        main=expression(paste('Total Emission of PM'[2.5],' in Baltimore')),
        xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()