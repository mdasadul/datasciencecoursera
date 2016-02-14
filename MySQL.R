ucsDb<-dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
result<-dbGetQuery(ucsDb,"show databases;");dbDisconnect(ucsDb)
hg19<-dbConnect(MySQL(),user="genome",db="hg19",host="genome-mysql.cse.ucsc.edu")
allTable<-dbListTables(hg19)
fields<-dbListFields(hg19,"HInv")
query<-dbGetQuery(hg19,"select count(*) from HInv")
#Read Table
tableData<-dbReadTable(hg19,"HInv")
head(tableData)
####dbSendQuery
query<-dbSendQuery(hg19,"select * from affyU133Plus2 where misMatches between 1 and 3")
affyMis<-fetch(query);quantile(affyMis$misMatches)
#Fetch small data
affyMisSmall<-fetch(query,10);dbClearResult(query)
dim(affyMisSmall)

dbDisconnect(hg19)

#####H5DFIle
created=h5createFile("example.h5")
created=h5createGroup("example.h5","foo")
created=h5createGroup("example.h5","baa")
created=h5createGroup("example.h5","foo/foobaa")
h5ls("example.h5")
###Insert more data on h5DFile
A=matrix(1:10,nr=5,nc=2)
h5write(A,"example.h5","foo/A")
B=array(seq(0.1,2,by=0.1),dim=c(5,2,2))
attr(B,"scale")<-"liter"
h5write(B,"example.h5","foo/foobaa/B")
h5ls("example.h5")
#writing data frame
df<- data.frame(1L:5L,seq(0,1,length.out = 5), c("ab","cde","ssa","ssasa","f"),stringsAsFactors = FALSE)

h5write(df,"example.h5","df")
###reading data
readA= h5read("example.h5","foo/A")
readA
###writing and reading as chunk
h5write(c(12,44,66),"example.h5","foo/A",index=list(1:3,1))
h5read("example.h5","foo/A")

############Reading from web###################
con<-url("https://scholar.google.ca/citations?user=ldReBBcAAAAJ")
htmlCode<- readLines(con)
close(con)
htmlCode
##########XML############
library(XML)
url<-"https://scholar.google.ca/citations?user=ldReBBcAAAAJ"
html<-htmlTreeParse(url,useInternalNodes=T)
xpathSApply(html,"//title",xmlValue)

######httr#######
library(httr)
html2<-GET(url)
content2<-content(html2,as="text")
parsedHTML<-htmlParse(content2,asText = TRUE)
xpathSApply(parsedHTML,"//title",xmlValue)
xpathSApply(parsedHTML,"//td[@id='col-citedby']",xmlValue)
####Accessing website with password########

pg1=GET("http://httpbin.org/basic-auth/user/passwd",authenticate("user","passwd"))
pg1
#######using handle
pg1

json1<-content(homeTL)
json2=jsonlite::fromJSON(toJSON(json1))
json2[1,1:5]
