dir <-'/home/developer/datasciencecoursera/specdata/UCI HAR Dataset'
trainDataFile<-paste(dir,'/train/X_train.txt',sep = "")
train_sub_url<-paste(dir,'/train/subject_train.txt',sep="")
train_y_url<-paste(dir,'/train/y_train.txt',sep="")
x <- read.table(trainDataFile, header=FALSE, sep ="")
train_y<-read.csv(train_y_url,header = FALSE,sep = '')
train_sub<-read.csv(train_sub_url,header = FALSE,sep = '')
x[,562]<-train_sub
x[,563]<-train_y
str(x)

testDataFile<-paste(dir,'/test/X_test.txt',sep = "")
test_sub_url<-paste(dir,'/test/subject_test.txt',sep="")
test_y_url<-paste(dir,'/test/y_test.txt',sep="")

testdata <- read.table(testDataFile, header=FALSE, sep ="")
test_sub<-read.csv(test_sub_url,header = FALSE,sep = "")
test_y<-read.csv(test_y_url,header = FALSE,sep = "")
testdata[,562]<-test_sub
testdata[,563]<-test_y

#str(testdata)

#combined train and test data
combined<-rbind(x,testdata)

#get the column names
colnameFile<-paste(dir,'/features.txt',sep="")
colname <- read.table(colnameFile, header=FALSE, sep ="")
str(colname)
colname<-gsub('-mean',"Mean",colname[,2])
colname<-gsub('-std',"Std",colname)
colname<-gsub('[-()]',"",colname)
#set the column names
#names(combined)<-colname
name<-grep("Mean|Std",colname)

colname<-colname[name]
colnumber<-c(name,562,563)


combined_data<-combined[,colnumber]
#str(combined_data)
names(combined_data)<-c(colname,'Subject','Activity')

#str(combined_data)

activity_label_<-paste(dir,'/activity_labels.txt',sep="")
activity_labels <- read.table(activity_label_, header=FALSE, sep ="")
#str(activity_labels)

#replace the numeric label by alphanumeric label
label<-1
for(activityLabel in activity_labels$V2){
 
  combined_data$Activity<-gsub(label,activityLabel,combined_data$Activity)
  label =label+1
}
combined_data$Activity <- as.factor(combined_data$Activity)
combined_data$Subject <- as.factor(combined_data$Subject)

tidy_data = ddply(combined_data, c("Subject","Activity"), numcolwise(mean))

#str(tidy_data)
write.table(tidy_data, file=paste('/home/developer/datasciencecoursera/tidy_data.txt',sep=""),row.name=FALSE, quote = FALSE)