## ----echo=FALSE, message=FALSE, warning = FALSE------------------------------------------------------------
library(tidyverse)

## ----message=FALSE, echo=FALSE-----------------------------------------------------------------------------
library(mosaic)
data <- read.csv("ICUAdmissions.csv")
favstats(data$Age) #gives statistical summaries


## ----message=FALSE-----------------------------------------------------------------------------------------
data %>% ggplot(aes(Age)) 


## ----message=FALSE-----------------------------------------------------------------------------------------
data %>% ggplot(aes(Age)) + 
  geom_histogram() #<<


## ----message=FALSE-----------------------------------------------------------------------------------------
data %>% ggplot(aes(Age)) + 
  geom_histogram() + 
  ggtitle("Histogram 30 Bins")


## ----message=FALSE-----------------------------------------------------------------------------------------

data %>% ggplot(aes(Age)) + 
  geom_histogram(bins = 10) + 
  ggtitle("Histogram 10 Bins")


## ----message=FALSE-----------------------------------------------------------------------------------------

data %>% ggplot(aes(Age)) + 
  geom_density() + #<<
  ggtitle("Density Plot of Age")


## ----message=FALSE-----------------------------------------------------------------------------------------

data %>% ggplot(aes(Age)) + 
  geom_density(fill="blue") + 
  ggtitle("Density Plot of Age")


## ----echo = FALSE, message=FALSE---------------------------------------------------------------------------
favstats(~HeartRate, data = data)

## ----echo = FALSE, message=FALSE---------------------------------------------------------------------------
data %>% ggplot(aes(HeartRate)) + geom_histogram() + ggtitle("Histogram of Heart Rate")


## ----echo=FALSE--------------------------------------------------------------------------------------------
data <- data %>% 
  mutate(Race = factor(Race, 
                    levels = c("1", "2", "3"),
                    labels = c("White", "Black", "Other"))) #Renaming Race Categories so using actual category instead of number



## ----------------------------------------------------------------------------------------------------------
table(data$Race)

data %>%    
  group_by(Race) %>%    
  summarise(count = n()) %>% mutate(prop = count/sum(count))



## ----fig.align='center', fig.height=5----------------------------------------------------------------------
data %>% ggplot(aes(x=Race, fill = Race)) + 
  geom_bar() 


## ----echo=FALSE--------------------------------------------------------------------------------------------
data %>% ggplot(aes(x=Race)) + geom_bar() + ggtitle("Bar Plot of Race Distribution")


## ----echo=FALSE, message=FALSE-----------------------------------------------------------------------------
data %>% ggplot(aes(Age)) + geom_histogram() + ggtitle("Histogram of Age Distribution")



## ----fig.height=5, fig.align='center'----------------------------------------------------------------------

data %>% ggplot(aes(x=Systolic, y = HeartRate)) + 
  geom_point() 


## ----------------------------------------------------------------------------------------------------------
data %>% 
  ggplot(aes(x=Systolic,
             y=HeartRate))+ 
  geom_line() + 
  ggtitle("Line Plot")


## ----message=FALSE-----------------------------------------------------------------------------------------
data %>% 
  ggplot(aes(x=Systolic,
             y=HeartRate))+ 
  geom_smooth() + 
  ggtitle("Smooth Line Plot")


## ----echo=FALSE--------------------------------------------------------------------------------------------
data$Infection <- as.factor(data$Infection) #Infection currently being treated as numeric, want it to be a factor


## ----fig.height=6------------------------------------------------------------------------------------------
data %>% 
  ggplot(aes(y = HeartRate, 
            fill=Infection)) + 
  geom_boxplot() +
  ggtitle("Box Plot of HR")



## ----message=FALSE, fig.height=6---------------------------------------------------------------------------
data %>% 
  ggplot(aes(x=HeartRate, 
          color=Infection)) + 
  geom_density() + 
  ggtitle("Density Plot of HR")


## ----fig.height=6------------------------------------------------------------------------------------------
data %>% ggplot(aes(x=HeartRate, 
        fill = Infection)) + 
  facet_grid(~Infection) + 
  geom_density() + 
  ggtitle("Box Plot of HR")



## ----message=FALSE, fig.height=6---------------------------------------------------------------------------
data %>% ggplot(aes(x=HeartRate, 
          fill = Infection)) + 
  facet_grid(~Infection) + 
  geom_histogram() + 
  ggtitle("Hist of Heart Rate")



## ----echo=FALSE--------------------------------------------------------------------------------------------
data <- data %>% 
  mutate(Type = factor(Type, 
                       levels = c("0", "1"),
                       labels = c("Elective", "Emergency"))) %>% 
  mutate(Cancer = factor(Cancer, 
                       levels = c("0", "1"),
                       labels = c("Yes", "No")))

#Rename Type and Cancer categories

## ----------------------------------------------------------------------------------------------------------

table(data$Cancer, data$Type)



## ----------------------------------------------------------------------------------------------------------
data %>% 
  ggplot(aes(x=Cancer,
             fill=Cancer)) +
  facet_grid(~Type)+geom_bar()



## ----echo=FALSE, fig.height=5, fig.align='center'----------------------------------------------------------

med <- read.csv("Medicalpremium.csv")

med %>% ggplot(aes(x=Age, y = PremiumPrice)) + geom_point() + ggtitle("Scatterplot of Age vs Premium Price")
  


## ----echo=FALSE--------------------------------------------------------------------------------------------
med <- med %>% 
  mutate(AnyTransplants = factor(AnyTransplants, 
                       levels = c("0", "1"),
                       labels = c("No", "Yes"))) 

table(med$AnyTransplants)



## ----echo=FALSE--------------------------------------------------------------------------------------------

med %>% ggplot(aes(x=AnyTransplants, fill = AnyTransplants)) + geom_bar() + theme(axis.ticks.x=element_blank())



## ----echo = FALSE------------------------------------------------------------------------------------------

favstats(~PremiumPrice|AnyTransplants, data = med)

## ----echo=FALSE, fig.height=6------------------------------------------------------------------------------
med %>% ggplot(aes(y = PremiumPrice, fill = AnyTransplants)) + geom_boxplot() + ggtitle("Box Plot of Premium Price")



## ----echo=FALSE--------------------------------------------------------------------------------------------
med <- med %>% 
  mutate(AnyChronicDiseases = factor(AnyChronicDiseases, 
                                 levels = c("0", "1"),
                                 labels = c("No", "Yes"))) 


tab2 <- table(med$AnyTransplants ,med$AnyChronicDiseases)
names(attributes(tab2)$dimnames) <- c("Transplant","Chronic")
tab2



## ----echo=FALSE, fig.height=6------------------------------------------------------------------------------
med %>% ggplot(aes(x=AnyChronicDiseases, fill = Transplants))+ facet_grid(~Transplants) + geom_bar() + ggtitle("Side-by-side bar plot of chronic diseases vs transplant")

