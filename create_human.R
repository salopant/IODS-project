# read the human data
#human <- read.table("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human1.txt", sep  =",", header = T)
library(plyr)
hd <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/human_development.csv", stringsAsFactors = F)
gii <- read.csv("http://s3.amazonaws.com/assets.datacamp.com/production/course_2218/datasets/gender_inequality.csv", stringsAsFactors = F, na.strings = "..")


# look at the (column) names of human
names(hd)

names(hd)[3] <- "HDI"
names(hd)[4] <- "LifeEx"
names(hd)[5] <- "ExpEduYrs"
names(hd)[6] <- "MeanEduYrs"
names(hd)[7] <- "GNI"
names(hd)[8] <- "GniHdiRankDiff"

names(gii)

names(gii)[3] <- "GII" 
names(gii)[4] <- "MaternMortR"
names(gii)[5] <- "AdoBirthR"
names(gii)[6] <- "PctReprParl"
names(gii)[7] <- "Edu2F"
names(gii)[8] <- "Edu2M"
names(gii)[9] <- "LabF"
names(gii)[10] <- "LabM"



# look at the structure of human
str(hd)
str(gii)

# print out summaries of the variables
summary(hd)
summary(gii)

#data described: http://hdr.undp.org/en/content/human-development-index-hdi

dim(hd)
dim(gii)

#Mutate the “Gender inequality” data and create two new variables. 
#The first one should be the ratio of Female and Male populations 
#with secondary education in each country. (i.e. edu2F / edu2M). 
#The second new variable should be the ratio of labour force 
#participation of females and males in each country (i.e. labF / labM). (1 point)

gii <- mutate(gii, EduFM = Edu2F / Edu2M)
gii <- mutate(gii, LabFM = LabF / LabM)

human <- join(hd,gii,by="Country",type="inner")
head(human)
dim(human)

# Week 5, data wrangling 
# access the stringr package
library(stringr)

# look at the structure of the GNI column in 'human'
str(human$GNI)

# remove the commas from GNI and print out a numeric version of it
human$GNI = str_replace(human$GNI, pattern=",", replace ="") %>% as.numeric()

# Keep only meaningful columns
keep <- c("Country", "Edu2F", "LabFM", "LifeEx", "ExpEduYrs", "GNI", "MaternMortR", "AdoBirthR", "PctReprParl")
# human with modified GNI and dplyr are available

# select the 'keep' columns
human <- select(human, one_of(keep))


# filter out all rows with NA values
human_ <- filter(human, complete.cases(human))

#drop rows where country name is not country but a continent or other region
# choose everything until the last 7 observations
human_ <- human_[1:last, ]

# add countries as rownames
rownames(human_) <- human_$Country
# remove the Country variable
#human_ <- select(human_, -Country)
head(human_)

write.csv(human_, "./data/human_mod.csv", row.names = FALSE)

#Verify if the data was saved/read correctly
verify <- read.csv("./data/human_mod.csv")
str(verify)
head(verify)

