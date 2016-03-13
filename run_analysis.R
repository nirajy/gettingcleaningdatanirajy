run_analysis <- function() {
        ## Step 1: Read and Label Data frames for training data
        x_train <- as.data.frame(readLines(paste0(getwd(),"/","UCI HAR Dataset/train/X_train.txt")), stringsAsFactors = FALSE)
        colnames(x_train) <- "measurements"
        y_train <- as.data.frame(readLines(paste0(getwd(),"/","UCI HAR Dataset/train/y_train.txt")))
        colnames(y_train) <- "activitylabel"
        subject_train <- as.data.frame(readLines(paste0(getwd(),"/","UCI HAR Dataset/train/subject_train.txt")))
        colnames(subject_train) <- "subject"
        
        ## Step 2: Read and label Data frames for test data
        x_test <- as.data.frame(readLines(paste0(getwd(),"/","UCI HAR Dataset/test/X_test.txt")), stringsAsFactors = FALSE)
        colnames(x_test) <- "measurements"
        y_test <- as.data.frame(readLines(paste0(getwd(),"/","UCI HAR Dataset/test/y_test.txt")))
        colnames(y_test) <- "activitylabel"
        subject_test <- as.data.frame(readLines(paste0(getwd(),"/","UCI HAR Dataset/test/subject_test.txt")))
        colnames(subject_test) <- "subject"
        
        # Step 3: Merge datasets
        X_total <- rbind(x_train, x_test)
        y_total <- rbind(y_train, y_test)
        subject_total <- rbind(subject_train, subject_test)
        
      
        #Step 4: Read Features from features.txt
        features <- as.data.frame(readLines(paste0(getwd(),"/","UCI HAR Dataset/features.txt")), stringsAsFactors = FALSE)
        colnames(features) <- "Feature"
        # Step 5: Extracts only the measurements which have mean or std 
        # Go through the features.txt, create a vector that contains mean and std
        meanStdFeatures <- grep("mean|std", features$Feature)
        
        # Step 6: Apply this filter to the dataframe to extract only the features required based on mean or std
        sepMeasurements <- sapply(X_total$measurements, function(elem) strsplit(elem, " ")) # Returns a list of character vectors
        sepMeasurements <- lapply(sepMeasurements, function(elem) as.numeric(elem)) # Convert resulting vectors into numerics
        sepMeasurements <- lapply(sepMeasurements, function(elem) elem[complete.cases(elem)]) # Filter on complete cases
        sepMeasurements <- lapply(sepMeasurements, function(elem) elem[meanStdFeatures]) # And only keep the elements whose index matches those in meanStdFeatures
        
        # Step 7:Combine\Merge X data(filtered for mean and Std features), SUbject and Y
        tidy_data <- cbind(t(as.data.frame(sepMeasurements)),subject_total,y_total)
        
        # Step 8: Get data from activity_labels.txt
        activitiesDF <- as.data.frame(readLines(paste0(getwd(),"/","UCI HAR Dataset/activity_labels.txt")), stringsAsFactors = FALSE)
        activitiesVec <- as.data.frame(sapply(strsplit(activitiesDF[,1], " "), function(elem) return(sub("_","",elem[2]))))
        activitiesVec <- cbind(1:6, activitiesVec)
        colnames(activitiesVec) <- c("activitylabel", "activitydetail")
        
        #Step 9: Merge Activity label with data so that it will replace labels with actual Activity details\string
        tidy_data <- merge(data, activitiesVec, by = "activitylabel")
       
        
        # step 10 - Appropriately labels the data set with descriptive variable names.
        # replace short word\abbreviation with full word
        filtered_feature_names <- features[[1]][meanStdFeatures] ##Only read mean\std features
        filtered_feature_names <- gsub("\\(\\)", "", filtered_feature_names)## remove ()
        filtered_feature_names <- gsub("Acc", "-acceleration", filtered_feature_names) ##replace Acc with -acceleration
        filtered_feature_names <- gsub("std", "-standarddeviation", filtered_feature_names) ## replace -std with -standarddeviation
        filtered_feature_names <- gsub("Mag", "-Magnitude", filtered_feature_names) ## replace Mag with -Magnitude
        filtered_feature_names <- gsub("(Jerk|Gyro)", "-\\1", filtered_feature_names)## add seperator before Jerk or Gyro 
        filtered_feature_names <- gsub("BodyBody", "Body", filtered_feature_names)## replace BodyBody with Body
        filtered_feature_names <- tolower(filtered_feature_names) #To lower case
        filtered_feature_names <- gsub("^[0-9]* ","",filtered_feature_names)#replace initial label
        # Step 11: assign names to features
        names(tidy_data) <- c(filtered_feature_names,"Subject","Activity")
        
        #Step 12: Create List of Features
        featuresVec <- as.data.frame(sapply(strsplit(filtered_feature_names, " "), function(elem) return(elem[2])))
        featuresVec <- cbind(1:nrow(featuresVec), featuresVec)
       
        # Save the data into the file
        write.table(tidy_data, file="tidy_data.txt", row.name=FALSE)
        
        #Write List of Features for Tidy Data. This is for Codebook
        names(featuresVec) <- c("Label","Feature Detail")
        write.table(featuresVec, file="Features.txt",row.names = FALSE)
        
        #Write List of Activities for Tidy Data. This is for Codebook
        names(activitiesVec) <- c("Label","Activity Detail")
        write.table(activitiesVec, file="ActivitiesDetails.txt",row.names = FALSE)
        
}