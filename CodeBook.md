---
title: "CodeBook.M"
author: "MrD"
date: "23/07/2019"
output: html_document
---

## Source Datasets
Original source data included was obtained from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip. Not all obtained data files were used in the analysis. Files which were included were:

  "UCI HAR Dataset/train/y_train.txt" - Activity identifiers for the training dataset
  "UCI HAR Dataset/train/subject_train.txt" - Subject (participant) identifiers for the training dataset
  "UCI HAR Dataset/train/X_train.txt" - Feature or measure data for the training dataset

  "UCI HAR Dataset/test/X_test.txt" - Activity identifiers for the test dataset
  "UCI HAR Dataset/test/y_test.txt" - Subject (participant) identifiers for the testing dataset
  "UCI HAR Dataset/test/subject_test.txt" - Feature or measure data for the testing dataset

Labels for each colums were sourced from:
  "UCI HAR Dataset/features.txt"
  
Activity Labels were sourced from:
  "UCI HAR Dataset/activity_labels.txt"

## Processing
The Subject, Y (Activity) an X (Features) datasets were combined to create a single dataset for each of the training and test data. The two resultant datasets were then combined into a single dataset containing all data.

Columns in the single dataset were given meaningful names, either manually in the case of the subject and activity columns or using the feature names included in the Features.txt file.

Data in the activity column was updated with more descriptive labels using the lookup table provided in the activity_labels.txt file

Data for mean and standard deviation measures were extracted using the following regular expression ("mean|std").

The final dataset was created bt grouping on subject then activity and obtaining the mean for each group for all measured values. The resultant datafile is described in the output file

## Output File ("subjectmean.txt")

The Resultant output file contains the following data for each subject (study participant)-activity group.


