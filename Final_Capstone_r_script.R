#prepare packages needed
install.packages("tidyverse")
library(readr)
library(dplyr)
#check working directory
getwd()
#read description of 1 test file
readLines(("~/Data Science/Springboard Course/Capstone Project/capstone-project/UCAS Data/Data/EOC_data_resource_2016-DR2_051_06.csv"), n = 3)
#create list of all files including extensions
allfiles <- list.files(path = "C:/Users/AnnaVaughan/Documents/Data Science/Springboard Course/Capstone Project/capstone-project/UCAS Data/Data")
#create list of all filenames without extensions
allfilenames <- substr(allfiles,1,33)
#limit list to only csv file filenames
allcsvfilenames <- allfilenames [1:285]
#try out reading a single csv file
testimport <- read_csv("~/Data Science/Springboard Course/Capstone Project/capstone-project/UCAS Data/Data/EOC_data_resource_2016-DR2_001_01.csv", col_names = TRUE, skip = 5)
#try importing file and creating filename for 1 file
names <-substr(filenames,1,33)EOC_data_resource_2016_DR3_027_03 <- read_csv("~/Data Science/Springboard Course/Capstone Project/capstone-project/UCAS Data/Data/EOC_data_resource_2016-DR3_027_03.csv", col_names = TRUE, skip = 5)
#after much trying out lapply and other functions, gave up and imported 3 files I knew were relevant
EOC_data_resource_2016_DR3_027_03 <- read_csv("~/Data Science/Springboard Course/Capstone Project/capstone-project/UCAS Data/Data/EOC_data_resource_2016-DR3_027_03.csv", col_names = TRUE, skip = 5)
View(EOC_data_resource_2016_DR3_027_03)  
EOC_data_resource_2016_DR3_018_03 <- read_csv("~/Data Science/Springboard Course/Capstone Project/capstone-project/UCAS Data/Data/EOC_data_resource_2016-DR3_018_03.csv", col_names = TRUE, skip = 5)
EOC_data_resource_2016_DR4_005_03 <- read_csv("~/Data Science/Springboard Course/Capstone Project/capstone-project/UCAS Data/Data/EOC_data_resource_2016-DR4_005_03.csv", col_names = TRUE, skip = 5)
#view files to check they had imported correctly
View(EOC_data_resource_2016_DR3_027_03)
View(EOC_data_resource_2016_DR3_018_03)
View(EOC_data_resource_2016_DR3_005_03)
#rename files to show their content
EOC_data_resource_2016_DR4_005_03_Provider_Domicile <- EOC_data_resource_2016_DR4_005_03
EOC_data_resource_2016_DR3_027_03_Subject_Domicile <- EOC_data_resource_2016_DR3_027_03
EOC_data_resource_2016_DR3_018_03_Subject_Age <- EOC_data_resource_2016_DR3_018_03
#view files to check rename had worked
View(EOC_data_resource_2016_DR4_005_03_Provider_Domicile)
View(EOC_data_resource_2016_DR4_027_03_Subject_Domicile)
View(EOC_data_resource_2016_DR3_018_03_Subject_Age)
#check imported files for NA values - whether there are any and if so how many
any(is.na(EOC_data_resource_2016_DR3_018_03_Subject_Age))
any(is.na(EOC_data_resource_2016_DR3_027_03_Subject_Domicile))
any(is.na(EOC_data_resource_2016_DR4_005_03_Provider_Domicile))
sum(is.na(EOC_data_resource_2016_DR4_005_03_Provider_Domicile))
sum(is.na(EOC_data_resource_2016_DR3_027_03_Subject_Domicile))
sum(is.na(EOC_data_resource_2016_DR3_018_03_Subject_Age))
#view summary of files
summary(EOC_data_resource_2016_DR3_018_03_Subject_Age)
summary(EOC_data_resource_2016_DR3_027_03_Subject_Domicile)
summary(EOC_data_resource_2016_DR4_005_03_Provider_Domicile)
#remove blank columns from files and rename
Provider_Domicile_EOC_data_resource_2016_DR4_005_03 <- select(EOC_data_resource_2016_DR4_005_03_Provider_Domicile, -X5)
View(Provider_Domicile_EOC_data_resource_2016_DR4_005_03)
Subject_Age_EOC_data_resource_2016_DR3_018_03 <- select(EOC_data_resource_2016_DR3_018_03_Subject_Age, -X5)
Subject_Domicile_EOC_data_resource_2016_DR3_027_03 <- select(EOC_data_resource_2016_DR3_027_03_Subject_Domicile, -X5)
View(Subject_Domicile_EOC_data_resource_2016_DR3_027_03)
#check new files for NA values
any(is.na(Provider_Domicile_EOC_data_resource_2016_DR4_005_03))
any(is.na(Subject_Age_EOC_data_resource_2016_DR3_018_03))
any(is.na(Subject_Domicile_EOC_data_resource_2016_DR3_027_03))
#view new files
View(Subject_Age_EOC_data_resource_2016_DR3_018_03)
View(Subject_Domicile_EOC_data_resource_2016_DR3_027_03)
View(Provider_Domicile_EOC_data_resource_2016_DR4_005_03)
#view summary of subject and age file to see columns included
summary(Subject_Age_EOC_data_resource_2016_DR3_018_03)
#check values by column to see whether any values that don't make sense or are outliers
unique(Subject_Age_EOC_data_resource_2016_DR3_018_03$`Age Band`)
unique(Subject_Age_EOC_data_resource_2016_DR3_018_03$`Subject Group (Detailed Level)`)
unique(Subject_Age_EOC_data_resource_2016_DR3_018_03$`Cycle Year`)
unique(Subject_Age_EOC_data_resource_2016_DR3_018_03$`Number of Applications`)
#view summary of subject and domicile file to see columns included
summary(Subject_Domicile_EOC_data_resource_2016_DR3_027_03)
#check values by column to see whether any values that don't make sense or are outliers
unique(Subject_Domicile_EOC_data_resource_2016_DR3_027_03$`Cycle Year`)
unique(Subject_Domicile_EOC_data_resource_2016_DR3_027_03$`Subject Group (Detailed Level)`)
unique(Subject_Domicile_EOC_data_resource_2016_DR3_027_03$`Applicant Domicile (Region)`)
#summary shows 'Unknown' as a category in Applicant Domicile, so check how many
summary(Subject_Domicile_EOC_data_resource_2016_DR3_027_03$`Applicant Domicile (Region)` == "'Unknown'")
#view summary of subject and domicile file to see columns included
summary(Provider_Domicile_EOC_data_resource_2016_DR4_005_03)
#check values by column to see whether any values that don't make sense or are outliers
unique(Provider_Domicile_EOC_data_resource_2016_DR4_005_03$`Cycle Year`)
unique(Provider_Domicile_EOC_data_resource_2016_DR4_005_03$`Provider Name`)
unique(Provider_Domicile_EOC_data_resource_2016_DR4_005_03$`Applicant Domicile (Region)`)
unique(Provider_Domicile_EOC_data_resource_2016_DR4_005_03$`Number of Applications`)
#summary shows 'Unknown' as a category in Applicant Domicile, so check how many
summary(Provider_Domicile_EOC_data_resource_2016_DR4_005_03$`Applicant Domicile (Region)` == "'Unknown'")
#view summary to check whether any titles or text needs further tidying
summary(Subject_Age_EOC_data_resource_2016_DR3_018_03)
#replace single quotes for fields where entries are all surrounded by them with nothing, viewing to check replacement has worked
Subject_Age_EOC_data_resource_2016_DR3_018_03$`Subject Group (Detailed Level)` <- gsub(pattern = "'", replacement = "", x = Subject_Age_EOC_data_resource_2016_DR3_018_03$`Subject Group (Detailed Level)`)
View(Subject_Age_EOC_data_resource_2016_DR3_018_03)
Subject_Age_EOC_data_resource_2016_DR3_018_03$`Age Band` <- gsub(pattern = "'", replacement = "", x = Subject_Age_EOC_data_resource_2016_DR3_018_03$`Age Band`)
View(Subject_Age_EOC_data_resource_2016_DR3_018_03)
Subject_Domicile_EOC_data_resource_2016_DR3_027_03$`Subject Group (Detailed Level)` <- gsub(pattern = "'", replacement = "", x = Subject_Domicile_EOC_data_resource_2016_DR3_027_03$`Subject Group (Detailed Level)`)
View(Subject_Domicile_EOC_data_resource_2016_DR3_027_03)
Subject_Domicile_EOC_data_resource_2016_DR3_027_03$`Applicant Domicile (Region)` <- gsub(pattern = "'", replacement = "", x = Subject_Domicile_EOC_data_resource_2016_DR3_027_03$`Applicant Domicile (Region)`)
View(Subject_Domicile_EOC_data_resource_2016_DR3_027_03)
Provider_Domicile_EOC_data_resource_2016_DR4_005_03$`Provider Name`<- gsub(pattern = "'", replacement = "", x = Provider_Domicile_EOC_data_resource_2016_DR4_005_03$`Provider Name`)
View(Provider_Domicile_EOC_data_resource_2016_DR4_005_03)
Provider_Domicile_EOC_data_resource_2016_DR4_005_03$`Applicant Domicile (Region)` <- gsub(pattern = "'", replacement = "", x = Provider_Domicile_EOC_data_resource_2016_DR4_005_03$`Applicant Domicile (Region)`)
View(Provider_Domicile_EOC_data_resource_2016_DR4_005_03)
#require 2016 data only for initial analysis, so check data class of that column
class(Subject_Domicile_EOC_data_resource_2016_DR3_027_03$`Cycle Year`)
#create data subset for subject by domicile only containing 2016 data
Subject_Domicile_2016 <- subset(Subject_Domicile_EOC_data_resource_2016_DR3_027_03, Subject_Domicile_EOC_data_resource_2016_DR3_027_03$`Cycle Year` == 2016)
#check subset has been created correctly
View (Subject_Domicile_2016)