From the original data containing the test and training data, the run_analysis script does the following:

1. Combines the test and training x, y and subject files
2. Appends the activity names from the activity_labels.txt files
3. Strips away any x data (activity data) that is not a standard deviation or mean measurement
4. Combines these sets together
5. Appends the data together
6. Aggregates the mean value of each SubjectId, ActivityId pair
7. Orders the data on Activity ID and Subject ID
8. Outputs the new data into the tinyData.txt file

The fields in the data aside from the Activity Name and Subject ID all come from the activity_labels.txt file and a description
can be found in thea Readme file inside the UCI HAR Dataset directory. 
