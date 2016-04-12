---
title: "ReadMe"
author: "Dexter Wang"
date: "12 April 2016"
output: html_document
---

==================================================================
Read Me - Tidyed Dataset of Human Activity Recognition Using Smartphones
Dexter Wang
==================================================================

This is a data manipulation practice for Cousera Getting And Cleaning Data Week 4 Assignment. 

The project can be find at 

https://github.com/dexterwang/GettingAndCleaningDataAssignment4

There are four files in the repository

tidy_dataset.txt

run_analysis.R

CodeBook.md

ReadMe.md


==================================================================

tidy_dataset.txt

This is a dataset recording sensor signals from a group of 30 people who have performed six different activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.

The dataset summarise the mean value of 66 measurements for each of the individual taking each type of activity.  

The dataset is a tidied tranformation of another dataset which is orginally taken from the Dataset of Human Activity Recognition Using Smartphones by Jorge L. Reyes-Ortiz,et al. 

The source dataset can be downloaded from 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

==================================================================

run_analysis.R

This is a R script which transforms the orignal dataset into the tidy dataset.

It is assumed that the source data is unzipped in the working directory under "UCI HAR Dataset" folder. 

There are five steps of transformation undertaken. 

#1. Merges the training and the test sets to create one data set.

data from the following files are merged together to form one single dataset called full_dataset

X_train.txt 
X_test.txt
Y_train.txt
Y_test.txt
subject_train.txt
subject_test.txt 

The names of variables was taken from file features.txt with an extra subject and activity column storing data from "Y" and "subject" dimension. 

the full dataset has 563 variables and 10299 observations 

#2. Extracts only the measurements on the mean and standard deviation for each measurement.

only colunms (measurments) with "std()" and "mean()" in their names are selected

result in a sub dataset with 68 variables (66 measurements plus subject and activity)

#3. Uses descriptive activity names to name the activities in the data set

The numeric value in the activities column is replaced by descriptive names taken from activity_labels.txt

The names of activity are lower cased and having "_" replaced by " "

#4. Appropriately labels the data set with descriptive variable names.

The variable name of the measurements are taken from the features.txt

The detailed naming explanation can be find from features_info.txt 

The typo in the original data set is fixed 

#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject

The sub dataset is aggregated by activity and subject, calculating the average for each variable. It results in the summarised tidy dataset.

The tidy dataset is written into file tidy_dataset.txt


==================================================================

CodeBook.md

This is the data dictionary of all the variables in the tidy dataset.

The dataset summarised the average values of 66 measurements for each individual subject taking a particular activity. 


The measurements are listed below with both mean and standard deviation observations  

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag  

The naming consists of a number of brief notations 

prefix 't' to denote time
prefix 'f' to denote frequency 
Body refers to body
Gravity refers to gravity
Acc refers to acceleration
Jerk refers to jerk
Gyro refers to gyroscope
Mag mearefers tons magnitude
-X refers to X-axial of the device
-Y refers to X-axial of the device
-Z refers to X-axial of the device
-std() denote standard deviation
-mean() denote mean 





