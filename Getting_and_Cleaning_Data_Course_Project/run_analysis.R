#to run the code I have to Set my Github repo as the Files Pane Location of R Studio. After, from 
#Session tab in RStudio, I have to click "Set Working Directory --> To Files Pane Location"

#OPEN the dplyr package
library(dplyr)

#STEP 1. Merges the training and the test sets to create one data set.

    #CREATION OF THE TRAIN DATA FRAME  
    
          #import train data 
          x_train<-read.table("./Samsung_Data/X_train.txt")
          activity_train<-read.table("./Samsung_Data/y_train.txt")
          subject_train<-read.table("./Samsung_Data/subject_train.txt")
          
          #change column names for activity/subject data
          colnames(activity_train)<-"activity"
          colnames(subject_train)<-"subject"
          
          #binding of x_train, activity_train and subject_train to obtain the complete data train   
          train<-bind_cols(x_train,activity_train,subject_train)
    
    
    #CREATION OF THE TEST DATA FRAME 
          
          #import train data 
          x_test<-read.table("./Samsung_Data/X_test.txt")
          activity_test<-read.table("./Samsung_Data/y_test.txt")
          subject_test<-read.table("./Samsung_Data/subject_test.txt")
          
          #change column names for activity/subject data
          colnames(activity_test)<-"activity"
          colnames(subject_test)<-"subject"
          
          #binding of x_train, activity_train and subject_train to obtain the complete data train   
          test<-bind_cols(x_test,activity_test,subject_test)
    
    #CREATION OF THE COMPLETE DATA SET BINDING THE ROWS OF TRAIN AND TEST
          
          data_set<-bind_rows(train,test)


# STEP 2. Extracts only the measurements on the mean and standard deviation for each measurement.

      #import of features file 
      features<-read.table("./Samsung_Data/features.txt")
      
      #selection of mean and std variables indexes
      mean_columns<-grep("mean",features$V2)
      std_columns<-grep("std",features$V2)
      
      #extractions of mean variables from the data_set
      data_mean<-data_set[,mean_columns]
      
      #extractions of std variables from the data_set
      data_std<-data_set[,std_columns]
      
      #extractions of activity and subject variables from the data_set
      data_activity_subject<-data_set[,c("activity","subject")]
      
      #creation of a new dataframe containg the mean, std, activity and subject columns,
      data_frame_mean_std<-bind_cols(data_mean,data_std,data_activity_subject)
      

# STEP 3. Uses descriptive activity names to name the activities in the data set
   
      
      #import of activity labels
      activity_labels<-read.table("./Samsung_Data/activity_labels.txt")
      
      #character useful transformation
      activity_labels$V1<-as.character(activity_labels$V1)
      activity_labels$V2<-as.character(activity_labels$V2)
      data_frame_mean_std$activity<-as.character(data_frame_mean_std$activity)
      
      #Renaming of each activity in the activity column of the dataframe
      for (i in 1:6) {
        data_frame_mean_std$activity<-sub(activity_labels[i,1],activity_labels[i,2],data_frame_mean_std$activity)
      }
      

# STEP 4. Appropriately labels the data set with descriptive variable names.      
      
      #extractions of mean column indexes
      mean_names<-as.character(features$V2[mean_columns])
      #renaming of column mean names
      colnames(data_frame_mean_std)[1:length(mean_columns)]<-mean_names
      
      #extractions of sdt column indexes
      std_names<-as.character(features$V2[std_columns])
      #renaming of column std names
      colnames(data_frame_mean_std)[length(mean_columns)+1:length(std_columns)]<-std_names
      
     
#STEP 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

      #grouping and summarizing to obtain the final data set using the chain
      final_data_set<-data_frame_mean_std %>% 
                            group_by(subject,activity) %>%
                                  summarize_all(mean)
      
      write.table(final_data_set,file="DATA_SET.txt",row.name=FALSE)