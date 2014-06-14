run_analysis<-function(){
  ## Load the data.table package
  
  library(data.table)
  
  ## Check if zip file exists. If not download it and unzip it in the working directory
  
  if(!file.exists("getdata_projectfiles_UCI HAR Dataset.zip")){
    fileUrl<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileUrl,destfile="getdata_projectfiles_UCI HAR Dataset.zip",mode="wb")
    unzip("getdata_projectfiles_UCI HAR Dataset.zip")
  }
  
  ## Set the values of the various files to create a clean data set
  
  testsubjects<-"UCI HAR Dataset/test/subject_test.txt"
  testactivities<-"UCI HAR Dataset/test/y_test.txt"
  testdata<-"UCI HAR Dataset/test/X_test.txt"
  trainsubjects<-"UCI HAR Dataset/train/subject_train.txt"
  trainactivities<-"UCI HAR Dataset/train/y_train.txt"
  traindata<-"UCI HAR Dataset/train/X_train.txt"
  
  ## Create a data.table for both the test and train data sets including
  ## columns for the Subjects, Activities and the first 6 data columns 
  ## of the X, Y & Z mean and standard deviations
  
  testtable<-data.table(S=read.table(testsubjects),A=read.table(testactivities),{d<-read.table(testdata);d[,1:6]})
  traintable<-data.table(S=read.table(trainsubjects),A=read.table(trainactivities),{d<-read.table(traindata);d[,1:6]})
  
  ## Combine both test and train data.tables into one data.table named "dattable"
  
  dattable<-unique(rbind(testtable, traintable))
  
  ## Rename the columns with meaningful headings
  
  setnames(dattable,c("S.V1","A.V1","V1","V2","V3","V4","V5","V6"),c("Subject","Activity","Mean_X","Mean_Y","Mean_Z","StdDev_X","StdDev_Y","StdDev_Z"))
  
  ## Load the activity labels table and rename the columns ensuring the column 
  ## name of the activity indexes matches the name in "dattable"
  
  acttable<-data.table(read.table("UCI HAR Dataset/activity_labels.txt"))
  setnames(acttable,c("V1","V2"),c("Activity","Activity_Desc"))
  
  ## Merge the "dattable" with the "acttable" based on the activity indexes 
  ## into the "result" data.table, sort the table by Subject then by 
  ## Activity, reorder the columns, remove the no longer needed activity
  ## indexes and set the key values
  
  result<-merge(dattable,acttable,by="Activity")
  result<-result[order(Subject,Activity)]
  result<-setcolorder(result,c(2,9,3,4,5,6,7,8,1))
  result$Activity<-NULL
  setkeyv(result,c("Subject","Activity_Desc"))
  
  ## Write/overwrite the resulting clean data set to a comma separated values (csv) file.
  
  write.csv(result,file="resultdata.csv")
  
  ## Create summary data.table of averages by Subject and Activity
  
  summary<-result[,list(AvgMean_X=mean(Mean_X),AvgMean_Y=mean(Mean_Y),AvgMean_Z=mean(Mean_Z),AvgSD_X=mean(StdDev_X),AvgSD_Y=mean(StdDev_Y),AvgSD_Z=mean(StdDev_Z)),by=c("Subject","Activity_Desc")]
  
  ## Write/overwrite the summary data to a separate csv file
  
  write.csv(summary,file="datasummary.csv")
}