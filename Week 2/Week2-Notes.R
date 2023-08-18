## Intro-to-Data-and-Data-Collection.pdf R Code
## Will not go over as a class, just for your reference


## ---- echo = FALSE-------------------------------------------------------------------------------------

#To install the 'oibiostat' package (where data comes from):
  
#install.packages("devtools")
#devtools::install_github("OI-Biostat/oi_biostat_data")

library(oibiostat)
library(tidyverse)

data("LEAP")

head(LEAP)

## ---- echo=FALSE---------------------------------------------------------------------------------------
table(LEAP$treatment.group, LEAP$overall.V60.outcome)

## ---- echo=FALSE---------------------------------------------------------------------------------------

x<- as.data.frame(table(LEAP$treatment.group, LEAP$overall.V60.outcome))

## ---- echo=FALSE---------------------------------------------------------------------------------------
x %>% ggplot(aes(Var2, Freq, fill = Var1)) + geom_bar(stat="identity", width=.5, position = "dodge") + xlab("Outcome") + ylab("Count")  + labs(fill="Treatment Group")


## ---- echo=FALSE---------------------------------------------------------------------------------------
x %>% ggplot(aes(Var2, Freq, fill = Var1)) + geom_bar(stat="identity", width=.5, position = "fill") + xlab("Outcome") + ylab("Count")  + labs(fill="Treatment Group")

