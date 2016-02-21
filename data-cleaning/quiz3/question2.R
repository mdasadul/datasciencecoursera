fileurl="https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg"

download.file(fileurl,destfile = "/Users/asad/datasciencecoursera/data/2.jpg", method = "curl")
restData<-readJPEG("/Users/asad/datasciencecoursera/data/2.jpg",native = TRUE)
head(restData)
summary(restData)
str(restData)
quantile(restData,probs = 0.8)
quantile(restData,probs = 0.3)

