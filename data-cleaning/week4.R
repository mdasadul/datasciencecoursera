cameradata<-read.csv("./data/cameras.csv")
names(cameradata)
tolower(names(cameradata))
splitNames =strsplit(names(cameradata),"\\.")
splitNames[[6]]

mylist<-list(letters=c("A","B","C"),numbers=1:3,matrix(1:25,ncol=5))
head(mylist)
firstElement<- function(x) {x[1]}
sapply(splitNames,firstElement)
sub("_", "","This_is_good")
gsub("_", "","This_is_good")

grep("Alameda",cameradata$intersection, value=TRUE)
library(stringr)
nchar("asad")
substr("asad", 1, 2)
paste("asadul","Islam")