### the function of run_analysis() is to return the average of each variable for each activity and subject
## In order to run this function, make sure the working directory is set to the path of files to be read.

## read a series of dataset
## First read the dataset for test and trainning respectively
## For testing dataset, it includes the file of 'subject_test.txt','X_test.txt','y_test.txt'
## For trainning dataset, it includes the file of 'subject_train.txt','X_train.txt','y_train.txt'

## One more dataset need to be read is 'features.txt'

##Data Preprocess
##Merge the dataframe 'subject_test','X_test','y_test' together
##Merge the dataframe 'subject_train','X_train','y_train' together
 
##name  each variable in the testing and training data with appropriate labels respectively

## merge two dataset-'test' and 'train' together with the common column names
## store the merged result in the variable 'merge'

##Extract only the measurements on the mean and standard deviation for each measurment
##Store the extracted result in the variable 'mean_std'

##Uses descriptive activity names to name the activities in the data set

##obtain the average of each measurements by the factor of  activities
##store the result in the variable of 'aver_each_activity'

##obtain the average of each measuremnts by the factor of subjects
##store the result in the variable of 'aver_each_subject'

##store the 2 results together into the variable of 'result'
## the output is a data frame called 'output'
## the variable of 'output' is the return value
