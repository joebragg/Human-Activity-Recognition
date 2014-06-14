Read Me
========================================================
Please refer to the comments in the "run_analysis.R" script for details on how the raw data is manipulated into a clean data set.

In summary:
* the raw data is obtained from a copy of the "getdata_projectfiles_UCI HAR Dataset.zip" at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* the test and train data sets are imported into R data.tables along with corresponding subject and activities data
* the test and train data.tables are combined into one data.table
* the column headings are renamed with descriptive variable labels
* meaningful activity names are obtained by merging the activity labels with the combined data.table
* the records are sorted, columns reordered, key values set and now unnecessary activity indexes removed
* the "resultdata.csv"file is written
* averages of the mean and standard deviation data are calculated by Subject and Activity
* the "datasummary.csv" file is written