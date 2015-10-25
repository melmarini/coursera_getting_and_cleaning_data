#### Getting and Cleaning Data: Course Project - 10/2015 - MeM

## Clean environment
rm(list=ls())

## Packages
library(reshape2)

## Set working directory
setwd("C:/Users/melmarini/Documents/Coursera/Getting and Cleaning Data/Course Project/Data")

## Check if zip file with raw data exists, if not, download zip file
zipfile <- "getdata-projectfiles-UCI HAR Dataset.zip"
if(!file.exists(zipfile))
  {
    fileURL <-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileURL,destfile = "getdata-projectfiles-UCI HAR Dataset.zip")
  } else
  {
    "Zip file already exists"
  }

## Unzip file to working directory (if the unzipped files exist, do NOT overwrite)
suppressWarnings(unzip(zipfile,overwrite=FALSE))
rm(zipfile)

## Load activity labels
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
names(activityLabels) <- c("ActivityID","ActivityLabel")

## Load feature labels
features <- read.table("UCI HAR Dataset/features.txt")

## Find indices of feature vector containing mean and std measurements
featureIndices <- grep(".*mean.*|.*std.*", features[,2])

## Create feature labels
featureLabels <- features[featureIndices,2]
featureLabels <- gsub('-mean', 'Mean', featureLabels)
featureLabels <- gsub('-std', 'Std', featureLabels)
featureLabels <- gsub('[-()]', '', featureLabels)
featureLabels <- gsub("^t", "time", featureLabels)
featureLabels <- gsub("^f", "freq", featureLabels)
featureLabels <- as.character(featureLabels)
rm(features)

## Load train datasets and bind to one training set
trainSubject <- read.table("UCI HAR Dataset/train/subject_train.txt")
trainX <- read.table("UCI HAR Dataset/train/X_train.txt")[featureIndices] #Extract only mean and std measurements
trainy <- read.table("UCI HAR Dataset/train/y_train.txt")
train <- cbind(trainSubject,trainy,trainX)

## Load test datasets and bind to one test set
testSubject <- read.table("UCI HAR Dataset/test/subject_test.txt")
testX <- read.table("UCI HAR Dataset/test/X_test.txt")[featureIndices] #Extract only mean and std measurements
testy <- read.table("UCI HAR Dataset/test/y_test.txt")
test <- cbind(testSubject,testy,testX)

## Bind test and training sets, name columns using features and merge activity labels to total data set
totalData <- rbind(train,test)
names(totalData) <- c("Subject", "Activity",featureLabels)
#totalData <- suppressWarnings(merge(x = totalData, y = activityLabels, by.x = c("Activity"), by.y = c("ActivityID"), all.x = TRUE))
rm(trainSubject,trainX,trainy,train,testSubject,testX,testy,test,featureIndices, featureLabels, activityLabels)

## Group by dataset over subject + activity and calculate the average for each variable
totalData_melted <- melt(totalData, id = c("Subject", "Activity"))
totalData_avgs <- dcast(totalData_melted, Subject + Activity ~ variable, mean)
rm(totalData_melted)

## Write out total data set + aggregate data set
write.csv(totalData, file = "tidy_total.csv")
write.csv(totalData_avgs, file = "tidy_avgs.csv")



