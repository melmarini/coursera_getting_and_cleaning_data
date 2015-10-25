The script of run_analysis.R writes out two datasets, tidy_total.csv and tidy_avgs.csv. Both are highlighted below.

Input of the scripts is data obtained from an experiment in which measurements were collected from the accelerometer and gyroscope from the Samsung Galaxy S smartphone used by 30 subjects carrying out a variety of 6 activities. More information about the measurements can be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Dataset "tidy_total.csv"

Here follows a description of what the datasets looks like:

- Subject
The variable subject is the subject number who performed an activity, there are 30 subjects in total.
	
- Activity
The variable activity is the activity performed by the subjects, there are six activities in total. The values below stand for:
1 = WALKING
2 = WALKING_UPSTAIRS
3 = WALKING_DOWNSTAIRS
4 = SITTING
5 = STANDING
6 = LAYING

- Variables
Only the measurements containing mean and standard deviations (79 variables) have been kept in the dataset. The feature names from the raw data have been rewritten to get tidier names.
- The prefix t is rewritten into time (time domain variable)
- The prefix f is rewritten into freq (frequency domain variable)
- The dashes and parentheses have been removed

Dataset "tidy_avg.csv"

This dataset contains the same columns as "tidy_total.csv". This dataset is obtained by aggregating the "tidy_total.csv" over subject and activity and calculating the mean for each variable.

See the README to get more detailed information about the script.
