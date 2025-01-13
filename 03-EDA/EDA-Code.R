## ----echo=FALSE, message=FALSE, warning = FALSE----------------------------------------
library(tidyverse)


## ----echo=FALSE------------------------------------------------------------------------
data <- read.csv("ICUAdmissions.csv")


## --------------------------------------------------------------------------------------
str(data)


## ----message=FALSE, echo=FALSE---------------------------------------------------------
library(mosaic)
favstats(data$Age) #gives statistical summaries


## ----message=FALSE, fig.align='center', fig.height=4.5---------------------------------
data %>% ggplot(aes(x = Age)) + 
  geom_boxplot() + #<<
  ggtitle("Boxplot of Age")


## ----message=FALSE---------------------------------------------------------------------
data %>% ggplot(aes(Age)) + 
  geom_histogram() + #<<
  ggtitle("Histogram 30 Bins")


## ----message=FALSE---------------------------------------------------------------------

data %>% ggplot(aes(Age)) + 
  geom_histogram(bins = 10) + #<<
  ggtitle("Histogram 10 Bins")


## ----message=FALSE---------------------------------------------------------------------

data %>% ggplot(aes(Age)) + 
  geom_density() + #<<
  ggtitle("Density Plot of Age")


## ----message=FALSE---------------------------------------------------------------------

data %>% ggplot(aes(Age)) + 
  geom_density(fill="blue") + #<<
  ggtitle("Density Plot of Age")



## ----echo = FALSE, message=FALSE-------------------------------------------------------
j <- t(data.frame(c(summary(data$HeartRate), sd= sd(data$HeartRate), n= length(data$HeartRate), missing=sum(is.na(data$HeartRate)))))
rownames(j) <- NULL 

j



## ----echo = FALSE, message=FALSE-------------------------------------------------------
data %>% ggplot(aes(HeartRate)) + geom_histogram() + ggtitle("Histogram of Heart Rate")


## ----echo=FALSE------------------------------------------------------------------------
data <- data %>% 
  mutate(Race = factor(Race, 
                    levels = c("1", "2", "3"),
                    labels = c("White", "Black", "Other")))



## --------------------------------------------------------------------------------------
table(data$Race)


## --------------------------------------------------------------------------------------

data %>%    
  group_by(Race) %>%    
  summarise(count = n()) %>% mutate(prop = count/sum(count))



## ----fig.align='center', fig.height=5--------------------------------------------------
data %>% ggplot(aes(x=Race, fill = Race)) + 
  geom_bar() #<<


## ----echo=FALSE------------------------------------------------------------------------
data %>% ggplot(aes(x=Race)) + geom_bar() + ggtitle("Bar Plot of Race Distribution")


## ----echo=FALSE, message=FALSE---------------------------------------------------------
data %>% ggplot(aes(Age)) + geom_histogram() + ggtitle("Histogram of Age Distribution")



## ----fig.height=5, fig.align='center'--------------------------------------------------

data %>% ggplot(aes(x=Systolic, y = HeartRate)) + 
  geom_point() + #<<
  ggtitle("Scatterplot of Systolic vs Heart Rate")



## ----fig.height=5----------------------------------------------------------------------
#Line Plot
data %>% ggplot(aes(x=Systolic,
             y=HeartRate))+ 
  geom_line() + #<<
  ggtitle("Line Plot")


## ----message=FALSE, fig.height=5-------------------------------------------------------
#Smooth Line Plot
data %>% ggplot(aes(x=Systolic,
             y=HeartRate))+ 
  geom_smooth() + #<<
  ggtitle("Smooth Line Plot")


## ----echo=FALSE------------------------------------------------------------------------
data$Infection <- as.factor(data$Infection)


## ----fig.height=6----------------------------------------------------------------------
data %>% 
  ggplot(aes(y = HeartRate, 
            fill=Infection)) + #<<
  geom_boxplot() + #<<
  ggtitle("Box Plot of HR")



## ----message=FALSE, fig.height=6-------------------------------------------------------
data %>% 
  ggplot(aes(x=HeartRate, 
          color=Infection)) + #<<
  geom_density() + #<<
  ggtitle("Density Plot of HR")


## ----fig.height=6----------------------------------------------------------------------
data %>% ggplot(aes(x=HeartRate, 
        fill = Infection)) + 
  facet_grid(~Infection) + #<<
  geom_density() + #<<
  ggtitle("Box Plot of HR")



## ----message=FALSE, fig.height=6-------------------------------------------------------
data %>% ggplot(aes(x=HeartRate, 
          fill = Infection)) + 
  facet_grid(~Infection) + #<<
  geom_histogram() + #<<
  ggtitle("Hist of Heart Rate")



## --------------------------------------------------------------------------------------
favstats(~HeartRate|Infection, data = data)


## ----echo=FALSE------------------------------------------------------------------------
data <- data %>% 
  mutate(Type = factor(Type, 
                       levels = c("0", "1"),
                       labels = c("Elective", "Emergency"))) %>% 
  mutate(Cancer = factor(Cancer, 
                       levels = c("0", "1"),
                       labels = c("Yes", "No")))



## --------------------------------------------------------------------------------------

table(data$Cancer, data$Type)



## --------------------------------------------------------------------------------------
data %>% 
  ggplot(aes(x=Cancer,
             fill=Cancer)) +
  facet_grid(~Type)+geom_bar()



## ----echo=FALSE, fig.height=5, fig.align='center'--------------------------------------

med <- read.csv("Medicalpremium.csv")

med %>% ggplot(aes(x=Age, y = PremiumPrice)) + geom_point() + ggtitle("Scatterplot of Age vs Premium Price")
  


## ----echo=FALSE------------------------------------------------------------------------
med <- med %>% 
  mutate(AnyTransplants = factor(AnyTransplants, 
                       levels = c("0", "1"),
                       labels = c("No", "Yes"))) 

kableExtra::kable(t(table(med$AnyTransplants)))



## ----echo=FALSE------------------------------------------------------------------------

med %>% ggplot(aes(x=AnyTransplants, fill = AnyTransplants)) + geom_bar() + theme(axis.ticks.x=element_blank())



## ----echo = FALSE----------------------------------------------------------------------
colnames(med)[4] <- "Transplants"

med %>% group_by(Transplants) %>% summarise(min = min(PremiumPrice), Q1=quantile(PremiumPrice, probs = 0.25),
                                               med=median(PremiumPrice), Q3=quantile(PremiumPrice, probs = 0.75), max = max(PremiumPrice), 
                                               mean = mean(PremiumPrice), sd= sd(PremiumPrice), n = n())



## ----echo=FALSE, fig.height=6----------------------------------------------------------
med %>% ggplot(aes(y = PremiumPrice, fill = Transplants)) + geom_boxplot() + ggtitle("Box Plot of Premium Price")



## ----echo=FALSE------------------------------------------------------------------------
med <- med %>% 
  mutate(AnyChronicDiseases = factor(AnyChronicDiseases, 
                                 levels = c("0", "1"),
                                 labels = c("No", "Yes"))) 


tab2 <- table(med$Transplants ,med$AnyChronicDiseases)
names(attributes(tab2)$dimnames) <- c("Transplant","Chronic")
tab2



## ----echo=FALSE, fig.height=6----------------------------------------------------------
med %>% ggplot(aes(x=AnyChronicDiseases, fill = Transplants))+ facet_grid(~Transplants) + geom_bar() + ggtitle("Side-by-side bar plot of chronic diseases vs transplant")

