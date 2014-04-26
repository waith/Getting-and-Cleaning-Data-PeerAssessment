## For Getting and Cleaning Data Peer Assessment
## This is the R script file for run_analysis.R

#1.Merges the training and the test sets to create one data set.
#the data set files are in working directory
#read in data set files
x_train <- read.table("X_train.txt", header=FALSE, sep="")
y_train <- read.table("y_train.txt", header=FALSE, sep="")
subject_train <- read.table("subject_train.txt", header=FALSE, sep="")
x_test <- read.table("X_test.txt", header=FALSE, sep="")
y_test <- read.table("y_test.txt", header=FALSE, sep="")
subject_test <- read.table("subject_test.txt", header=FALSE, sep="")

#read in features to be column name for x
colnamex<-read.table("features.txt", header = FALSE, sep="")

#change features factor to character
colnamex[,2] <- as.character(colnamex[,2])

#assign features as colume name to  data set x
colnames(x_train) <- colnamex[,2]
colnames(x_test) <- colnamex[,2]

#assign colume name to  data set y
colnames(y_train) <- "Activity"
colnames(y_test) <- "Activity"

#assign colume name to  subject data set
colnames(subject_train) <- "SubjectID"
colnames(subject_test) <- "SubjectID"

#combine data set x files with subject and y (Activity) columns
train_data <- cbind(subject_train, y_train, x_train)
test_data <- cbind(subject_test, y_test, x_test)

#combine train data set and test data set to form total data set
total_data <- rbind(train_data,test_data)

#2.Extracts only the measurements on the mean and standard deviation for each measurement
#The following will extract only features with "mean()" and "std()" for each measurement 
#and also first 2 columns for SubjectID and Activity
toMatch <- c(".*mean\\(\\).*", ".*std\\(\\).*")
matches <- grep(paste(toMatch,collapse="|"), colnames(total_data), ignore.case=TRUE, value=FALSE)
Extracted <-total_data[,c(1,2,matches)]

#3.Uses descriptive activity names to name the activities in the data set
#read in activity label
activity <- read.table("activity_labels.txt", header=FALSE, sep="")
#change the activity label from factor to character
activity$v2 <- as.character(activity$V2)

#4.Appropriately labels the data set with descriptive activity names.
#replace the number with activity name in data set
Extracted$Activity[] <- as.character(activity[Extracted$Activity[],2])

#5.Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#install reshape2 package
install.packages("reshape2")
library(reshape2)
#melt the data set by Activity and by SubjectID
molten = melt(Extracted, id = c("Activity", "SubjectID"))
#cast the data set with mean formula to get the Average by Activity by SubjectID
Data_Avg <- dcast(molten, formula = Activity + SubjectID ~ variable, mean)
write.table(Data_Avg,"Data_Avg.txt")
