---
Title: "README"
Date: "September 27, 2015"
---

# Getting and Cleaning Data Project

This is the course project for Getting and Cleaning Data offered by Johns Hopkins.

## Overview

This project would demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. The data used for this project represent the data collected from the embedded accelerometers and gyroscope of Samsung Galaxy S smartphone. A full description of the data used in this project can be found at The [UCI Machine Learning Repository](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).


## Project Summary

The following is a summary description of the project instructions

You should create one R script called run_analysis.R that does the following.   
1. Merges the training and the test sets to create one data set.    
2. Extracts only the measurements on the mean and standard deviation for each measurement.    
3. Uses descriptive activity names to name the activities in the data set.   
4. Appropriately labels the data set with descriptive activity names.    
5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.   

## How to run the run_analysis.R script

Please follow the below steps to execute the run_analysis.R script:  
 1. Open the R Application and wait for the '>' prompt to appear.  
 2. Type **_getwd()_** command following the prompt and hit enter key to get your current working directory.   
 3. Download and unzip the file in the current working directory.  
 4. Type **_setwd("./UCI HAR Dataset")_** to get into the unzipped file folder.   
 5. Copy the run_analysis.R script in the same folder (/UCI HAR Dataset) as in step 4.  
 6. Type **_source("./run_analysis.R")_** command following the prompt and hit enter key to run the script.   

## Output of the run_analysis.R script

The output of the run_analysis.R script would generate the required tidy data set as **_tidy_Data.txt_** file under data folder in the current working directory.


## Additional Information

Additional information related to the variables and data transformations performed can be found in the CodeBook.md file.
