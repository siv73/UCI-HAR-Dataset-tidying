# Tidying - "Human Activity Recognition Using Smartphones Data Set "
This data contains the R Script which will can be used to tidy the UCI HAR Dataset which was collected from the human acitivity data of Samsung Galaxy S smartphone.

# "Analysis.R" contains the below functionality:
  1. It first checks if the specific zip folders exists in the working directory or not, if not it will then download the data from the        source
  2. It then proceeds to unzip the data and then first loads the features and activity lables 
  3. Once that is done, using regular expressions it will look for the varibales names containing the words "mean" and "std" and then          fetches the indices of the variables
  4. We now load the train data for the 3 text files namely X_train.txt, Y_train.txt, subjtect_train.txt and then usign the result of the      above operation in point 3, it will only fetch the required variables and discards the rest.
  5. Same process is repeated for test data as well
  6. Once we get both the test and train data we then proceed to merge both the data sets and then we calculate the mean for each activity      for each subject for each columns
