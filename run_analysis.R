#Data Cleaning Final Project Azen Koc
library(data.table)


features<-fread("./UCI HAR Dataset/features.txt",col.names = c("FeatureNo","Feature"))
activity_labels<-fread("./UCI HAR Dataset/activity_labels.txt",col.names = c("NumericActivity","Activity"))
colNames<-c(features$Feature,"Activity","Subject")
#Tidying test data set
testDataSet<-fread("./UCI HAR Dataset/test/X_test.txt")
testLabels<-read.table("./UCI HAR Dataset/test/y_test.txt")
testSubjects<-fread("./UCI HAR Dataset/test/subject_test.txt")
testDataSet$Activity<-testLabels
testDataSet$Subject<-testSubjects

#Tidying training Data set
trainDataSet<-fread("./UCI HAR Dataset/train/X_train.txt")
trainLabels<-read.table("./UCI HAR Dataset/train/y_train.txt")
trainSubjects<-fread("./UCI HAR Dataset/train/subject_train.txt")
trainDataSet$Activity<-trainLabels
trainDataSet$Subject<-trainSubjects

#changing 1-6 with activity labels
for (i in 1:6) {
     testDataSet$Activity[which(testDataSet$Activity==i)]<-activity_labels$Activity[i]
     trainDataSet$Activity[which(trainDataSet$Activity==i)]<-activity_labels$Activity[i]
}

#Appropriately labels the data set with feature info.
colNames<-c(features$Feature,"Activity","Subject")


#Merging Training and Test Data Set
mergedDataSet<-merge.data.table(trainDataSet,testDataSet, all = TRUE)
names(mergedDataSet)<-colNames
#Extracting only the measurements on the mean and standard deviation for each measurement.
desiredcols<-colNames[grep("std()|mean()",names(mergedDataSet))]
#adding SUbject and Activity columns to desired columns vector
desiredcols<-c(desiredcols,"Activity","Subject")
#getting desired columns 
meanstdData<-mergedDataSet[,..desiredcols]

#Independent tidy data set with the average of each variable for each activity and each subject.
#This is for data step 4, meanstdData(merged)

meltedIndDataSet<-melt.data.table(meanstdData,id.vars = c("Subject","Activity"))
AvIndDataSet <- dcast.data.table(meltedIndDataSet, Subject + Activity ~ variable, mean)

write.table(AvIndDataSet,"tidyDataSet.csv")
