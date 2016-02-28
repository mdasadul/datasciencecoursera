1. I download and extarct the data files in data directory. Then I use read.table to read 
Read the Train data, subject and train target and create a variable called x

 
 
2. Then I read the Testdata, subject and test target and create a variable called testdata



3. Then I combined train and test data

 
4. after that I read the column names from features.txt

5. replacing -mean by Mean and -std by Std by using gsub and I also remove  -() 

6. I search for column name Mean and Std

7. Then I get index of the corresponding column name and adding 562 for subject and 563 for activity



8. After that I remove the column name does not have Std or Mean

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

