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

write.csv(human, "./data/human.csv", row.names = FALSE)

#Verify if the data was saved/read correctly
verify <- read.csv("./data/human.csv")
str(verify)
head(verify)

