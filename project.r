#setting working directory
setwd("/Users/muhtasim/Desktop/STAT565_Project")
getwd()
#loading libraries
library(MASS)
library(dplyr)
library(caret)
library(mlr)
library(h2o)
#read the csv files
mydata=read.csv("/Users/muhtasim/Desktop/STAT565_Project/data_set_ALL_AML_train.csv",quote="")
#remove those columns whose names start with "call"
mydata1=select(mydata,-starts_with("call")) 
#transpose the matrix
mydata2=t(mydata1)  
#remove the first two rows
mydata3=mydata2[-c(1,2),]
#treating mydata as dataframe
df1=data.frame(mydata3)
#importing the first 38 rows of the second columns from the actual.csv dataset
#these first 38 observations are for the training set
cancer=read.csv("/Users/muhtasim/Desktop/STAT565_Project/actual.csv") [1:38,2]
#treating it as data frame as well
df2=data.frame(cancer)
#adding this column to the dataframe for mydata
df1$cat=df2$cancer
#assigning 0 for ALL and 1 for AML
df1$cat=(ifelse(df1$cat=="ALL",0,1))

#x_std=preProcess(df1,method=c("pca"),pcaComp = 2)
#x_std
rownames(df1)=c(1:38)
colnames(df1)=c(1:7130)
scaled=scale(df1)
pr=prcomp(df1)
pr
summary(pr)

screeplot(pr,type="lines")
biplot(pr)
