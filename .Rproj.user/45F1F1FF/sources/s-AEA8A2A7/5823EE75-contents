#Antti Salopuro
#18.11.2018 
#This file is the result of the week 3 of course Introduction to Open Data Science 2018
#data source: https://archive.ics.uci.edu/ml/machine-learning-databases/00320/

#3. Read both student-mat.csv and student-por.csv into R (from the data folder) and explore the structure 
#and dimensions of the data. (1 point)
math <- read.csv("./data/student-mat.csv",sep=";")
por <- read.csv("./data/student-por.csv", sep=";")

colnames(math)
colnames(por)

#4. Join the two data sets using the variables "school", "sex", "age", "address", "famsize", 
#"Pstatus", "Medu", "Fedu", "Mjob", "Fjob", "reason", "nursery","internet" as (student) identifiers. 
#Keep only the students present in both data sets. Explore the structure and dimensions of the joined data. (1 point)

library(dplyr)
join_us <- c("school", "sex", "age", "address", "famsize", "Pstatus", "Medu", "Fedu", "Mjob", "Fjob", "reason", "nursery","internet")
math_por <- inner_join(math,por,by=join_us,suffix=c(".math", ".por"))

colnames(math_por)

#5. Either a) copy the solution from the DataCamp exercise The if-else structure to combine the 
#'duplicated' answers in the joined data, or b) write your own solution to achieve this task. (1 point)

# create a new data frame with only the joined columns
alc <- select(math_por, one_of(join_us))

# the columns in the datasets which were not used for joining the data
notjoined_columns <- colnames(math)[!colnames(math) %in% join_us]

# print out the columns not used for joining
notjoined_columns

# for every column name not used for joining...
for(column_name in notjoined_columns) {
  # select two columns from 'math_por' with the same original name
  two_columns <- select(math_por, starts_with(column_name))
  # select the first column vector of those two columns
  first_column <- select(two_columns, 1)[[1]]
  
  # if that first column vector is numeric...
  if(is.numeric(first_column)) {
    # take a rounded average of each row of the two columns and
    # add the resulting vector to the alc data frame
    alc[column_name] <- round(rowMeans(two_columns))
  } else { # else if it's not numeric...
    # add the first column vector to the alc data frame
    alc[column_name] <- first_column
  }
}

# glimpse at the new combined data
glimpse(alc)

#6. Take the average of the answers related to weekday and weekend alcohol 
#consumption to create a new column 'alc_use' to the joined data. Then use 
#'alc_use' to create a new logical column 'high_use' which is TRUE for students 
#for which 'alc_use' is greater than 2 (and FALSE otherwise). (1 point)
cols <- select(alc,one_of(c("Dalc","Walc")))
alc["alc_use"] <- rowMeans(cols)

library(ggplot2)
# initialize a plot of alcohol use
g1 <- ggplot(data = alc, aes(x = alc_use))

# define the plot as a bar plot and draw it
plot(g1 + geom_bar())

# define a new logical column 'high_use'
alc <- mutate(alc, high_use = alc_use > 2)

# initialize a plot of 'high_use'
g2 <- ggplot(data = alc, aes(x = high_use))

# draw a bar plot of high_use by sex
plot(g2 + geom_bar())

glimpse(alc)

write.csv(alc, "./data/alc_cons.csv", row.names = FALSE)

verify <- read.csv("./data/alc_cons.csv")
head(verify)