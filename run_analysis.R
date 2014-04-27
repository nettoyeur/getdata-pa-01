library(plyr)
library(gdata)

# Main entry point fo tidying UCI HAR data.
# Parameters:
#     output  -- output file name where clean dataset will be stored (default = tidy.txt)
#     zipfile -- zipfile with archived original data set (default ="UCI_HAR_Dataset.zip"). See comments on prepareDataSets() function.
# Returns clean&tide data set; in the process writes dataset into output file.
#
run_analysis <- function(output="tidy.txt", zipfile="UCI_HAR_Dataset.zip") {
    wd <- getwd()
    prepareDataSets(zipfile)
    tide <- tideDataSet()
    setwd(wd)
    write.fwf(tide, output)
    tide
}

# Prepares data set for processing.
#
# Takes the name of zip file with data as an input.
# At most it downloads file from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" to zipfile (parameter) then unzips it,
# and change working directory to "./UCI HAR Dataset/".
# If either zipfile or "UCI HAR Dataset/" directory exists then corresponding step(s) is omitted.
# Returns nothing.
#
prepareDataSets <- function (zipfile) {
    datadir <- "UCI HAR Dataset"
    if(!file.exists(zipfile)) {
        res<-download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", destfile=zipfile, method="wget")
        if(res != 0) {
            stop("Cannot download file")
            return
        }
    }
    if(!file.exists(datadir)) {
        unzip(zipfile)
    }
    if (!file.exists(datadir)) {
        stop("Unzip unsuccessful")
    }
    setwd(datadir)
}

# Creates data.frame with resulting dataset.
#
# Returns data.frame with rows -- combination of subject and activity,
# each columns (except activity and subject) -- the mean of the measurements on the mean and standard deviation of the original measurements
# 
tideDataSet <- function() {
    data <- combineDataSets()
    agg <- aggregate(data[,1:(length(data)-2)], list(data$activity, data$subject), mean)
    names(agg)[1:2] <- c("activity", "subject")
    agg

#    splitData <- split(data[,1:(length(data)-2)], list(data$subject, data$activity))
#    meansByActivitySubject <- sapply(splitData, colMeans)
#    rowNames <- strsplit(rownames(t), "\\.")
#    subj <- sapply(rowNames, function(x) as.integer(x[1]))
#    act  <- sapply(rowNames, function(x) as.factor(x[2]))
#    t <- t(meansByActivitySubject)
#   df <- data.frame(t)
#    df$activity <- act
#    df$subject  <- subj
    
}


# 
# Create full dataset.
# 
# The original mesurements dataset consists of two parts: test and train.
# This method combines them into one large dataset as well as joins it with subject and activities descriptions and also set correct column names.
# For more information about original dataset see readme in the archive.
# 
combineDataSets <- function() {

    features<-read.table("features.txt", col.names=c("num", "name"))
    activity_labels<-read.table("activity_labels.txt", col.names=c("id", "activity"))
#    trainds <- processDataSet("train", features, activity_labels)
#    testds  <- processDataSet("test", features, activity_labels)

    combineTrainAndTest <- function(datasetname, ...) {
        filename<-function(basename, kind) {
            paste0(kind, "/", basename, "_", kind,".txt")
        }
        traindataset <- read.table(filename(datasetname, "train"), ...)
        testdataset  <- read.table(filename(datasetname, "test"), ...)
        fullset <- rbind(traindataset, testdataset)
        fullset
    }
    needed_cols_idx<-grep("-std\\(\\)|-mean\\(\\)", features$name, value=F)
    colsClasses <- rep("NULL", length(features$name))
    colsClasses[needed_cols_idx] <- "numeric"
    needed_cols<-grep("-std\\(\\)|-mean\\(\\)", features$name, value=T)

    data <- combineTrainAndTest("X", colClasses=colsClasses)
    #names(data) <- gsub("\\W", "_", needed_cols)
    names(data) <- needed_cols

    subjects <- combineTrainAndTest("subject", col.names="subject")
    data$subject <- subjects$subject

    activities <- combineTrainAndTest("y", col.names="activity_id")
    temp<- merge(activities, activity_labels, by.x="activity_id", by.y="id", sort=F)
    data$activity <- temp$activity

    data
}

#processDataSet <- function(directory, features, activity_labels) {
#  filename<-function(basename, kind) {
#    paste0(kind, "/", basename, "_", kind,".txt")
#  }
#
#  needed_cols_idx<-grep("-std\\(\\)|-mean\\(\\)", features$name, value=F)
#  colsClasses <- rep("NULL", length(features$name))
#  colsClasses[needed_cols_idx] <- "numeric"
#  needed_cols<-grep("-std\\(\\)|-mean\\(\\)", features$name, value=T)
#
#  data <- read.table(filename("X", directory), colClasses=colsClasses)
#  names(data) <- gsub("\\W", "_", needed_cols)
#
#  subjects <- read.table(filename("subject", directory), col.names="subject")
#  
#  activities<-read.table(filename("y", directory), col.names="activity_id")
#  temp<- merge(activities, activity_labels, by.x="activity_id", by.y="id", sort=F)
#
#  data$subject <- subjects
#  data$activity <- temp$activity
#
#  data
#}
