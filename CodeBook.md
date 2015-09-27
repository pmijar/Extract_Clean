---
Title: "CodeBook"
Date: "September 27, 2015"
---

## Getting and Cleaning Data Project

##Description

Additional information related to the variables and data transformations performed in run_analysis.R script for getting and cleaning the data.

## Source Data
A full description of the data used in this project can be found at The [UCI Machine Learning Repository](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## Attribute Information

For each record in the dataset it is provided:   

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.   
- A 561-feature vector with time and frequency domain variables.   
- Its activity label.   
- An identifier of the subject who carried out the experiment.   

## Summary of the files downloaded used to derive tidy data output  

- 'features_info.txt': Shows information about the variables used on the feature vector.    
- 'features.txt': List of all features.   
- 'activity_labels.txt': Links the class labels with their activity name.   
- 'train/X_train.txt': Training data set.       
- 'train/y_train.txt': Training data set labels.   
- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30.   
- 'test/X_test.txt': Test data set.   
- 'test/y_test.txt': Test data set labels.    
- 'test/test_train.txt': Each row identifies the subject who performed the activity for each window sample.  



#### Section 1. Read and Merge the training and test data sets to create one data set.

After setting the source directory for the files to current working directory, read into tables the data located into following data tables  

-Features       :       Stores the features data read from features.txt table.   <br/>
-Activity_Type  :       Stores the activity data read from activity_labels.txt table.  <br/> 
-Subject_Train  :       Stores the training subject data read from subject_train.txt table.   <br/>         
-Train_Data     :       Stores the training data read from x_train.txt table.  <br/>
-Train_Label    :       Stores the training lable data read from y_train.txt table.   <br/>
-Training_Data  :       Stores the data after combining columns from Train_Label, Subject_Train and Train_Data data tables.   <br/>
-Subject_Test   :       Stores the training subject data read from subject_test.txt table.   <br/>
-Test_Data      :       Stores the training data read from x_test.txt table.   <br/>
-Test_Label     :       Stores the training lable data read from y_test.txt table.   <br/>
-Test_Data      :       Stores the data after combining columns from Test_Label, Subject_Test and Test_Data data tables.   <br/>
-Final_Data     :       Stores the data after merging Training_Data and Test_Data using rbind.    <br/>

Assign valid column names to each data set using colnames() function.


#### Section 2. Extract only the measurements on the mean and standard deviation for each measurement.


------------------- ---------------------------------------------
Data Table Variable Description  
------------------- ---------------------------------------------
mean_std            Using grep command perform a pattern search on Final_Data data table to identify the following columns                          like (subjectId, activityId, mean and std) and assign it to variable mean_std
------------------- ---------------------------------------------

#### Section 3. Use descriptive activity names to name the activities in the data set

Merge the mean_std data set with the Activity_Type table to inlude the descriptive activity names. Remove activityId column from mean_std after merging to single data set.


#### Section 4. Appropriately label the data set with descriptive activity names.

Data Table Variable   Description  
--------------------- ---------------------------------------------
pattern               Character Vector that was created to supply grep te pattern to look for.  
replacement           Character Vector that was created to supply the replacement value for the matched pattern in grep.  
mean_std_Names        Stores the colnames of the mean_std data table.            

grep function was used for pattern replacement to clean up the data labels.


#### Section 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.

--------------------- ---------------------------------------------
Data Table Variable   Description  
--------------------- ---------------------------------------------
Tidy_Data             Tidy Data (Tidy_Data) is created by applying the mean function using chaining, group_by and                                      summarize_each operation to mean_std data table from dplyr library  
--------------------- ---------------------------------------------

The Tidy_Data is then written to a text file **_(tidy_Data.txt)_** using write.table() function.    
