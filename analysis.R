##tidy data for Human Activity Recognition Using Smartphones Data Set 
filename <- "getdata_dataset.zip"

if(!file.exists(filename)){
        file.url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        download.file(file.url, destfile = "getdata_dataset.zip")
}

if (!file.exists("UCI HAR Dataset")) { 
        unzip(filename) 
}

activity.lables <- read.table("UCI HAR Dataset/activity_labels.txt")
activity.lables[,2] <- as.character(activity.lables[,2])
features.data <- read.table("UCI HAR Dataset/features.txt")
features.data[,2] <- as.character(features.data[,2])
features.mean.sd <- grep(".*mean.*|.*std.*", features.data[,2])

##load train data
train.data <- read.table("UCI HAR Dataset/train/X_train.txt")
colnames(train.data) <- features.data[,2]
train.activities <- read.table("UCI HAR Dataset/train/Y_train.txt")
train.subject <- read.table("UCI HAR Dataset/train/subject_train.txt")
train.data <- train.data[features.mean.sd]
names <- colnames(train.data)
train.data.all <- cbind(train.subject, train.activities, train.data)
colnames(train.data.all) <- c("subject", "Activity Name",names )

##load test data
test.data <- read.table("UCI HAR Dataset/test/X_test.txt")
colnames(test.data) <- features.data[,2]
test.activities <- read.table("UCI HAR Dataset/test/Y_test.txt")
test.subject <- read.table("UCI HAR Dataset/test/subject_test.txt")
test.data <- test.data[features.mean.sd]
names <- colnames(test.data)
test.data.all <- cbind(test.subject, test.activities, test.data)
colnames(test.data.all) <- c("subject", "Activity Name", names)
train.test.merge <- rbind(train.data.all, test.data.all)
train.test.merge$`Activity Name` <- factor(train.test.merge$`Activity Name`, 
                                           levels = activity.lables[,1], labels = activity.lables[,2])
train.test.merge <- melt(train.test.merge, id = c("subject", "Activity Name"))
tidydata.mean <- dcast(train.test.merge, subject + `Activity Name` ~ variable, fun = mean)
write.table(tidydata.mean,"tidydata.txt", row.names = FALSE, quote = FALSE)

