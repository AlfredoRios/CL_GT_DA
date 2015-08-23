#####################################
######### PRELIMINARIES #############
#####################################

library(plyr)
library(data.table)


#####################################
#########   Loading Data ############
#####################################

### GENERAL DATA
setwd("~/Documents/coursera/GettClDat/CourseProject/")
feat=read.table("features.txt")
act_lab=read.table("activity_labels.txt")

#### TEST DATA
setwd("~/Documents/coursera/GettClDat/CourseProject/test")
subj_test=read.table("subject_test.txt")
variables_test=read.table("X_test.txt")

#### TRAIN DATA
activity_test=read.table("Y_test.txt")
setwd("~/Documents/coursera/GettClDat/CourseProject/train")
subj_train=read.table("subject_train.txt")
variables_train=read.table("X_train.txt")
activity_train=read.table("Y_train.txt")

#### MERGING AND LABELING THE FEATURES DATASET

X=data.frame(rbind(variables_train,variables_test)) ### Merging Train and Test data sets

### Here we are selecting the means and standard deviations
### from the features also assinging better names by getting
### rid of the commas, parentheses and dashes.

rows=numeric(0) 
m_sd=character(0)
code_meaning=character(0)
i=1
for(n in 1:length(feat$V2)){
  test=strsplit(as.character(feat$V2)[n],"-")[[1]][2]
  if(test%in%c("mean()","std()")){
    code_meaning[i]=as.character(feat$V2)[n]
    temp=as.character(feat$V2)[n]
    temp=gsub("\\(","",temp)
    temp=gsub(")","",temp)
    temp=gsub(",","_",temp)
    temp=gsub("-","_",temp)
    m_sd[i]=toupper(temp)
    rows[i]=n
    i=i+1
  }
}

X=X[,rows] ## selecting the sd and mean rows
colnames(X)=m_sd ## Assigning the new names 

#### MERGING ACTIVITY DATASET AND ASSIGNING THE LABELS

act_lab_a=as.character(c(activity_train$V1,activity_test$V1))
act_lab_c=revalue(act_lab_a,c(
  "1"=as.character(act_lab$V2[1]),
  "2"=as.character(act_lab$V2[2]),
  "3"=as.character(act_lab$V2[3]),
  "4"=as.character(act_lab$V2[4]),
  "5"=as.character(act_lab$V2[5]),
  "6"=as.character(act_lab$V2[6])))

Y=data.frame(ACTIVITY=act_lab_c)
             
##### MERGING THE SUBJECT DATA SET 

S=data.frame(SUBJECT=as.factor(c(as.numeric(subj_train$V1),as.numeric(subj_test$V1))))

#### ASSINGING THE ORIGIN OF THE DATA SET TRAIN OR TEST

TYPE=c(
  rep("TRAIN",length(subj_train$V1)),
  rep("TEST",length(subj_test$V1))
               )

DATA=data.frame(TYPE,S,Y,X)
GROUP=paste(DATA$SUBJECT,DATA$ACTIVITY,DATA$TYPE,sep="-") ## creating and identifier
DATA=data.frame(GROUP,DATA)

### HERE WE ARE AGGREGATING THE VARIABLES BY GROUP USING THE DATA data frame

DATA_TEMP <- aggregate(x = DATA[, 5:ncol(DATA)],
                       by = list(ID = DATA$GROUP), FUN = "mean", na.rm = T)

### NOW WE SPLIT GROUP TO RECUPERATE THE THREE VARIABLES THAT WERE PASTED
DATA_TEMP2=c(data.frame(matrix(unlist(strsplit(as.character(DATA_TEMP$ID),"-")),
                               nrow=180,byrow=T)))

SUBJECT=as.character(DATA_TEMP2$X1)
ACTV=as.character(DATA_TEMP2$X2)
TYPE=as.character(DATA_TEMP2$X3)

### CREATING THE FINAL DATA SET

TYDY_DATA=data.frame(SUBJECT,ACTV,TYPE,DATA_TEMP[,-1])

### WRITING TO A CSV file

setwd("~/Documents/coursera/GettClDat/CourseProject/")
write.table(TIDY_DATA,file="TYDY_DATA.txt",row.names=FALSE)

### CHECKING THE DATA SET
check=read.table("TIDY_DATA.txt",head=T)
head(check)






                 
                 
  
  

  