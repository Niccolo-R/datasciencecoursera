# DATA_SET.txt Code Book

The file is obtained as a rehash starting from data collected by experiments (files in *Samsung_Data* directory). Tese experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. 

In the original data set, for each of the 30 partecipants there are many observations: for each partecipant there were collected many rows for all the activities tipology. For example, for the first subject volunteer there were some rows for WALKING, some other rows for WALKING_UPSTAIRS and so on.   

To built the current *DATA_SET.txt*, I extracted from the original data only the mean and standard deviation variables, and I compacted the data in order to obtain for each subject only a row for each activity. So, for example, for the first subject there is only one row for the WALKING activity (and only one row for the other activities) and the values of the variables in that row are obtained as the mean of all the variables originally collected from all the WALKING observations of the first subject. 

The first column of the *DATA_SET.txt" corresponds to the **subject** (total: 30 subjects) and the second to the **activity** (6 activities for each subject). The other columns are the mean and standard deviaton variables chosen from all the original variables. In the variables names, '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
