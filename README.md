# getting-and-cleaning-data
course project files
run_analysis.R script requires the following preparation :
- download the zipfile required for this course project :
  - zipfile <- tempfile()
  - zipurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  - download.file(url = zipurl, destfile = zipfile, quiet = TRUE)
  - zipdir <- getwd()
  - unzip(zipfile, exdir = zipdir) # files="" so extract all
  - files <- list.files(zipdir)
  
- package dplyr is used, consequently execute the following before executing the script
  - install.packages("dplyr")
  - library(dplyr)

- run_analysis() executes the script 
- the result can be found in the set working directory

- five steps are executed
  - 1. Merges the training and the test sets to create one data set.
    - 1.1. read measurements (train & test)
    - 1.2. read subjects (train & test)
    - 1.3. read activity (trian & test)
    - 1.4. add labels read activity (trian & test)
  
  - 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

  - 3. Uses descriptive activity names to name the activities in the data set
    - 3.1. descriptive names taken from file activity_labels
 
  - 4. Appropriately labels the data set with descriptive variable names. 
    - 4.1. labeling has been done in a previous step by adding the content of the file features as labels
 
  - 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    - 5.1. create the requested info -> result dataframe
    - 5.2. create the independent tidy data set 
 
  
