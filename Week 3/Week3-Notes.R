## ----echo=FALSE, message=FALSE, warning = FALSE------------------------------------------------
library(tidyverse)

## ----echo=FALSE--------------------------------------------------------------------------------
#Read in Data Set
data <- read.csv("ICUAdmissions.csv")


## ----------------------------------------------------------------------------------------------
str(data)


## ----------------------------------------------------------------------------------------------
#To change this column to a factor:
data$Cancer<- as.factor(data$Cancer)
#Now Cancer is a Factor!
class(data$Cancer)



## ----message=FALSE, echo=FALSE-----------------------------------------------------------------
#install.packages("mosiac") # only need to run once
library(mosaic)
favstats(data$Age) #gives statistical summaries


## ----message=FALSE, fig.align='center', fig.height=4.5-----------------------------------------
data %>% ggplot(aes(y = Age)) + 
  geom_boxplot() +
  ggtitle("Boxplot of Age")


## ----message=FALSE-----------------------------------------------------------------------------
data %>% ggplot(aes(Age)) + 
  geom_histogram() + 
  ggtitle("Histogram 30 Bins")


## ----message=FALSE-----------------------------------------------------------------------------

data %>% ggplot(aes(Age)) + 
  geom_histogram(bins = 10) + 
  ggtitle("Histogram 10 Bins")


## ----message=FALSE-----------------------------------------------------------------------------

data %>% ggplot(aes(Age)) + 
  geom_density() + 
  ggtitle("Density Plot of Age")


## ----message=FALSE-----------------------------------------------------------------------------

data %>% ggplot(aes(Age)) + 
  geom_density(fill="blue") + 
  ggtitle("Density Plot of Age")



## ----echo = FALSE, message=FALSE---------------------------------------------------------------
favstats(data$HeartRate)

data %>% 
  ggplot(aes(HeartRate)) + 
  geom_histogram() + 
  ggtitle("Histogram of Heart Rate")


## ----echo=FALSE--------------------------------------------------------------------------------
# Call groups by actual names instead of numbers

data <- data %>% 
  mutate(Race = factor(Race, 
                    levels = c("1", "2", "3"),
                    labels = c("White", "Black", "Other")))

table(data$Race)


## ----------------------------------------------------------------------------------------------

data %>%    
  group_by(Race) %>%    
  summarise(count = n()) %>% mutate(prop = count/sum(count))


## ----echo=FALSE--------------------------------------------------------------------------------
data %>% 
  ggplot(aes(x=Race, fill = Race)) + 
  geom_bar() + 
  ggtitle("Bar Plot of Race Distribution")


## ----fig.height=5, fig.align='center'----------------------------------------------------------

data %>% ggplot(aes(x=Systolic, y = HeartRate)) + 
  geom_point() + #<<
  ggtitle("Scatterplot of Systolic vs Heart Rate")

## ----------------------------------------------------------------------------------------------
data %>% 
  ggplot(aes(x=Systolic,
             y=HeartRate))+ 
  geom_line() + 
  ggtitle("Line Plot")


## ----message=FALSE-----------------------------------------------------------------------------
data %>% 
  ggplot(aes(x=Systolic,
             y=HeartRate)) + 
  geom_smooth() + 
  ggtitle("Smooth Line Plot")


## ----echo=FALSE--------------------------------------------------------------------------------
data$Infection <- as.factor(data$Infection)


## ----fig.height=6------------------------------------------------------------------------------
data %>% 
  ggplot(aes(y = HeartRate, 
            fill=Infection)) + 
  geom_boxplot() +
  ggtitle("Box Plot of HR")



## ----message=FALSE, fig.height=6---------------------------------------------------------------
data %>% 
  ggplot(aes(x=HeartRate, 
          color=Infection)) + 
  geom_density() + 
  ggtitle("Density Plot of HR")


## ----fig.height=6------------------------------------------------------------------------------
data %>% ggplot(aes(x=HeartRate, 
        fill = Infection)) + 
  facet_grid(~Infection) + 
  geom_density() + 
  ggtitle("Box Plot of HR")



## ----message=FALSE, fig.height=6---------------------------------------------------------------
data %>% ggplot(aes(x=HeartRate, 
          fill = Infection)) + 
  facet_grid(~Infection) + 
  geom_histogram() + 
  ggtitle("Hist of Heart Rate")



## ----------------------------------------------------------------------------------------------
favstats(~HeartRate|Infection, data = data)


## ----echo=FALSE--------------------------------------------------------------------------------
data <- data %>% 
  mutate(Type = factor(Type, 
                       levels = c("0", "1"),
                       labels = c("Elective", "Emergency"))) %>% 
  mutate(Cancer = factor(Cancer, 
                       levels = c("0", "1"),
                       labels = c("Yes", "No")))



## ----------------------------------------------------------------------------------------------

table(data$Cancer, data$Type)



## ----------------------------------------------------------------------------------------------
data %>% 
  ggplot(aes(x=Cancer,
             fill=Cancer)) +
  facet_grid(~Type)+geom_bar()



## ----echo=FALSE, fig.height=5, fig.align='center'----------------------------------------------

med <- read.csv("Medicalpremium.csv")

med %>% 
  ggplot(aes(x=Age, y = PremiumPrice)) + 
  geom_point() + 
  ggtitle("Scatterplot of Age vs Premium Price")
  


## ----echo=FALSE--------------------------------------------------------------------------------
med <- med %>% 
  mutate(AnyTransplants = factor(AnyTransplants, 
                       levels = c("0", "1"),
                       labels = c("No", "Yes"))) 

table(med$AnyTransplants)



## ----echo=FALSE--------------------------------------------------------------------------------

med %>% 
  ggplot(aes(x=AnyTransplants, fill = AnyTransplants)) +
  geom_bar() + 
  theme(axis.ticks.x=element_blank())



## ----echo = FALSE------------------------------------------------------------------------------
colnames(med)[4] <- "Transplants"

favstats(~PremiumPrice|Transplants, data = data)

## ----echo=FALSE, fig.height=6------------------------------------------------------------------
med %>% 
  ggplot(aes(y = PremiumPrice, fill = Transplants)) + 
  geom_boxplot() + 
  ggtitle("Box Plot of Premium Price")



## ----echo=FALSE--------------------------------------------------------------------------------
med <- med %>% 
  mutate(AnyChronicDiseases = factor(AnyChronicDiseases, 
                                 levels = c("0", "1"),
                                 labels = c("No", "Yes"))) 


table(med$Transplants ,med$AnyChronicDiseases)



## ----echo=FALSE, fig.height=6------------------------------------------------------------------
med %>% 
  ggplot(aes(x=AnyChronicDiseases, fill = Transplants)) + 
  facet_grid(~Transplants) + 
  geom_bar() + 
  ggtitle("Side-by-side bar plot of chronic diseases vs transplant")


