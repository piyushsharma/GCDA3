## Assumption is that the folder "UCI HAR Dataset" created by unzipping the 
## dataset given "getdata-projectfiles-UCI HAR Dataset.zip" is present in the 
## working directory where the script will be executed.

## Note: We could download the zip and untar it in R as well (Found working 
## example at => "http://stackoverflow.com/questions/3053833/using-r-to-" + \
## "download-zipped-data-file-extract-and-import-databut"), but choosing not
## to add the steps in executing this script to reduce run time

X_train <- read.table("UCI HAR Dataset/train/X_train.txt")
Y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

X_test <- read.table("UCI HAR Dataset/test/X_test.txt")
Y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

feature_names <- read.table("UCI HAR Dataset/features.txt")
feature_names <- feature_names$V2
feature_names <- as.character(feature_names)

colnames(X_train) <- feature_names
colnames(X_test) <- feature_names

X_total <- rbind(X_train, X_test)
Y_total <- rbind(Y_train, Y_test)
subject_total <- rbind(subject_train, subject_test)





