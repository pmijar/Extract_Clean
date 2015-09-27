# Getting and Cleaning Data Course Project
 
# Merges the training and the test sets to create one data set.
# Extracts only the measurements on the mean and standard deviation. 
# Uses descriptive activity names to name the activities in the data set (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
# Appropriately labels the data set with descriptive variable names. 
# Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Clear the workspace variables
rm(list = ls())

## Load the Library
library(dplyr)

## Section 1:

## Reading Features and Activity data
Features      <- read.table('./features.txt',header=FALSE); # Read the Feature data
Activity_Type <- read.table('./activity_labels.txt',header=FALSE); # Read the Activity Data

## Reading individual falt text file of Training Data
Subject_Train <- read.table('./train/subject_train.txt',header=FALSE); # Read the Subject Training Data
Train_Data    <- read.table('./train/x_train.txt',header=FALSE); # Read the Training Data
Train_Label   <- read.table('./train/y_train.txt',header=FALSE); # Read the Traning Labels

## Give Column names Training Data
colnames(Activity_Type)  <- c('activityId','activityType');
colnames(Subject_Train)  <- "subjectId";
colnames(Train_Data)   <- Features[,2];
colnames(Train_Label)  <- "activityId";

## Create Training data table by Consolidating columns (Traning Labels, Training Data and Training Subjects) 
Training_Data <- cbind(Train_Label, Subject_Train, Train_Data);

## Reading individual falt text file of Test Data
Subject_Test <- read.table('./test/subject_test.txt',header=FALSE); #imports subject_test.txt
Test_Data    <- read.table('./test/x_test.txt',header=FALSE); #imports x_test.txt
Test_Label   <- read.table('./test/y_test.txt',header=FALSE); #imports y_test.txt

## Give Column names for Test Data
colnames(Subject_Test) <- "subjectId";
colnames(Test_Data)    <-  Features[ , 2];
colnames(Test_Label)   <- "activityId";

## Create Test data table by Consolidating columns (Test Labels, Test Data and Test Subjects) 
Test_Data = cbind(Test_Label, Subject_Test, Test_Data);

## Step 1 - Merges the Training and Test sets to create one data set. 
Final_Data = rbind(Training_Data, Test_Data);
Final_Data <- tbl_df(Final_Data)

## Section 2: 

## Step 2 - Extracts only the measurements on the mean and standard deviation for each measurement
Final_Names <- names(Final_Data) # Final_Names would the used in grep to shorten the lengthy names(Final_data) to Final_Names
mean_std <- Final_Data[ ,c(grep("subjectId", Final_Names), grep("activityId", Final_Names), grep("mean\\(\\)", Final_Names), grep("std\\(\\)", Final_Names))]
mean_std <- tbl_df(mean_std)

## Section 3: 

## Step 3 - Merge the above mean_std data with activity data so that we have the activity Type
mean_std <- merge(mean_std, Activity_Type, by.x = "activityId", by.y = "activityId", all.x = TRUE)
mean_std <- select(mean_std, -activityId) # Remove the activity Id

## Section 4: 

## Step 4 - Appropriately Label the dataset with descriptive variable name
pattern <- c("\\()", "-mean", "Acc", "Mag", "-std", "BodyBody") # create a pattern vector to search for in variable name
replacement <- c("", "_Mean", "Acceleration", "Magnitude", "_StdDeviation", "Body") # create a replacement vector to replace pattern within grep command
mean_std_Names <- names(mean_std)

for(i in 1:length(mean_std_Names)) 
{
  for (j in 1:length(pattern)) 
  {
  mean_std_Names[i] <- gsub(pattern[j],replacement[j],mean_std_Names[i])
  }
}

## Assign the updated variable descriptions to the mean_std columns
colnames(mean_std) <- mean_std_Names

## Section 5: 

## Step 5 - Independent tidy data set with the average of each variable for each activity and each subject
mean_std <- tbl_df(mean_std)
Tidy_Data <- mean_std %>% group_by(activityType, subjectId) %>% summarize_each(funs(mean))

## Write the tidy Data to output text file under data directory
if(!file.exists("./data")) # Create a data directory if not present in working directory
{
  dir.create("./data")
} 
write.table(Tidy_Data, file = "./data/tidy_Data.txt",sep = "\t", append = FALSE, row.names = FALSE)
