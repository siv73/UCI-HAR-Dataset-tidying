# Codebook for Dataset
1. The resultant data set contains the only the mean and standard deviation variables taken from the "features.txt" file
2. Activity Numbers are replaced with activity labels using the activity_labels.txt 
3. And the tidytext contains the mean for each descriptive activity such as "Walking" , "sleeping", etc.

Below are the explanations for each variable:

1. subject - contains an integer id for each subject in the study
2. Activity Name - contains a factor with levels for each activity type in the study (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)

3. Mean and standard deviation (std) for:

    tBodyAcc-XYZ
    
    tGravityAcc-XYZ
    
    tBodyAccJerk-XYZ
    
    tBodyGyro-XYZ
    
    tBodyGyroJerk-XYZ
    
    tBodyAccMag
    
    tGravityAccMag
    
    tBodyAccJerkMag
    
    tBodyGyroMag
    
    tBodyGyroJerkMag
    
    fBodyAcc-XYZ
    
    fBodyAccJerk-XYZ
    
    fBodyGyro-XYZ
    
    fBodyAccMag
    
    fBodyAccJerkMag
    
    fBodyGyroMag
    
    fBodyGyroJerkMag
