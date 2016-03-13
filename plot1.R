
dir= "/Users/asad/R/datasciencecoursera/specdata/data/"
## This first line will likely take a few seconds. Be patient!
NEI <- readRDS(paste(dir,"summarySCC_PM25.rds",sep=""))
SCC <- readRDS(paste(dir,"Source_Classification_Code.rds",sep=""))

emmision<-tapply(NEI$Emissions,factor(NEI$year),sum)
png('plot1.png')
barplot(emmision, names.arg=names(emmision), 
                 main=expression('Total Emission of PM'[2.5]),
               xlab='Year', ylab=expression(paste('PM', ''[2.5], ' in Kilotons')))
dev.off()