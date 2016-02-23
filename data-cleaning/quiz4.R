
if(!file.exists("./data")){
  dir.create("./data")
}

fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileurl,destfile = "./data/question1.csv", method = "curl")
restData<-read.csv("./data/question1.csv")
name<-names(restData)
ansq1<-strsplit(name,"wgtp")[[123]] #and to ques1



fileurl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FGDP.csv"
download.file(fileurl,destfile = "./data/question2.csv", method = "curl")
dat=read.csv("./data/question2.csv",skip=4)
str(dat)



chr<-as.character(dat$X.4[1:190])

num<-as.numeric(gsub(",","",chr))
ansq2<-mean(num) #answer to question2

grep("^United",dat$X.3) #answer to question3

fileurl ="https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FEDSTATS_Country.csv"
download.file(fileurl,destfile = "./data/question4.csv", method = "curl")
data1=read.csv("./data/question4.csv")

count(grep("^Fiscal year end: June",data1$Special.Notes)) #answer to question4


library(quantmod)
amzn = getSymbols("AMZN",auto.assign=FALSE)
sampleTimes = index(amzn)
count(grep("^2012",sampleTimes)) #ans to question5

index2012<-grep("^2012",sampleTimes)
count(grep("Monday",weekdays(sampleTimes[index2012])))  #ans to question5