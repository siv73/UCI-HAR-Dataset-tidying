##tidy data for Human Activity Recognition Using Smartphones Data Set 
filename <- "getdata.zip"

## if the file does not exist this will then download the data to the working directory
if(!file.exists(filename)){
        file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(file.url, destfile = "getdata.zip")
}


if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}

activity.lables <- read.table("UCI HAR Dataset/activity_labels.txt")
activity.lables[,2] <- as.character(activity.lables[,2])
features.data <- read.table("UCI HAR Dataset/features.txt")
features.data[,2] <- as.character(features.data[,2])
## fetching the indices of the columns in which mean and standard deviation
## variables are present
features.mean.sd <- grep(".*mean.*|.*std.*", features.data[,2])

##load train data

train.data <- read.table("UCI HAR Dataset/train/X_train.txt")
##setting the colnames from the features.data
colnames(train.data) <- features.data[,2]
train.activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
##fetching only the required data using the indices
train.data <- train.data[features.mean.sd]
names <- colnames(train.data)
##binding all observations together
train.data.all <- cbind(train.subject, train.activities, train.data)
colnames(train.data.all) <- c("subject", "Activity Name",names )

##load test data, process is same as above
test.data <- read.table("UCI HAR Dataset/test/X_test.txt")
colnames(test.data) <- features.data[,2]
test.activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
test.data <- test.data[features.mean.sd]
names <- colnames(test.data)
test.data.all <- cbind(test.subject, test.activities, test.data)
colnames(test.data.all) <- c("subject", "Activity Name", names)

##merging both training and test data
train.test.merge <- rbind(train.data.all, test.data.all)

##using the activity labels file to set the rownames for activities
train.test.merge$`Activity Name` <- factor(train.test.merge$`Activity Name`, 
                                           levels = activity.lables[,1], labels = activity.lables[,2])

##using melt to calculate mean in the next step
train.test.merge <- melt(train.test.merge, id = c("subject", "Activity Name"))
tidydata.mean <- dcast(train.test.merge, subject + `Activity Name` ~ variable, fun = mean)

##writing the tidy data to a file
write.table(tidydata.mean,"tidydata.txt", row.names = FALSE, quote = FALSE)

