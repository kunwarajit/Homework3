
Human Activity Recognition Using Smartphones Dataset
==================================================================


Version 1.0
==================================================================
Kunwar Ajit
Tidy dataset for smartphones test based on the following criteria:
	1. Name of script file run_analysis.R. 
	2. Merges the training and the test sets to create one data set.
	3. Extracts only the measurements on the mean and standard deviation for each measurement. 
	4. Uses descriptive activity names to name the activities in the data set
	5. Appropriately labels the data set with descriptive variable names. 
	6. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


Assumptions:
===================
	1. The raw data files are assumed to be in <current working directory>/data/raw/UCI HAR Dataset. for example, C:\MyStuff\coursera\Getting and Cleaning Data\CourseProject\data\raw\UCI HAR Dataset
	2. The output files will be in <current working directory>/data/tidy
	3. The "plyr" library is installed. to test, library(plyr) should return without errors


How the script works:
=====================
1. Read features header (features) from the headers file
2. format the features text to eliminate non alphanumeric characters
3. Read activity header
4. Read Train Subject dataset from ./data/raw/UCI HAR Dataset/train/subject_train.txt
5. Read train activity test data (y_test)
6. Read the training file to create the training dataset
7. Give an identifier for a training row. This will e used to identify a training vs testing data in the final dataset
8. Determine the columns to select. This will filter out all colums except those having mean or std (for standard deviation) in their names
9. create a training dataset  by merging the rowID, subject,activity,and training datasets
10. Perform steps 4 to 9 to create a dataset with testing data
11. Merge training and testing data using rbind
12. Merge Test and Train Data using rbind
13. write the merged dataset to a file called 
14. Determine the columns to select for second tidy dataset(subject|activity|[Mm][Ee][Aa[Nn])
15. create second tidy dataset by eleminiting all columns other than those in step 14
16. Load the plyr library and Summarize data based on "subject","activity") using the colwise(mean)
17. write 2nd tidy dataset to file "./data/tidy/secondTidyDS.txt"


