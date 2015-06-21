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
  - Merges the training and the test sets to create one data set.
    - read measurements (train & test)
    - read subjects (train & test)
    - read activity (trian & test)
    - add labels read activity (trian & test)
  
  - Extracts only the measurements on the mean and standard deviation for each measurement. 

  - Uses descriptive activity names to name the activities in the data set
    - descriptive names taken from file activity_labels
 
  - Appropriately labels the data set with descriptive variable names. 
    - labeling has been done in a previous step by adding the content of the file features as labels
 
  - From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
    - create the requested info -> result dataframe
    - create the independent tidy data set 
 
  
