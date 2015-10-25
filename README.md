This README file is one of the deliverables of Coursera's Getting and Cleaning Data course. It gives a summary of the R script, run_analysis.R

The script of run_analysis.R can be explained using the following steps:
1. Download the dataset if it does not already exist in the working directory
2. Loads the activity info
3. Loads the features info, keeping only the features reflecting a mean or standard deviation and cleans up the strings
3. Loads training and test datasets, keeping only the columns reflecting a mean or standard deviation
4. Merges the training and test datasets into one total dataset
5. Labels the columns and merges the activity names to the total dataset
6. Creates a tidy dataset consisting of the average value of each variable for each subject and each activity
7. Writes out the total dataset and the aggregated dataset (containing the averages) as .csv files

The aggregated dataset is shown in the file tidy_avgs.csv
