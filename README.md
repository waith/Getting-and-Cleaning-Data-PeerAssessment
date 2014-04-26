Getting-and-Cleaning-Data-PeerAssessment
========================================
This is Getting and Cleaning Data Peer Assessment

Create one R script called run_analysis.R that does the following:



1.Merges the training and the test sets to create one data set.

*Save all the data set files in working directory

*Read in data set files

*Read in features to be column name for x data sets

*Change features factor to character

*Assign the features to be column name to x data sets

*Assign "Activity" as colume name to y data sets

*Assign "SubjectID" as colume name to subject data sets

*Combine x data sets with SubjectID and Activity columns

*Combine train data set and test data set to form total data set


2.Extracts only the measurements on the mean and standard deviation for each measurement

*Assumption: Extract only features with "mean()" and "std()" for each measurement 
and also extract first 2 columns for SubjectID and Activity

3.Uses descriptive activity names to name the activities in the data set

*Read in activity label

*Change the activity label from factor to character

4.Appropriately labels the data set with descriptive activity names.

*By matching the content in the Activity column of total data set with the content in the 1st column of Activity data set, then replace the content in Activity column in total data set with the content in the 2nd column of Activity data set (via as.character). 


5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

*install reshape2 package

*library(reshape2)

*melt the data set by Activity and by SubjectID

*dcast the molten data set with mean formula to get the Average by Activity and by SubjectID

*The final data set is written as Data_Avg.txt

