## Intro-to-Data-and-Data-Collection.pdf R Code
## Will not go over as a class, just for your reference


## ---- echo = FALSE-------------------------------------------------------------------------------------

#To install the 'oibiostat' package (where LEAP data comes from) - You will only need to do this once!:
  
install.packages("devtools")
devtools::install_github("OI-Biostat/oi_biostat_data")


#Load Library into your session of RStudio - You will need to do this every time you open R
library(oibiostat)
library(tidyverse)

data("LEAP")

head(LEAP)

## -------------------------------------------------------------------------------------------
table(LEAP$treatment.group, LEAP$overall.V60.outcome)

## -------------------------------------------------------------------------------------------

x <- as.data.frame(table(LEAP$treatment.group, LEAP$overall.V60.outcome))

## -------------------------------------------------------------------------------------------
#side by side bar plot
x %>% ggplot(aes(Var2, Freq, fill = Var1)) + 
  geom_bar(stat="identity", width=.5, position = "dodge") + 
  xlab("Outcome") + ylab("Count")  + labs(fill="Treatment Group")


## -------------------------------------------------------------------------------------------
x %>% ggplot(aes(Var2, Freq, fill = Var1)) + 
  geom_bar(stat="identity", width=.5, position = "fill") + 
  xlab("Outcome") + ylab("Count")  + labs(fill="Treatment Group")

