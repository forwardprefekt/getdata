# getdata

This data is based on: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Data link here: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Transformation included in run_analysis.R combines both test and train measurements, and extracts out on the measures that indicate mean or std. 

This data is aggregated by Subject and activity, and then the mean is derived and saved as tidy_mean_subset.csv.

working directory is assumed to be in the folder containing downloaded data.

