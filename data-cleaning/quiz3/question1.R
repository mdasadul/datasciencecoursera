fileurl="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"

download.file(fileurl,destfile = "/Users/asad/datasciencecoursera/data/1.csv", method = "curl")
restData<-read.csv("/Users/asad/datasciencecoursera/data/1.csv")
head(restData)
summary(restData)
str(restData)
agricultureLogical<- mutate(restData,agricultureLogical=(ACR==3& AGS==6))["agricultureLogical"]
which(agricultureLogical[,1])
                        
