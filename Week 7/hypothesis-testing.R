## ----echo=FALSE, warning=FALSE, fig.height=6, fig.align='center', message=FALSE----------------
library(NHANES)
library(mosaic)
library(oibiostat)
library(tidyverse)

data("nhanes.samp")
nhanes.samp %>% ggplot(aes(x = BMI)) + geom_histogram(fill = "lightblue", color = "black", bins = 20)


## ----------------------------------------------------------------------------------------------
favstats(~BMI, data=nhanes.samp)


## ----echo=TRUE---------------------------------------------------------------------------------
t.test(~BMI, 
       mu=25, 
       alternative='greater', 
       data=nhanes.samp)


## ----echo=FALSE--------------------------------------------------------------------------------
set.seed(361)
bluefin_tuna <- tibble(mercury = rnorm(n=23, mean=0.52, sd=0.16))
favstats(~mercury, data=bluefin_tuna)


## ----echo=TRUE---------------------------------------------------------------------------------
t.test(~mercury, 
       mu=0.5, 
       alternative='greater', 
       data=bluefin_tuna)



