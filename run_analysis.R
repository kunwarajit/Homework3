# Read features header (features)
featuresDS <- read.delim("./data/raw/UCI HAR Dataset/features.txt",sep=" ",header=FALSE,col.names=c("value","features"))
# format the features text
featuresDS$features <- gsub("[^[:alpha:]]","",featuresDS$features)
#
# Read activity header
activityDS <- read.delim("./data/raw//UCI HAR Dataset/activity_labels.txt",sep=" ",header=FALSE,col.names=c("value","label"))
#
#Read Train Subject dataset
trainSubjectDS <- read.delim("./data/raw/UCI HAR Dataset/train/subject_train.txt",header=FALSE,sep=" ",col.names=c("subject"))
#
# Read train activity test data (y_test)
trainActivityDataRaw <- read.delim("./data/raw/UCI HAR Dataset/train/y_train.txt",sep="",header=FALSE,col.names=c("activity"))
trainActivityDS <- data.frame(activity= factor(trainActivityDataRaw$activity, labels=activityDS$label,))
#
#read train dataset
trainingDS <- read.table("./data/raw/UCI HAR Dataset/train/x_train.txt",header=FALSE,col.names=featuresDS$features)
# Give an identifier for a training row
rowID <- data.frame(rowid = rep(c("Training"),nrow(trainingDS)))
#
#columns to select
colsToSelect <- names(trainingDS) [grep('([Mm][Ee][Aa[Nn]|[Ss][Tt][Dd])',names(trainingDS))]
#
# Merge all
finalDS <- cbind(rowID, trainSubjectDS,trainActivityDS, trainingDS[,names(trainingDS) %in% colsToSelect ])
#
# Setup test dataset
#Read test Subject dataset
testSubjectDS <- read.delim("./data/raw/UCI HAR Dataset/test/subject_test.txt",header=FALSE,sep=" ",col.names=c("subject"))
#
# Read test activity test data (y_test)
testActivityDataRaw <- read.delim("./data/raw/UCI HAR Dataset/test/y_test.txt",sep="",header=FALSE,col.names=c("activity"))
testActivityDS <- data.frame(activity= factor(testActivityDataRaw$activity, labels=activityDS$label,))
#
#read test dataset
testingDS <- read.table("./data/raw/UCI HAR Dataset/test/x_test.txt",header=FALSE,col.names=featuresDS$features)
# Give an identifier for a testing row
rowID <- data.frame(rowid = rep(c("Testing"),nrow(testingDS)))
# Merge Test all
finalTestDS <- cbind(rowID, testSubjectDS,testActivityDS, testingDS[,names(testingDS) %in% colsToSelect ])
#
# Merge Test and Train Data
finalDS <- rbind(finalDS,finalTestDS)
write.csv(finalDS, "./data/tidy/Means_standard_deviations.txt", row.names=FALSE)
#
#columns to select for second tidy dataset
secondTidyDScolsToSelect <- names(finalDS) [grep('(subject|activity|[Mm][Ee][Aa[Nn])',names(finalDS))]
# 
#create second tidy dataset
secondTidyDS <- finalDS[,names(finalDS) %in% secondTidyDScolsToSelect]
# Summarize data
library(plyr)
secondTidyDS <- ddply(secondTidyDS, c("subject","activity"), colwise(mean))
#
# write 2nd tidy dataset to file
write.csv(secondTidyDS, "./data/tidy/secondTidyDS.txt", row.names=FALSE)
