#1. Merges the training and the test sets to create one data set.

# Load the "X" part of train & test data and merge them together 

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt",header=FALSE)

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt",header=FALSE)

x_train_n_test <- rbind(x_train,x_test)

# Load the "Y" part of train & test data (the activity labels) and merge them together

y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt",header=FALSE)

y_test <- read.table("./UCI HAR Dataset/test/Y_test.txt",header=FALSE)

y_train_n_test <- rbind(y_train,y_test)

# Load the subject part of train & test data and merge them together

subject_train <-  read.table("./UCI HAR Dataset/train/subject_train.txt",header=FALSE)

subject_test <-  read.table("./UCI HAR Dataset/test/subject_test.txt",header=FALSE)

subject_train_n_test <- rbind(subject_train,subject_test)


# Load the list of features which will be used as variable names

features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,sep="\n")

features <- unlist(lapply(as.character(features[,1]), strsplit,split=" "))

# take the odd values from the vector of code/name pairs 

features <- features[ c(1:length(features)) %% 2 ==0]

# the full dataset consist of the X, Y and subject with both train and test data

full_dataset <- cbind(x_train_n_test,y_train_n_test,subject_train_n_test)

# use the list of features to name the variables. 
# the last "Y" and "subject" columns are named as "activity" and "subject" 

names(full_dataset) <- c(features,"activity","subject")

#2. Extracts only the measurements on the mean and standard deviation for each measurement.

# use regular expression to match the columns with "std()" and "mean()" measurements

sub_dataset <- full_dataset[,sort(c(grep("std\\(\\)",names(full_dataset)),grep("mean\\(\\)",names(full_dataset)),562,563))]

#3. Uses descriptive activity names to name the activities in the data set

# load activity labels from file

activities <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,sep="\n")

activities <- unlist(lapply(as.character(activities[,1]), strsplit,split=" "))

# result in a data frame with an activity code column and corresponding activity name column
activities <- data.frame(code=activities[c(1:length(activities)) %% 2 == 1],name=activities[c(1:length(activities)) %% 2 == 0])

# clean the values, change data type, change string to lower case and replace "_" with " "
activities[,1] <- as.numeric(activities[,1])

activities[,2] <- tolower(activities[,2])

activities[,2] <- gsub("_"," ",activities[,2])

# replace activity code in sub_dataset with activity names
sub_dataset <- merge(sub_dataset,activities,by.x="activity",by.y="code")

sub_dataset <- subset(sub_dataset,select=-activity)

names(sub_dataset)[names(sub_dataset)=="name"] <-"activity"

#4. Appropriately labels the data set with descriptive variable names.

# fix typo in variable names
names(sub_dataset) <- gsub("BodyBody","Body",names(sub_dataset))

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject


# aggregate sub_dataset by activity and subject, calculate the average for each variable

by1 <- sub_dataset$activity

by2 <- sub_dataset$subject

tidy_dataset <- aggregate(x=subset(sub_dataset,select=-c(activity,subject)),by=list(by1,by2),FUN="mean")

# swap the activity and subject columns

tidy_dataset<-tidy_dataset[,c(2,1,3:ncol(tidy_dataset))]

names(tidy_dataset)[1] <- "subject"

names(tidy_dataset)[2] <- "activity"



# write tidy dataset into file

write.table(tidy_dataset,file="./tidy_dataset.txt",sep=" ",col.names=TRUE,row.names=FALSE)

# test read tidy dataset from file

testread_tidy_dataset <- read.table("./tidy_dataset.txt",header=TRUE,check.name=FALSE)




