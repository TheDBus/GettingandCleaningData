####################################################################################################################
# run_analysis.R
#
# Description: Script file prepared for the assignment for the Getting and Cleaning Data course. The Script prepares
#              tidy dataset by combining and refining training and test gathered from the galaxy Smartphone Acceleratomer 
#              and Gyroscope data.
#
#             Outputs a single dataset file subjectmean.txt whcih contains the average of the mean andstandard deviation
#             measures grouped by subject and activity.
#
# Author: MrD
#
# Date: July 22, 2019
# 
# Notes: Assumes that the souce datafiles have been downloaded and unzipped using the structure in the zip to the same d
#        directory that the script resides.
####################################################################################################################

# Load the required files into R.
trnact<- read.table("UCI HAR Dataset/train/y_train.txt")
trnsbj<- read.table("UCI HAR Dataset/train/subject_train.txt")
trnftr<- read.table("UCI HAR Dataset/train/X_train.txt")

tstftr<- read.table("UCI HAR Dataset/test/X_test.txt")
tstact<- read.table("UCI HAR Dataset/test/y_test.txt")
tstsbj<- read.table("UCI HAR Dataset/test/subject_test.txt")

#combine seperate datasets into a single dataset
trncmb<-cbind(trnsbj,trnact,trnftr)
tstcmb<-cbind(tstsbj,tstact,tstftr)

allcmb<-rbind(trncmb,tstcmb)

# Appropriately label the dataset with descriptive variable names
names(allcmb)[1]<-"subject"
names(allcmb)[2]<-"activity"

featurelbl<- read.table("UCI HAR Dataset/features.txt")
names(allcmb)[3:563]<-as.character(featurelbl$V2)

#Alter the activities to meaningful names
activitylbl<- read.table("UCI HAR Dataset/activity_labels.txt")
allcmb$activity<-activitylbl$V2[match(allcmb$activity,activitylbl$V1)]

#extract the columns that we need (ie. those on measures with mean and standard deviation) into a new dataset
allfltr<-allcmb[,c(1,2,grep("mean|std",names(allcmb)))]
  
# Aggregate by subject and activity
library(dplyr)
res<-summarise_all(group_by(allfltr,subject,activity),mean)

# write the resultant dataset to disk
write.table(res,"subjectmean.txt",row.names=FALSE)

