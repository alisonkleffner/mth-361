## ---- Slide 5-----------------------------------------------------------------
  
install.packages("tidyverse")
  
#Note: It may take a while
#Note use "#" to create notes in R

## ---- Slide 6-----------------------------------------------------------------
library(tidyverse)

## ---- Slide 7-----------------------------------------------------------------
getwd() #What is your working directory
setwd() # Change Working directory
#  

## ---- Slide 8-----------------------------------------------------------------
data = read.csv("ICUAdmissions.csv")
head(data) #make sure data loads in correctly


## ---- Slide 9-----------------------------------------------------------------
?head

## ---- Slide 10 ---------------------------------------------------------------
str(data)
#Note: The purpose of checking variable types is to make sure R is understanding what each column is representing.


## ---- Slide 11 ---------------------------------------------------------------

#To change this column to a factor:
data$ID <- as.factor(data$ID)
data$Race <- as.factor(data$Race)


#Now they are factors!
class(data$ID)
class(data$Race)


## ---- Slide 12 ---------------------------------------------------------------

data[1:10,3] #thrid column observations 1 - 10 (also data$Age[1:10])

data[1,3] #first observation in third column


## ---- Slide 13 ---------------------------------------------------------------
summary(data)

## ---- Slide 14 ---------------------------------------------------------------

x <- 5
RoyalsWins <- 25

## ---- Slide 15 ---------------------------------------------------------------
a <- 1
b <- 3
c <- 6

a+b #Addition
c-a #Subtraction
b*c #Multiplication

c/b #Division 
sqrt(4)
2^3

## ---- Slide 16 ---------------------------------------------------------------  
b(a+c) #doesn't work

b*(a+c)

## ---- Slide 19 ---------------------------------------------------------------
#This alone creates html/word documents
install.packages("rmarkdown") #install the knitr package

#If you want to create a PDF need Latex
install.packages('tinytex')
tinytex::install_tinytex()  # install TinyTeX

