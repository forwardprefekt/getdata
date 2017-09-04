#You should create one R script called run_analysis.R that does the following.

# 1) Merges the training and the test sets to create one data set.
# 2) Extracts only the measurements on the mean and standard deviation for each measurement.
# 3) Uses descriptive activity names to name the activities in the data set
# 4) Appropriately labels the data set with descriptive variable names.
# 5) From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


#

# Our Feature Values
feature_names <-  read.table("./features.txt", stringsAsFactors = FALSE)[,2]

#List of subjects for each sample
subjects <- rbind(read.table("./test/subject_test.txt") , read.table("./train/subject_train.txt"))
colnames(subjects) <- c("SubjectId")

#Activity IDs
y <- rbind(read.table("./test/y_test.txt"), read.table("./train/Y_train.txt"))
colnames(y) <- c("ActivityId")

#Actual  device measurements
x<- rbind(read.table("./test/X_test.txt"), read.table("./train/X_train.txt"))
colnames(x) <- feature_names

#Extract out columns that have either mean or std measurements
desired_columns<- c(grep("mean()",colnames(x)),grep("std()", colnames(x)))

#combine device measurements with activity type and subject ID
all_data <- tbl_df(cbind(subjects,y,x[,desired_columns]))

#create dataset with means of each sample per activity/subject
tidy_mean<-all_data %>% group_by(ActivityId, SubjectId) %>% summarise_all(funs(mean))

#store our new tidy data in a file
write.table(tidy_mean, "./tidy_mean_subset.txt",row.names = FALSE)
