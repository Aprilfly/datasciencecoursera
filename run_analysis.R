run_analysis<-function(){

  install.packages("plyr")
  library("plyr"
  ##Import the testing data,including the file of 'subject_test.txt','X_test.txt','y_test.txt'
  setwd("E:/Cousera-Data Science/DataClean_finalProject/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test")
  ##Store the corresponding data into the variable of 'subject_test','X_test','y_test'
  subject_test<-read.table("E:/Cousera-Data Science/DataClean_finalProject/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/subject_test.txt")
  X_test<-read.table("E:/Cousera-Data Science/DataClean_finalProject/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/X_test.txt")
  y_test<-read.table("E:/Cousera-Data Science/DataClean_finalProject/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/y_test.txt")
  
  ##Import the trainning data, including the file of 'subject_train.txt','X_train.txt','y_train.txt'
  setwd("E:/Cousera-Data Science/DataClean_finalProject/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/test/Inertial Signals")
  ##Store the corresponding data into the variable of 'subject_train','X_train','y_train'
  subject_train<-read.table("E:/Cousera-Data Science/DataClean_finalProject/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/subject_train.txt")
  X_train<-read.table("E:/Cousera-Data Science/DataClean_finalProject/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/X_train.txt")
  y_train<-read.table("E:/Cousera-Data Science/DataClean_finalProject/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/train/y_train.txt")
  
  ##Read the features, which is used to name the variables
  setwd("E:/Cousera-Data Science/DataClean_finalProject/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset")
  features<-read.table("E:/Cousera-Data Science/DataClean_finalProject/getdata-projectfiles-UCI HAR Dataset/UCI HAR Dataset/features.txt")
  
  ##add a new column named by 'indx' for each data frame to index them
  indx_sub_test<-data.frame(indx=1:2947,subject_test=subject_test)
  indx_X_test<-data.frame(indx=1:2947,X_test=X_test)
  indx_y_test<-data.frame(indx=1:2947,y_test=y_test)
  ##merge the data frame of "indx","subject_test","X_test","y_test" together
  ##the testing data is stored in the variable of 'test'
  test<-merge(indx_sub_test,indx_X_test,by="indx")
  test<-merge(test,indx_y_test,by="indx")
  
  ##add a new column named by 'indx' for each data frame to index them
  indx_sub_train<-data.frame(indx=1:7352,subject_train=subject_train)
  indx_X_train<-data.frame(indx=1:7352,X_train=X_train)
  indx_y_train<-data.frame(indx=1:7352,y_test=y_train)
  ##merge the data frame of "indx","subject_train","X_train","y_train" together
  ##the trainning data is stored in the variable of 'train'
  train<-merge(indx_sub_train,indx_X_train,by="indx")
  train<-merge(train,indx_y_train,by="indx")
  
  ##name  each variable in the testing and training data with appropriate labels respectively
  name<-c("indx","subject",as.vector(features$V2,mode="character"),"activity")
  colnames(test)<-name
  colnames(train)<-name
  
  ## merge two dataset-'test' and 'train' together with the common column names
  ## store the merged result in the variable 'merge'
  merge<-rbind2(test,train)
  
  ##Extract only the measurements on the mean and standard deviation for each measurment
  mean_std<-merge[,grepl("mean|std|indx|subject|activity",names(merge))]
  
  ##Uses descriptive activity names to name the activities in the data set
  mean_std[82]$activity[mean_std[82]$activity==5]<-"Standing"
  mean_std[82]$activity[mean_std[82]$activity==4]<-"Sitting"
  mean_std[82]$activity[mean_std[82]$activity==3]<-"Walking-downstairs"
  mean_std[82]$activity[mean_std[82]$activity==2]<-"Walking-upstairs"
  mean_std[82]$activity[mean_std[82]$activity==1]<-"Walking"
  mean_std[82]$activity[mean_std[82]$activity==6]<-"Laying"
  
  ##obtain the average of each measurements by each activities and each subjects
  result<-ddply(mean_std[2:82],.(subject,activity),colwise(mean))
  write.table(result,"E:/Cousera-Data Science/DataClean_finalProject/result.txt")
  
  result
  
  
  
}
