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

activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")

# Give column names to the training and test data
colnames(X_train) <- feature_names
colnames(X_test) <- feature_names

# 1) Merge the training and the test sets to create one data set
X_total <- rbind(X_train, X_test)
Y_total <- rbind(Y_train, Y_test)
subject_total <- rbind(subject_train, subject_test)

# 2) Extracts only the measurements on the mean and 
# standard deviation for each measurement 
measurement_means <- rowMeans(X_total)
measurement_sd <- apply(X_total, 1, sd)

# Note: If you mean separate mean and measurement containing columns, then 
# 2) Use grep to find the indices and then the names
required_columns <- grep(".*mean.*|.*std.*", feature_names)
mean_sd_columns <- feature_names[c(required_columns)]
# Filter all the required columns (i.e. which have mean or sd data)
X_required_columns <- X_total[, mean_sd_columns]

# 3) Merge Y data to get the corresponding activity labels; directly
# use that to add another column that contains activity_label to the data 
Y_total <- merge(Y_total, activity_labels, by.x="V1", by.y="V1", all=TRUE)
X_required_columns$activity = Y_total$V2
X_required_columns$subject = subject_total$V1

# 4) Appropriately labels the data set with descriptive variable names, already 
# did this when combining rows above and adding the new columns, verify using =>
names(X_required_columns)
head(X_required_columns$activity, n=100)

# 5) Use melt and dcast as in lectures to prepare the tidy dataset
prepare_tidy <- melt(X_required_columns, id=c("subject","activity"))
tidy_dataset <- dcast(prepare_tidy, subject+activity ~ variable, mean)
head(tidy_dataset)

# Write the final tidy datasert to a tab separated text file
write.table(tidy_dataset, "tidy.txt", sep="\t")
