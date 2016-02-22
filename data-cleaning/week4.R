cameradata<-read.csv("./data/cameras.cav")
names(cameradata)
tolower(names(cameradata))
splitNames =strsplit(names(cameradata),"\\.")
splitNames[[6]]

mylist<-list(letters("A","B","C"),numbers=1:3,matrix(1:25,ncol=5))
head(mylist)