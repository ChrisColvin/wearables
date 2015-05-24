#Code Book Wearable Device Analytics
This file describes the data, the transformation of the data and the variables.

##Data
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

###Source
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

###Directory Structure
UCI HAR Dataset/train - contains the data related to train data set

UCI HAR Dataset/test - contains the data related to test data set

UCI HAR Dataset/activity_labels.txt - describes the activities the subject performed

UCI HAR Dataset/features.txt - the variables measured over time for each subject, there are 561 variables

UCI HAR Dataset/features_info.txt - the measurements for the variables and additional vectors obtained by averaging the signals

UCI HAR Dataset/README.txt - content describing the data set, but content is contained here and in README.md on GitHub

UCI HAR Dataset/train/Inertial Signals - raw data for accelerometer, gyroscope in all x,y,z axis. DATA NOT USED FOR THIS ANALYSIS

UCI HAR Dataset/train
subject_test.txt - subjects for the data set
X_test.txt - activity for the subjects
y_test.txt - features for the activity

UCI HAR Dataset/train/Inertial Signals - raw data for accelerometer, gyroscope in all x,y,z axis. DATA NOT USED FOR THIS ANALYSIS

UCI HAR Dataset/train
subject_test.txt - subjects for the data set
X_test.txt - activity for the subjects
y_test.txt - features for the activity

###Variables
This discusses the variables contained within the dataset.

###Transformations
This discusses the transformation of the variables to increase readability.
