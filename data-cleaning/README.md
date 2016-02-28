
#Read the Train data, subject and train target and create a variable called x
trainDataFile<-'/Users/asad/datasciencecoursera/data/UCI HAR Dataset/train/X_train.txt'
train_sub_url<-'/Users/asad/datasciencecoursera/data/UCI HAR Dataset/train/subject_train.txt'
train_y_url<-'/Users/asad/datasciencecoursera/data/UCI HAR Dataset/train/y_train.txt'
x <- read.table(trainDataFile, header=FALSE, sep ="")
train_y<-read.csv(train_y_url,header = FALSE,sep = '')
train_sub<-read.csv(train_sub_url,header = FALSE,sep = '')
x[,562]<-train_sub
x[,563]<-train_y


 
 
#Read the Testdata, subject and test target and create a variable called testdata
testDataFile<-'/Users/asad/datasciencecoursera/data/UCI HAR Dataset/test/X_test.txt'
test_sub_url<-'/Users/asad/datasciencecoursera/data/UCI HAR Dataset/test/subject_test.txt'
test_y_url<-'/Users/asad/datasciencecoursera/data/UCI HAR Dataset/test/y_test.txt'

testdata <- read.table(testDataFile, header=FALSE, sep ="")
test_sub<-read.csv(test_sub_url,header = FALSE,sep = '')
test_y<-read.csv(test_y_url,header = FALSE,sep = '')
testdata[,562]<-test_sub
testdata[,563]<-test_y



#combined train and test data
combined<-rbind(x,testdata)

 
#after that I read the column names from features.txt
colnameFile<-'/Users/asad/datasciencecoursera/data/UCI HAR Dataset/features.txt'
colname <- read.table(colnameFile, header=FALSE, sep ="")

#replacing -mean by Mean and -std by Std 
colname<-gsub('-mean',"Mean",colname[,2])
colname<-gsub('-std',"Std",colname)

#removing -() 
colname<-gsub('[-()]',"",colname)

#finding column name Mean and Std
name<-grep("Mean|Std",colname)

#getting index of the corresponding colun name and adding 562 for subject and 563 for activity
colname<-colname[name]
colnumber<-c(name,562,563)


#removing the coulm name does not have Std or Mean
combined_data<-combined[,colnumber]

#renaming the column of combined data
names(combined_data)<-c(colname,'Subject','Activity')

#str(combined_data)

activity_label_<-'/Users/asad/datasciencecoursera/data/UCI HAR Dataset/activity_labels.txt'
activity_labels <- read.table(activity_label_, header=FALSE, sep ="")

#replace the numeric label by alphanumeric label
label<-1
for(activityLabel in activity_labels$V2){
  combined_data$Activity<-gsub(label,activityLabel,combined_data$Activity)
  label =label+1
}

#creating tidy data by grouping into activity and subject
tidy_data=aggregate(combined_data,by=list(as.factor(combined_data$Activity),as.factor(combined_data$Subject)),mean)

#removing unnecesary columns
tidy_data[,89]<-tidy_data[,90]<-NULL

#str(tidy_data)
write.table(tidy_data, file='tidy_data.txt',sep=" ",row.name=FALSE)
