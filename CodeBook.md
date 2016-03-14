## Steps of Data Transformation
## Step 1: Read and Label Data frames for training data
## Step 2: Read and label Data frames for test data
## Step 3: Merge datasets
## Step 4: Read Features from features.txt
# Step 5: Extracts only the measurements which have mean or std 
   ##Go through the features.txt, create a vector that contains mean and std
## Step 6: Apply this filter to the dataframe to extract only the features required based on mean or std
## Step 7:Combine\Merge X data(filtered for mean and Std features), SUbject and Y
## Step 8: Get data from activity_labels.txt
## Step 9: Merge Activity label with data so that it will replace labels with actual Activity details\string
## step 10 - Appropriately labels the data set with descriptive variable names.
  ##replace short word\abbreviation with full word
## Step 11: assign names to features
## Step 12:  Save the data into the file
  ##Write List of Features for Tidy Data. This is for Codebook
  #Write List of Activities for Tidy Data. This is for Codebook
  
## Activities:
"Label" "Activity Detail"
1   "WALKING"
2  "WALKINGUPSTAIRS"
3   "WALKINGDOWNSTAIRS"
4   "SITTING"
5  "STANDING"
6   "LAYING"

##Feature Details
"Label" "Feature Detail"
1 "tBody-acceleration-mean-X"
2 "tBody-acceleration-mean-Y"
3 "tBody-acceleration-mean-Z"
4 "tBody-acceleration--standarddeviation-X"
5 "tBody-acceleration--standarddeviation-Y"
6 "tBody-acceleration--standarddeviation-Z"
7 "tGravity-acceleration-mean-X"
8 "tGravity-acceleration-mean-Y"
9 "tGravity-acceleration-mean-Z"
10 "tGravity-acceleration--standarddeviation-X"
11 "tGravity-acceleration--standarddeviation-Y"
12 "tGravity-acceleration--standarddeviation-Z"
13 "tBody-acceleration-Jerk-mean-X"
14 "tBody-acceleration-Jerk-mean-Y"
15 "tBody-acceleration-Jerk-mean-Z"
16 "tBody-acceleration-Jerk--standarddeviation-X"
17 "tBody-acceleration-Jerk--standarddeviation-Y"
18 "tBody-acceleration-Jerk--standarddeviation-Z"
19 "tBody-Gyro-mean-X"
20 "tBody-Gyro-mean-Y"
21 "tBody-Gyro-mean-Z"
22 "tBody-Gyro--standarddeviation-X"
23 "tBody-Gyro--standarddeviation-Y"
24 "tBody-Gyro--standarddeviation-Z"
25 "tBody-Gyro-Jerk-mean-X"
26 "tBody-Gyro-Jerk-mean-Y"
27 "tBody-Gyro-Jerk-mean-Z"
28 "tBody-Gyro-Jerk--standarddeviation-X"
29 "tBody-Gyro-Jerk--standarddeviation-Y"
30 "tBody-Gyro-Jerk--standarddeviation-Z"
31 "tBody-acceleration-Magnitude-mean"
32 "tBody-acceleration-Magnitude--standarddeviation"
33 "tGravity-acceleration-Magnitude-mean"
34 "tGravity-acceleration-Magnitude--standarddeviation"
35 "tBody-acceleration-Jerk-Magnitude-mean"
36 "tBody-acceleration-Jerk-Magnitude--standarddeviation"
37 "tBody-Gyro-Magnitude-mean"
38 "tBody-Gyro-Magnitude--standarddeviation"
39 "tBody-Gyro-Jerk-Magnitude-mean"
40 "tBody-Gyro-Jerk-Magnitude--standarddeviation"
41 "fBody-acceleration-mean-X"
42 "fBody-acceleration-mean-Y"
43 "fBody-acceleration-mean-Z"
44 "fBody-acceleration--standarddeviation-X"
45 "fBody-acceleration--standarddeviation-Y"
46 "fBody-acceleration--standarddeviation-Z"
47 "fBody-acceleration-meanFreq-X"
48 "fBody-acceleration-meanFreq-Y"
49 "fBody-acceleration-meanFreq-Z"
50 "fBody-acceleration-Jerk-mean-X"
51 "fBody-acceleration-Jerk-mean-Y"
52 "fBody-acceleration-Jerk-mean-Z"
53 "fBody-acceleration-Jerk--standarddeviation-X"
54 "fBody-acceleration-Jerk--standarddeviation-Y"
55 "fBody-acceleration-Jerk--standarddeviation-Z"
56 "fBody-acceleration-Jerk-meanFreq-X"
57 "fBody-acceleration-Jerk-meanFreq-Y"
58 "fBody-acceleration-Jerk-meanFreq-Z"
59 "fBody-Gyro-mean-X"
60 "fBody-Gyro-mean-Y"
61 "fBody-Gyro-mean-Z"
62 "fBody-Gyro--standarddeviation-X"
63 "fBody-Gyro--standarddeviation-Y"
64 "fBody-Gyro--standarddeviation-Z"
65 "fBody-Gyro-meanFreq-X"
66 "fBody-Gyro-meanFreq-Y"
67 "fBody-Gyro-meanFreq-Z"
68 "fBody-acceleration-Magnitude-mean"
69 "fBody-acceleration-Magnitude--standarddeviation"
70 "fBody-acceleration-Magnitude-meanFreq"
71 "fBody-acceleration-Jerk-Magnitude-mean"
72 "fBody-acceleration-Jerk-Magnitude--standarddeviation"
73 "fBody-acceleration-Jerk-Magnitude-meanFreq"
74 "fBody-Gyro-Magnitude-mean"
75 "fBody-Gyro-Magnitude--standarddeviation"
76 "fBody-Gyro-Magnitude-meanFreq"
77 "fBody-Gyro-Jerk-Magnitude-mean"
78 "fBody-Gyro-Jerk-Magnitude--standarddeviation"
79 "fBody-Gyro-Jerk-Magnitude-meanFreq"
