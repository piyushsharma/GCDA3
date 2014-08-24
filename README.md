GCDA3
=====

This repo has the run_analysis.R script that processes the dataset at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Function of the run_analysis.R script:
======================================
1) Merges the training and the test sets to create one data set.
2) Extracts only the measurements on the mean and standard deviation for 
   each measurement.
3) Uses descriptive activity names to name the activities in the data set
5) Appropriately labels the data set with descriptive variable names. 
5) Creates a second, independent tidy data set with the average of each 
   variable for each activity and each subject

Finally, it writes the new tidy dataset to a tab separated text file called
"text.txt"

The script is commented to highlight the assumptions and functions used to 
achieve the goals of creating the required tidy data set.

The repo includes the CodeBook.md file
=======================================
Codebook.md describes the variables, the data, and any transformations or 
work that I performed to clean up the data.

Notes:
======
The script does not check for NA (missing) fields anywhere because
there was no missing data encountered in the dataset consumed.
