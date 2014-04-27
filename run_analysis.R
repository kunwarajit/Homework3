## set the directory where the files are
setwd("D:/ajit1/coursea/Getting and Cleaning Data/Week 3/Assignment")
## set factor variable for activity
activity_v <- read.delim("./UCI HAR Dataset/activity_labels.txt",sep=" ",header=FALSE,col.names=c("value","label"))
#activity_f = factor(activity_v$value, labels=activity_v$label)
## Read features header (features)
features_v <- read.delim("./UCI HAR Dataset/features.txt",sep=" ",header=FALSE,col.names=c("value","features"))
#
## Read train activity test data (y_test)
train_activity_data <- read.delim("./UCI HAR Dataset/train/y_train.txt",sep="",header=FALSE,col.names=c("activity"))
train_activity_data_f <- factor(train_activity_data$activity, labels=activity_v$label,)
names(train_activity_data_f) <- "activity"
## Read subjects test data (subject_train)
train_subject_data <- read.delim("./UCI HAR Dataset/train/subject_train.txt",header=FALSE,sep=" ",col.names=c("subject"))
## Read train x_test data (x_test)
train_x_data <- read.table("./UCI HAR Dataset/train/x_train.txt",header=FALSE,col.names=features_v$features)
train_complete <- cbind(train_activity_data_f,train_subject_data,train_x_data)
names(train_complete)[[1]] <- "activity" 
#
## Read test activity test data (y_test)
test_activity_data <- read.delim("./UCI HAR Dataset/test/y_test.txt",sep="",header=FALSE,col.names=c("activity"))
test_activity_data_f <- factor(test_activity_data$activity, labels=activity_v$label)
#names(test_activity_data_f) <- "activity"
## Read subjects test data (subject_test)
test_subject_data <- read.delim("./UCI HAR Dataset/test/subject_test.txt",header=FALSE,sep=" ",col.names=c("subject"))
## Read test x_test data (x_test)
test_x_data <- read.table("./UCI HAR Dataset/test/x_test.txt",header=FALSE,col.names=features_v$features)
test_complete <- cbind(test_activity_data_f,test_subject_data,test_x_data)
names(test_complete)[[1]] <- "activity" 
#############################
## merge test and train
#############################
all_data_x <- rbind(test_complete,train_complete)
if (!file.exists("./UCI HAR Dataset/Results")){
        dir.create("./UCI HAR Dataset/Results")
}
write.csv(all_data_x,"./UCI HAR Dataset/Results/all_data_x.csv")
write.table(summary(all_data_x), "./UCI HAR Dataset/Results/Summary_all_data_x.csv")
#
#
#
#
