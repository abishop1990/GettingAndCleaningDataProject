# Read in all the data
features       <- read.table('UCI HAR Dataset/features.txt',            header=FALSE)
activityLabels <- read.table('UCI HAR Dataset/activity_labels.txt',     header=FALSE) 
subjectTrain   <- read.table('UCI HAR Dataset/train/subject_train.txt', header=FALSE)
xTrain         <- read.table('UCI HAR Dataset/train/x_train.txt',       header=FALSE)
yTrain         <- read.table('UCI HAR Dataset/train/y_train.txt',       header=FALSE)
subjectTest    <- read.table('UCI HAR Dataset/test/subject_test.txt',   header=FALSE)
xTest          <- read.table('UCI HAR Dataset/test/x_test.txt',         header=FALSE)
yTest          <- read.table('UCI HAR Dataset/test/y_test.txt',         header=FALSE)

# Merge the training and the test sets to create one data set
xData       <- rbind(xTrain, xTest)
yData       <- rbind(yTrain, yTest)
subjectData <- rbind(subjectTrain, subjectTest)

# Extracts only the measurements on the mean and standard deviation for each measurement
meanAndSTDOnly <- grep("-(mean|std)\\(\\)", features[ , 2])
xData <- xData[ , meanAndSTDOnly]

# Appropriately label the data set with descriptive variable names.
names(xData)       <- features[meanAndSTDOnly, 2]
names(yData)       <- "Activity"
names(subjectData) <- "SubjectId"

# Create final data set
yData[, 1] <- activityLabels[yData[, 1], 2]
dataSet <- cbind(xData, yData, subjectData)



# From the data set creates a second, independent tidy data set with the average of each 
# variable for each activity and each subject.
tidyDataSet <- aggregate(. ~SubjectId + Activity, dataSet, mean)
tidyDataSet <- tidyDataSet[order(tidyDataSet$SubjectId, tidyDataSet$Activity),]
write.table(tidyDataSet, 'tidyData.txt', row.names=FALSE)