#Wearable Device Analytics
##Purpose:
Internet of Things involves collecting data from devices such as cars, medical equipment and wearable devices.  The intent of the dataset will be to analyze the data generated from wearable devices namely, Samsung Galaxy S smartphones.

##Information
The CodeBook.md describes the variables, the data and the transformation necessary to clean the data for analysis.
30 volunteers, aged 19-48, performed six activities while wearing a smartphone.  The accelerometer and gyroscope measured 3 axis for linear acceleration and 3 axis for angular velocity.
70% of the data was used for training and the remainder set was used for testing.

##Directions:
### 0 Data collection
The files were downloaded from "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" and placed in "./data"
The working directory is ~/Data Science/data & the zip file is "UCI HAR Dataset.zip"
The files are extracted and into this directory, "./Data Science/data/UCI HAR Dataset"

### 1 Building data sets
Features, the variables containing the names need to be loaded
Activities, the subjects performed, for measurements are loaded
Features, activities & subjects are combined from test and train and the column names are created to add clarity to the data set.

### 2 Extracting Mean and STD columns
Columns with *mean* or *std* are extracted
"Activity" and "Subject" will be excluded and need to be added
"ignore.case = TRUE" is necessary since Mean/STD appear in mixed case.
These columns are extracted from the merged dataset.
Dim() & names() are used to validate the output of the script, not ran in production script.

### 3 Creating descriptive activity names
The activity label in the extracted data set is integer and will need to be character to support the descriptive name.
This requires the activity in extracted data and the id in activityLabels both be character.
** An alternate approach would be to add a column to extracted data to hold the activity descriptive label **
#### Attempt this after work submission
head() will validate the successful completion of conversion

### 4 Creating descriptive variable names
The CodeBook identifies the variables contained in the original dataset.  Since the extracted dataset only includes the mean and std, those variable descriptions are corrected for clarity.
It is assumed some variable names are known and these are outlined in the codebook.
The codebook outlines the variables that will be updated.

### 5 Create an average for each variable by activity by subject and write to a file called tidy.txt
This aggregates the data by subject and activity and calculates the mean for each variable.
The output is ordered by subject and activity so all activites are grouped by subject.
The data is outputted to "tidy.txt"


