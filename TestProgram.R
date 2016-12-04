### Download dataset from swiftkey repository


## Load CRAN modules 
library(downloader)
library(plyr);
library(dplyr)
library(knitr)
library(tm)

## Step 1: Download the dataset and unzip folder
## Check if directory already exists?
if(!file.exists("./projectData")){
  dir.create("./projectData")
}

Url <- "https://d396qusza40orc.cloudfront.net/dsscapstone/dataset/Coursera-SwiftKey.zip"

## Check if zip has already been downloaded in projectData directory?
if(!file.exists("./projectData/Coursera-SwiftKey.zip")){
  download.file(Url,destfile="./projectData/Coursera-SwiftKey.zip",mode = "wb")
}
## Check if zip has already been unzipped?
if(!file.exists("./projectData/final")){
  unzip(zipfile="./projectData/Coursera-SwiftKey.zip",exdir="./projectData")
}

# Once the dataset is downloaded start reading it as this a huge dataset so we'll read line by line only the amount of data needed
# before doing that lets first list all the files in the directory


## List all the files of /final/en_US Dataset folder
path <- file.path("./projectData/final" , "en_US")
files <- list.files(path, recursive=TRUE)


# Code for capastone quiz 1
# 1. The en_US.blogs.txt  file is how many megabytes?
file.size(paste(path,"en_US.blogs.txt",sep="/"))
# [1] 210160014 ~ 200 MB
# 2. The en_US.twitter.txt has how many lines of text?
# Step:
length(paste(path,lineTwitter,sep="/"))
## [1] 2,360,148

# 3. What is the length of the longest line seen in any of the three en_US data sets?

# FIRST READ IN THE LINES THEMSELVES

# Twitter data
con <- file("./projectData/final/en_US/en_US.twitter.txt", "r")
lineTwitter <- readLines(con)
longTwitter<-length(lineTwitter)
close(con)

# Blog data
con <- file("./projectData/final/en_US/en_US.blogs.txt", "r")
lineBlogs<-readLines(con) 
longBlogs<-length(lineBlogs)

# News data
con <- file("./projectData/final/en_US/en_US.news.txt", "r")
lineNews<-readLines(con) 
longNews<-length(lineNews)
close(con)

# max of lineBlogs
require(stringi)
longBlogs<-stri_length(lineBlogs)
max(longBlogs)
# [1] 40835

# max of lineNews
longNews<-stri_length(lineNews)
max(longNews)
# [1] 5760

# max of lineTwitter
longTwitter<-stri_length(lineTwitter)
max(longTwitter)
# [1] 213

# 4. In the en_US twitter data set, if you divide the number of lines where the word "love" (all lowercase) occurs 
# by the number of lines the word "hate" (all lowercase) occurs, about what do you get?

loveTwitter<-grep("love",lineTwitter) ## Find indeces wher the word occurs

hateTwitter<-grep("hate",lineTwitter)
length(loveTwitter)/length(hateTwitter) ##dive the lengths of indeces

# 5. The one tweet in the en_US twitter data set that matches the word "biostats" says what?
biostatsTwitter<-grep("biostats",lineTwitter)
lineTwitter[biostatsTwitter]

# 6. How many tweets have the exact characters "A computer once beat me at chess, but it was no match for me at kickboxing". (I.e. the line matches those characters exactly.)
sentenceTwitter<-grep("A computer once beat me at chess, but it was no match for me at kickboxing",lineTwitter)
length(sentenceTwitter)

# Close the connection handle when you are done
close(con)

