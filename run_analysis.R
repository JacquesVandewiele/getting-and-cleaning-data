run_analysis <- function(){

        ## five steps :
        ## 1. Merges the training and the test sets to create one data set.
        ## 2. Extracts only the measurements on the mean and standard deviation 
        ##    for each measurement. 
        ## 3. Uses descriptive activity names to name the activities in the data set
        ## 4. Appropriately labels the data set with descriptive variable names. 
        ## 5. From the data set in step 4, creates a second, independent tidy data set 
        ##    with the average of each variable for each activity and each subject.

        ## the following steps need to be executed before running the script
        ## - install.packages("dplyr")
        ## - library(dplyr)
                
        ## 0. preparation
        
        olddir <- getwd()
        setwd("../datasciencecoursera/UCI HAR Dataset")
        
        ## 0.1. downloading and unzipping the zipped dataset
        ## only to be executed once
        
        ##zipfile <- tempfile()
        ##zipurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        ##download.file(url = zipurl, destfile = zipfile, quiet = TRUE)
        ##zipdir <- getwd()
        ##unzip(zipfile, exdir = zipdir) # files="" so extract all
        ##files <- list.files(zipdir)
        ##print(files)
                
        ## 1. Merges the training and the test sets to create one data set.
        ## 1.1. read measurements (train & test)
        ## 1.2. read subjects (train & test)
        ## 1.3. read activity (trian & test)
        ## 1.4. add labels read activity (trian & test)
        
        features <- as.vector(read.table("features.txt"))
        activitylabels <- as.vector(read.table("activity_labels.txt"))
        
        setwd("train")
        df1 <- read.table("X_train.txt")
        df1subjects <- read.table("subject_train.txt")
        df1activity <- read.table("y_train.txt")
        setwd("../test")
        df2 <- read.table("x_test.txt")
        df2subjects <- read.table("subject_test.txt")
        df2activity <- read.table("y_test.txt")
        
        df3 <- rbind(df1, df2)
        names(df3) <- features$V2
        

        ## 2. Extracts only the measurements on the mean and standard deviation 
        ##    for each measurement. 

        df3meanstd <- df3[,grep(paste(c("mean\\(","std\\("),collapse="|"), names(df3))]
        
        ## 3. Uses descriptive activity names to name the activities in the data set
        ## 3.1. descriptive names taken from file activity_labels
        
        df3subjects <- rbind(df1subjects, df2subjects)

        df2activity <- rbind(df1activity, df2activity)
                
        df3final <- cbind(df3subjects, df2activity, df3meanstd)
        names(df3final) <- c("subjects", "activity", names(df3meanstd))
        
        df3final[,2] <- activitylabels$V2[df3final$activity]
        
        ## 4. Appropriately labels the data set with descriptive variable names. 
        ## 4.1. labeling has been done in a previous step by adding the content of the file features as labels
        
        ## 5. From the data set in step 4, creates a second, independent tidy data set 
        ##    with the average of each variable for each activity and each subject.
        ## 5.1. create the requested info -> result dataframe
        ## 5.2. create the independent tidy data set 
        
        options(dplyr.width = Inf)
        
        result <- df3final %>%
                group_by(subjects, activity) %>%
                summarise_each(funs(mean(., na.rm=TRUE)))
        
        setwd("../")
        write.table(result, "course_project_tidydataset.txt", row.name=FALSE)
        
        ## final step : reset environment
        
        setwd(olddir)
        
}