#Antti Salopuro
#7.11.2018 
#This file is the result of the week 2 of course Introduction to Open Data Science 2018
#data source: http://www.helsinki.fi/~kvehkala/JYTmooc/JYTOPKYS3-data.txt

learning2014 <- read.delim("./data/JYTOPKYS3-data.txt")
dim(learning2014) #183 rows, 60 columns/features
colnames(learning2014) #grades from 56 courses + 4 descr. vars Age, Attitude, Points, gender
summary(learning2014)

#For function select
library(dplyr)

# questions related to deep, surface and strategic learning
deep_questions <- c("D03", "D11", "D19", "D27", "D07", "D14", "D22", "D30","D06",  "D15", "D23", "D31")
surface_questions <- c("SU02","SU10","SU18","SU26", "SU05","SU13","SU21","SU29","SU08","SU16","SU24","SU32")
strategic_questions <- c("ST01","ST09","ST17","ST25","ST04","ST12","ST20","ST28")

# select the columns related to deep learning and create column 'deep' by averaging
deep_columns <- select(learning2014, one_of(deep_questions))
learning2014$deep <- rowMeans(deep_columns)

# select the columns related to surface learning and create column 'surf' by averaging
surface_columns <- select(learning2014, one_of(surface_questions))
learning2014$surf <- rowMeans(surface_columns)

# select the columns related to strategic learning and create column 'stra' by averaging
strategic_columns <- select(learning2014, one_of(strategic_questions))
learning2014$stra <- rowMeans(strategic_columns)

#Drop rows with Points equal to zero
learning2014 <- filter(learning2014, Points > 0)

# Keep only these columns
keep_columns <- c("gender","Age","Attitude", "deep", "stra", "surf", "Points")

# select the 'keep_columns' to create a new dataset
learning2014 <- select(learning2014,one_of(keep_columns))

#see how it looks now
str(learning2014) 

#save the modified data into a csv file
#setwd would change the directory if necessary
write.csv(learning2014, "./data/learn14.csv", row.names = FALSE)

#Verify if the data was saved/read correctly
verify <- read.csv("./data/learn14.csv")
str(verify)
head(verify)

#Seems to be ok!