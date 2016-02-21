fileurl="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileurl,destfile = "/Users/asad/datasciencecoursera/data/3.csv", method = "curl")
data1<-read.csv("/Users/asad/datasciencecoursera/data/3.csv")

fileurl="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileurl,destfile = "/Users/asad/datasciencecoursera/data/3_1.csv", method = "curl")
data2<-read.csv("/Users/asad/datasciencecoursera/data/3_1.csv")
str

