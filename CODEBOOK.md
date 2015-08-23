
<h2>CODE BOOK</h2>

<h3>1. RAW DATA INFORMATION </h3>
The raw data to produced the tidy dataset was obtained from:
<br>
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
<br>
In particular the following data sets were used:
<br>
features.txt This are the names for the variables measures
<br>
activity_labels.txt ### The labels 

<h5>TEST DATA</h5>
subject_test.txt ### Subject Identifier
<br>
X_test.txt ### Variable
<br>
Y_test.txt
<h5>TRAIN DATA</h5>
subject_train.txt
<br>
X_train.txt
<br>
Y_train.txt

<h3>2. DATA PROCESSING DESCRIPTION</h3>
The data preparation included performing row merges (rbind) between 
X_train and X_test, Y_train and Y_test and the subject_train and subject_test respectively. Thereafter code was used to identify the measures that contained  standard deviation or mean labels and the X dataset was subselected so it would contain only these columns of measurements. Then the feature names were modified to get rid of parentheses commas and dashes. Feature names were assigend to its corresponding measurement column in the modified X dataset. The activity labels file was used to rename the the rowbinded new Y dataset. Thereafter the new X,Y and  subject datasets were combined into a dataframe. Finally, the functionaggregate was used to obtain the mean per subject per activity.

<h3>3. VARIABLE NAMES AND DETAILS</h3>
<br>
<h5>TYPE</h5>
The variable created to indicate the origin of the training or test dataset. 
<br>
TEST=Data formerly from the TEST datasets
<br>
TRAIN=Data formerly from the TRAIN datasets

<h5>ACTIVITY</h5>

LAYING=Person was laying,
<br>
SITTING=Person was sitting,
<br>
STANDING=Person was standing,
<br>
WALKING=Person was walking,     
WALKING_DOWNSTAIRS=Person was walking downstair,
<br>
WALKING_UPSTAIRS=Person was walking upstairs)

<h5>FEATURES CODE </h5>
The variables correspond to the standard
deviation and mean for different measured variables.
The data units were normalized between 
-1 to 1 and uniteless. The variable names 
were reformatted. The reformated names and their corresponding
original names can be found.
<br>
<br>
TBODYACC_MEAN_X=tBodyAcc-mean()-X,                    
TBODYACC_MEAN_Y=tBodyAcc-mean()-Y,                    
TBODYACC_MEAN_Z=tBodyAcc-mean()-Z,                    
TBODYACC_STD_X=tBodyAcc-std()-X,                      
TBODYACC_STD_Y=tBodyAcc-std()-Y,                      
TBODYACC_STD_Z=tBodyAcc-std()-Z,                      
TGRAVITYACC_MEAN_X=tGravityAcc-mean()-X,              
TGRAVITYACC_MEAN_Y=tGravityAcc-mean()-Y,              
TGRAVITYACC_MEAN_Z=tGravityAcc-mean()-Z,              
TGRAVITYACC_STD_X=tGravityAcc-std()-X,                
TGRAVITYACC_STD_Y=tGravityAcc-std()-Y,                
TGRAVITYACC_STD_Z=tGravityAcc-std()-Z,                
TBODYACCJERK_MEAN_X=tBodyAccJerk-mean()-X,            
TBODYACCJERK_MEAN_Y=tBodyAccJerk-mean()-Y,            
TBODYACCJERK_MEAN_Z=tBodyAccJerk-mean()-Z,            
TBODYACCJERK_STD_X=tBodyAccJerk-std()-X,              
TBODYACCJERK_STD_Y=tBodyAccJerk-std()-Y,              
TBODYACCJERK_STD_Z=tBodyAccJerk-std()-Z,              
TBODYGYRO_MEAN_X=tBodyGyro-mean()-X,                  
TBODYGYRO_MEAN_Y=tBodyGyro-mean()-Y,                  
TBODYGYRO_MEAN_Z=tBodyGyro-mean()-Z,                  
TBODYGYRO_STD_X=tBodyGyro-std()-X,                    
TBODYGYRO_STD_Y=tBodyGyro-std()-Y,                    
TBODYGYRO_STD_Z=tBodyGyro-std()-Z,                    
TBODYGYROJERK_MEAN_X=tBodyGyroJerk-mean()-X,          
TBODYGYROJERK_MEAN_Y=tBodyGyroJerk-mean()-Y,          
TBODYGYROJERK_MEAN_Z=tBodyGyroJerk-mean()-Z,          
TBODYGYROJERK_STD_X=tBodyGyroJerk-std()-X,            
TBODYGYROJERK_STD_Y=tBodyGyroJerk-std()-Y,            
TBODYGYROJERK_STD_Z=tBodyGyroJerk-std()-Z,            
TBODYACCMAG_MEAN=tBodyAccMag-mean(),                  
TBODYACCMAG_STD=tBodyAccMag-std(),                    
TGRAVITYACCMAG_MEAN=tGravityAccMag-mean(),            
TGRAVITYACCMAG_STD=tGravityAccMag-std(),              
TBODYACCJERKMAG_MEAN=tBodyAccJerkMag-mean(),          
TBODYACCJERKMAG_STD=tBodyAccJerkMag-std(),            
TBODYGYROMAG_MEAN=tBodyGyroMag-mean(),                
TBODYGYROMAG_STD=tBodyGyroMag-std(),                  
TBODYGYROJERKMAG_MEAN=tBodyGyroJerkMag-mean(),        
TBODYGYROJERKMAG_STD=tBodyGyroJerkMag-std(),          
FBODYACC_MEAN_X=fBodyAcc-mean()-X,                    
FBODYACC_MEAN_Y=fBodyAcc-mean()-Y,                    
FBODYACC_MEAN_Z=fBodyAcc-mean()-Z,                    
FBODYACC_STD_X=fBodyAcc-std()-X,                      
FBODYACC_STD_Y=fBodyAcc-std()-Y,                      
FBODYACC_STD_Z=fBodyAcc-std()-Z,                      
FBODYACCJERK_MEAN_X=fBodyAccJerk-mean()-X,            
FBODYACCJERK_MEAN_Y=fBodyAccJerk-mean()-Y,            
FBODYACCJERK_MEAN_Z=fBodyAccJerk-mean()-Z,            
FBODYACCJERK_STD_X=fBodyAccJerk-std()-X,              
FBODYACCJERK_STD_Y=fBodyAccJerk-std()-Y,              
FBODYACCJERK_STD_Z=fBodyAccJerk-std()-Z,              
FBODYGYRO_MEAN_X=fBodyGyro-mean()-X,                  
FBODYGYRO_MEAN_Y=fBodyGyro-mean()-Y,                  
FBODYGYRO_MEAN_Z=fBodyGyro-mean()-Z,                  
FBODYGYRO_STD_X=fBodyGyro-std()-X,                    
FBODYGYRO_STD_Y=fBodyGyro-std()-Y,                    
FBODYGYRO_STD_Z=fBodyGyro-std()-Z,                    
FBODYACCMAG_MEAN=fBodyAccMag-mean(),                  
FBODYACCMAG_STD=fBodyAccMag-std(),                    
FBODYBODYACCJERKMAG_MEAN=fBodyBodyAccJerkMag-mean(),  
FBODYBODYACCJERKMAG_STD=fBodyBodyAccJerkMag-std(),    
FBODYBODYGYROMAG_MEAN=fBodyBodyGyroMag-mean(),        
FBODYBODYGYROMAG_STD=fBodyBodyGyroMag-std(),          
FBODYBODYGYROJERKMAG_MEAN=fBodyBodyGyroJerkMag-mean(),
FBODYBODYGYROJERKMAG_STD=fBodyBodyGyroJerkMag-std())
