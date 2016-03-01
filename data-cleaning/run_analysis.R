trainDataFile<-'/Users/asad/datasciencecoursera/data/UCI HAR Dataset/train/X_train.txt'
train_sub_url<-'/Users/asad/datasciencecoursera/data/UCI HAR Dataset/train/subject_train.txt'
train_y_url<-'/Users/asad/datasciencecoursera/data/UCI HAR Dataset/train/y_train.txt'
x <- read.table(trainDataFile, header=FALSE, sep ="")
train_y<-read.csv(train_y_url,header = FALSE,sep = '')
train_sub<-read.csv(train_sub_url,header = FALSE,sep = '')
x[,562]<-train_sub
x[,563]<-train_y
#str(x)

testDataFile<-'/Users/asad/datasciencecoursera/data/UCI HAR Dataset/test/X_test.txt'
test_sub_url<-'/Users/asad/datasciencecoursera/data/UCI HAR Dataset/test/subject_test.txt'
test_y_url<-'/Users/asad/datasciencecoursera/data/UCI HAR Dataset/test/y_test.txt'

testdata <- read.table(testDataFile, header=FALSE, sep ="")
test_sub<-read.csv(test_sub_url,header = FALSE,sep = '')
test_y<-read.csv(test_y_url,header = FALSE,sep = '')
testdata[,562]<-test_sub
testdata[,563]<-test_y

#str(testdata)

#combined train and test data
combined<-rbind(x,testdata)

#get the column names
colnameFile<-'/Users/asad/datasciencecoursera/data/UCI HAR Dataset/features.txt'
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

activity_label_<-'/Users/asad/datasciencecoursera/data/UCI HAR Dataset/activity_labels.txt'
activity_labels <- read.table(activity_label_, header=FALSE, sep ="")
#str(activity_labels)

#replace the numeric label by alphanumeric label
label<-1
for(activityLabel in activity_labels$V2){
 
  combined_data$Activity<-gsub(label,activityLabel,combined_data$Activity)
  label =label+1
}
tidy = ddply(combined_data, c("Subject","Activity"), numcolwise(mean))
#removing unnecesary column
tidy_data[,1]<-NULL

#str(tidy_data)
write.table(tidy_data[], file='tidy_data.txt',row.name=FALSE, quote = FALSE)