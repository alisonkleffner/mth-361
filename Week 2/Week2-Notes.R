## ----echo=FALSE, message=FALSE, warning = FALSE-----------------------------------------------------------------------

library(tidyverse)

## ---- echo = FALSE----------------------------------------------------------------------------------------------------

install.packages("devtools")

library(devtools)
devtools::install_github("OI-Biostat/oi_biostat_data")
library(oibiostat)
data("LEAP")

head(LEAP)

## ---- echo=FALSE------------------------------------------------------------------------------------------------------
table(LEAP$treatment.group, LEAP$overall.V60.outcome)

## ---- echo=FALSE------------------------------------------------------------------------------------------------------
x<- as.data.frame(table(LEAP$treatment.group, LEAP$overall.V60.outcome))

x %>% ggplot(aes(Var2, Freq, fill = Var1)) + geom_bar(stat="identity", width=.5, position = "dodge") + xlab("Outcome") + ylab("Count")  + labs(fill="Treatment Group")

x %>% ggplot(aes(Var2, Freq, fill = Var1)) + geom_bar(stat="identity", width=.5, position = "fill") + xlab("Outcome") + ylab("Count")  + labs(fill="Treatment Group")


