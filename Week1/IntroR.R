## ----echo=FALSE, message=FALSE, warning = FALSE--------------------------------------------------------------------
library(tidyverse)

knitr::knit_hooks$set(purl = knitr::hook_purl)


## ---- echo=FALSE---------------------------------------------------------------------------------------------------

knitr::include_graphics("../week1/images/rstudio.png")


## ---- eval= FALSE--------------------------------------------------------------------------------------------------
#  
#  install.packages("tidyverse")
#  
#  #Note: It may take a while (use "#" to create notes in R)

## ---- eval = FALSE-------------------------------------------------------------------------------------------------
#  library(tidyverse)

## ---- eval = FALSE-------------------------------------------------------------------------------------------------
#  getwd() #What is your working directory
#  setwd() # Change Working directory
#  

## ------------------------------------------------------------------------------------------------------------------
data = read.csv("data/ICUAdmissions.csv")
head(data) #make sure data loads in correctly


## ----eval = FALSE--------------------------------------------------------------------------------------------------
#  ?head

## ------------------------------------------------------------------------------------------------------------------
str(data)
#Note: The purpose of checking variable types is to make sure R is understanding what each column is representing.


## ------------------------------------------------------------------------------------------------------------------

#To change this column to a factor:
data$ID <- as.factor(data$ID)
data$Race <- as.factor(data$Race)


#Now they are factors!
class(data$ID)
class(data$Race)


## ------------------------------------------------------------------------------------------------------------------
data[1,] #first row
data[1:10,3] #thrid column observations 1 - 10 (also data$Age[1:10])

data[1,3] #first observation in third column


## ------------------------------------------------------------------------------------------------------------------
summary(data[1:5])

## ------------------------------------------------------------------------------------------------------------------
a <- 1
b <- 3
c <- 6


## ------------------------------------------------------------------------------------------------------------------
a+b #Addition
c-a #Subtraction
b*c #Multiplication

## ------------------------------------------------------------------------------------------------------------------
c/b #Division 
sqrt(4)
2^3

## ----eval = FALSE--------------------------------------------------------------------------------------------------
#  
#  b(a+c)

## ------------------------------------------------------------------------------------------------------------------
b*(a+c)

## ----eval = FALSE--------------------------------------------------------------------------------------------------
#  #This alone creates html/word documents
#  install.packages("rmarkdown") #install the knitr package
#  

## ----eval= FALSE---------------------------------------------------------------------------------------------------
#  #If you want to create a PDF need Latex
#  install.packages('tinytex')
#  tinytex::install_tinytex()  # install TinyTeX

