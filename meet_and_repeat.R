#Read data from URL to data frame
BPRS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/BPRS.txt", sep  =" ", header = T)
RATS <- read.table("https://raw.githubusercontent.com/KimmoVehkalahti/MABS/master/Examples/data/rats.txt", sep  ="\t", header = T)

# Look at the (column) names of BPRS
names(BPRS)

# Look at the (column) names of RATS
names(RATS)

# Look at the structure of BPRS
str(BPRS)

# Look at the structure of RATS
str(RATS)

# Print out summaries of the variables
summary(BPRS)
summary(RATS)
# Access the packages dplyr and tidyr
library(dplyr)
library(tidyr)

# Factor treatment & subject BPRS
BPRS$treatment <- factor(BPRS$treatment)
BPRS$subject <- factor(BPRS$subject)

# Factor Group RATS
RATS$Group <- factor(RATS$Group)



# Convert to long form
BPRSL <-  BPRS %>% gather(key = weeks, value = bprs, -treatment, -subject)
RATSL <- RATS %>% gather(key = wds, value = rats, -ID, -Group)

# Extract the week number
BPRSL <-  BPRSL %>% mutate(week = as.integer(substr(weeks,5,5)))
# Extract the WD
RATSL <-  RATSL %>% mutate(wd = as.integer(substr(wds,3,4)))



# Take a glimpse at the BPRSL data
glimpse(BPRSL)
glimpse(RATSL)

write.csv(BPRSL, "./bprsl.csv", row.names = FALSE)
write.csv(RATSL, "./ratsl.csv", row.names = FALSE)
