Code Book
========================================================
This code book describes the data extracted from the ["Human Activity Recognition using Smartphones Data Set"](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#). The raw data set and information about that data can be obtained at linked web site.

This data set merges the 3-axis mean and standard deviation body acceleration variables in both the training and test data sets into one comma separated values (csv) file named "resultdata.csv". A second csv file called "datasummary.csv" contains the averages of each variable by Subject and Activity.

The variables in the "resultdata.csv" include (acceleration = meters/second^2 ):
* Subject - a number for each on the 30 people that participated in generating either the test or training data set (range from 1 to 30)
* Activity_Desc - a description of the activity being performed including WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING
* Mean_X - mean time-domain body acceleration along the X axis (tBodyAcc-mean()-X)
* Mean_Y - mean time-domain body acceleration along the Y axis (tBodyAcc-mean()-Y)
* Mean_Z - mean time-domain body acceleration along the Z axis (tBodyAcc-mean()-Z)
* StdDev_X - standard deviation of the time-domain body acceleration along the X axis (tBodyAcc-std()-X)
* StdDev_Y - standard deviation of the time-domain body acceleration along the Y axis (tBodyAcc-std()-Y)
* StdDev_Z - standard deviation of the time-domain body acceleration along the Z axis (tBodyAcc-std()-Z)

The variables in the "datasummary.csv" include:
* Subject - a number for each on the 30 people that participated in generating either the test or training data set (range from 1 to 30)
* Activity_Desc - a description of the activity being performed including WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING or LAYING
* AvgMean_X - average by Subject and Activity of Mean_X
* AvgMean_Y - average by Subject and Activity of Mean_Y
* AvgMean_Z - average by Subject and Activity of Mean_Z
* AvgStdDev_X - average by Subject and Activity of StdDev_X
* AvgStdDev_Y - average by Subject and Activity of StdDev_Y
* AvgStdDev_Z - average by Subject and Activity of StdDev_Z
