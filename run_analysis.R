## run_analysis.R is a function that merges training and test data for wearable device analytics.
## README.md located on GitHub repo provides details about each step within this R script
## CodeBook.md, located on GitHub repo describes the data, the variables and the necessary transformations

run_analysis<- function() {
  
      ## 0 Data Collection
      setwd("~/Data Science/data") ## Working Directory
      fileURL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      
      ## Checks to see if file exists      
      if(file.exists("./UCI HAR Dataset.zip") == FALSE) { 
            download.file(fileURL, "./UCI HAR Dataset.zip", mode="wb")
      }
      
      ## Unzips the file
      if(file.exists("./UCI HAR Dataset") == FALSE) {
            unzip("./UCI HAR Dataset.zip", unzip ="internal")
      }
      
      ## Ensure the libraries needed are loaded
      library(data.table)
      library(dplyr)
      
  ## 1 Building data sets by reading test/train data and merging the data sets
      
      ## Meta data
      featureLabels<- read.table("./UCI HAR Dataset/features.txt")
      activityLabels<- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE)
  
      ## Training data
      ## x represents features
      ## y represents activities
      x_train<- read.table("./UCI HAR Dataset/train/x_train.txt")
      y_train<-read.table("./UCI HAR Dataset/train/y_train.txt")
      subject_train<- read.table("./UCI HAR Dataset/train/subject_train.txt")
      
      ## Test data
      ## x represents features
      ## y represents activities
      x_test<- read.table("./UCI HAR Dataset/test/x_test.txt")
      y_test<-read.table("./UCI HAR Dataset/test/y_test.txt")
      subject_test<- read.table("./UCI HAR Dataset/test/subject_test.txt")
      
      ## Combine test/train data after read into memory
      x<- rbind(x_train, x_test)
      y<- rbind(y_train, y_test)
      subject<- rbind(subject_train,subject_test)
  
      ## Assignment of names to the columns
      colnames(x)<- t(featureLabels[2])
      colnames(y)<- "Activity"
      colnames(subject)<- "Subject"
  
      ## Merging the data
      mergedData<- cbind(x,y,subject)
  
  ## 2 Extract features(measurements) for mean and standard deviation
      ## the columns with features *mean* or *std* are placed into a new data set
      ## CAUTION "Activity" and "Subject" are excluded and added back to data set
      colMeanstd<- grep(".*Mean.*|.*Std.*", names(mergedData), ignore.case=TRUE)
      extractedColumns<- c(colMeanstd,562,563)
      meanstdData<- mergedData[,extractedColumns]
      
      ## Indicates column count & column names to validated output, only used for testing
      ## dim(meanstdData)
      ## names(meanstdData)
      
  ## 3 Replace activity index with activity names
      ## meanstdData$Activity is an integer and needs to be converted to character to accept activity name
      meanstdData$Activity<- as.character(meanstdData$Activity)
      ## activityLabels$ID is an integer and need to be converted to character to successfully merge the data
      for (i in 1:6) {
            meanstdData$Activity[meanstdData$Activity ==i]<- as.character(activityLabels[i,2])
      }
      meanstdData$Activity<- as.factor(meanstdData$Activity)
      
      ## head/tail(meanstdData) ## validates the completed activity
  
  ## 4 Make variable names more descriptive
      ## The codebook outlines the descriptions it assumes the user should know.
      ## The codebook describes which descriptions will be updated.
      names(meanstdData)<- gsub("BodyBody", "Body", names(meanstdData))
      names(meanstdData)<- gsub("^t", "Time", names(meanstdData))
      names(meanstdData)<- gsub("^f", "Freq", names(meanstdData))
      names(meanstdData)<- gsub("tBody", "TimeBody", names(meanstdData))
  
      ## Validate the results
      ## head(meanstdData)
      
  ## 5 Calculate the mean of each variable by activity and subject
      ## Subject need to be a factor to enable the aggregation with Activity
      meanstdData$Subject<- as.factor(meanstdData$Subject)
      meanstdData<- data.table(meanstdData)
  
      ## Aggregates the data by Subject and Activity and calculates the mean
      tidy<- aggregate(. ~Subject + Activity, meanstdData, mean)
      
      ## Orders the file by subject and activity
      tidy<- tidy[order(tidy$Subject,tidy$Activity),]
      
      ## Writes the output of "tidy" to "tidy.txt"
      write.table(tidy, file = "tidy.txt", row.names = FALSE)
    
}