Codebook for tidy.txt
=====================

Original dataset (see readme.txt from UCI_HAR_Dataset.zip)
----------------------------------------------------------
The experiments have been carried out with a group of 30 volunteers
within an age bracket of 19-48 years.
Each person performed six activities
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
wearing a smartphone (Samsung Galaxy S II) on the waist.
Using its embedded accelerometer and gyroscope, we captured 3-axial linear
acceleration and 3-axial angular velocity at a constant rate of 50Hz.
The experiments have been video-recorded to label the data manually.
The obtained dataset has been randomly partitioned into two sets, where
70% of the volunteers was selected for generating the training data
and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by
applying noise filters and then sampled in fixed-width sliding windows
of 2.56 sec and 50% overlap (128 readings/window).
The sensor acceleration signal, which has gravitational and body motion
components, was separated using a Butterworth low-pass filter into body
acceleration and gravity. The gravitational force is assumed to have only low
frequency components, therefore a filter with 0.3 Hz cutoff frequency was used.
From each window, a vector of features was obtained by calculating variables
from the time and frequency domain. See 'features_info.txt' for more details. 


Derived dataset
---------------

Derived data set was created from the original one with the following steps:
1. Data from files X_*.txt, y_*.txt, subject_*.txt from "UCI HAR Dataset/test/" directory  were appended to corresponding data from "UCI HAR Dataset/train/" directory.
1. Only *-mean() and *-std() columns were extracted (note that *-meanFreq() columns were discarded)/That leaves us only 66 columns out of 561.
1. Data from subject were appended as an "subject" column
1. Data y*.txt were merged with UCI HAR Dataset/activity_labels.txt and appended as extra column ("activity") as well
1. Combined data set was aggregated by activity and subject and average (mean) was calculated by those groups. Only combinations that have data was included into out dataset.
1. Dataset was written into tidy.txt file

tidy.txt data set is a fixed-width file.

Columns are:

| **Name** | **Column's starting position** | **Description** |
 activity                    | 1           | Its activity label. See activity_labels.txt in zip file.
 subject                     | 20          | An identifier of the subject who carried out the experiment.
 tBodyAcc-mean()-X,Y,Z       | 23,33,45    | Mean of tBodyAcc-mean()-X,Y,Z measurement for particular activity and subject
 tBodyAcc-std()-X,Y,Z        | 56,67,78    | Mean of tBodyAcc-std()-X,Y,Z measurement for particular activity and subject
 tGravityAcc-mean()-X,Y,Z    | 89,99,111   | Mean of tGravityAcc-mean()-X,Y,Z measurement for particular activity and subject
 tGravityAcc-std()-X,Y,Z     | 123,134,145 | Mean of tGravityAcc-std()-X,Y,Z measurement for particular activity and subject
 tBodyAccJerk-mean()-X,Y,Z   | 156,167,181 | Mean of tBodyAccJerk-mean()-X,Y,Z measurement for particular activity and subject
 tBodyAccJerk-std()-X,Y,Z    | 195,206,217 | Mean of tBodyAccJerk-std()-X,Y,Z measurement for particular activity and subject
 tBodyGyro-mean()-X,Y,Z      | 228,242,254 | Mean of tBodyGyro-mean()-X,Y,Z measurement for particular activity and subject
 tBodyGyro-std()-X,Y,Z       | 265,276,287 | Mean of tBodyGyro-std()-X,Y,Z measurement for particular activity and subject
 tBodyGyroJerk-mean()-X,Y,Z  | 298,310,322 | Mean of tBodyGyroJerk-mean()-X,Y,Z measurement for particular activity and subject
 tBodyGyroJerk-std()-X,Y,Z   | 334,345,356 | Mean of tBodyGyroJerk-std()-X,Y,Z measurement for particular activity and subject
 tBodyAccMag-mean()          | 367         | Mean of tBodyAccMag-mean() measurement for particular activity and subject
 tBodyAccMag-std()           | 379         | Mean of tBodyAccMag-std() measurement for particular activity and subject
 tGravityAccMag-mean()       | 390         | Mean of tGravityAccMag-mean() measurement for particular activity and subject
 tGravityAccMag-std()        | 402         | Mean of tGravityAccMag-std() measurement for particular activity and subject
 tBodyAccJerkMag-mean()      | 413         | Mean of tBodyAccJerkMag-mean() measurement for particular activity and subject
 tBodyAccJerkMag-std()       | 424         | Mean of tBodyAccJerkMag-std() measurement for particular activity and subject
 tBodyGyroMag-mean()         | 435         | Mean of tBodyGyroMag-mean() measurement for particular activity and subject
 tBodyGyroMag-std()          | 448         | Mean of tBodyGyroMag-std() measurement for particular activity and subject
 tBodyGyroJerkMag-mean()     | 460         | Mean of tBodyGyroJerkMag-mean() measurement for particular activity and subject
 tBodyGyroJerkMag-std()      | 471         | Mean of tBodyGyroJerkMag-std() measurement for particular activity and subject
 fBodyAcc-mean()-X,Y,Z       | 482,493,504 | Mean of fBodyAcc-mean()-X,Y,Z measurement for particular activity and subject
 fBodyAcc-std()-X,Y,Z        | 515,526,538 | Mean of fBodyAcc-std()-X,Y,Z measurement for particular activity and subject
 fBodyAccJerk-mean()-X,Y,Z   | 549,560,571 | Mean of fBodyAccJerk-mean()-X,Y,Z measurement for particular activity and subject
 fBodyAccJerk-std()-X,Y,Z    | 582,593,604 | Mean of fBodyAccJerk-std()-X,Y,Z measurement for particular activity and subject
 fBodyGyro-mean()-X,Y,Z      | 615,626,637 | Mean of fBodyGyro-mean()-X,Y,Z measurement for particular activity and subject
 fBodyGyro-std()-X,Y,Z       | 648,659,670 | Mean of fBodyGyro-std()-X,Y,Z measurement for particular activity and subject
 fBodyAccMag-mean()          | 681         | Mean of fBodyAccMag-mean() measurement for particular activity and subject
 fBodyAccMag-std()           | 692         | Mean of fBodyAccMag-std() measurement for particular activity and subject
 fBodyBodyAccJerkMag-mean()  | 703         | Mean of fBodyBodyAccJerkMag-mean() measurement for particular activity and subject
 fBodyBodyAccJerkMag-std()   | 714         | Mean of fBodyBodyAccJerkMag-std() measurement for particular activity and subject
 fBodyBodyGyroMag-mean()     | 725         | Mean of fBodyBodyGyroMag-mean() measurement for particular activity and subject
 fBodyBodyGyroMag-std()      | 736         | Mean of fBodyBodyGyroMag-std() measurement for particular activity and subject
 fBodyBodyGyroJerkMag-mean() | 747         | Mean of fBodyBodyGyroJerkMag-mean() measurement for particular activity and subject
 fBodyBodyGyroJerkMag-std()  | 758         | Mean of fBodyBodyGyroJerkMag-std() measurement for particular activity and subject



