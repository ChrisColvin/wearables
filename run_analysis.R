## run_analysis.R is a function that merges training and test data for wearable device analytics.
## README.md located on GitHub repo provides details about each step within this R script
## CodeBook.md, located on GitHub repo describes the data, the variables and the necessary transformations

run_analysis<- function() {
  
      ## 0 Data Collection
      setwd("~/Data Science") ## Working Directory
      fileURL<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
      
      ## Checks to see if file exists      
      if(file.exists("./data/UCI HAR Dataset.zip") == FALSE) { 
            download.file(fileURL, "./data/UCI HAR Dataset.zip", mode="wb")
      }
      
      ## Unzips the file
      if(file.exists("./data/UCI HAR Dataset") == FALSE) {
            unzip("./data/UCI HAR Dataset.zip", unzip ="internal")
      }
            
  
}