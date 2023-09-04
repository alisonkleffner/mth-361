## ----echo=FALSE, message=FALSE, warning = FALSE--------------------------------------------------------
library(tidyverse)
#install.packages("mosaic")
library(mosaic)

data <- read.csv("ICUAdmissions.csv") #Should already have on your Computer


### One Continuous ----

#Histograms to Capture the Distribution (Slide 18)
data %>% ggplot(aes(Age)) + geom_histogram() + ggtitle("Histogram of Age with 30 Bins")

data %>% ggplot(aes(Age)) + geom_histogram(bins = 15) + ggtitle("Histogram of Age with 15 Bins")


# Density Plots (Slide 19)
data %>% ggplot(aes(Age)) + geom_density() + ggtitle("Density Plot of Age")

data %>% ggplot(aes(Age)) + geom_density(color="darkblue", fill="lightblue") + ggtitle("Density Plot of Age")


# Exercise (Slide 22)


favstats(data$HeartRate) #gives statistical summaries

data %>% ggplot(aes(HeartRate)) + geom_histogram() + ggtitle("Histogram of Heart Rate")


### One Categorical ----

# Slide 24

data <- data %>% 
  mutate(Race = factor(Race, 
                    levels = c("1", "2", "3"),
                    labels = c("White", "Black", "Other"))) #creating labels

data %>%    
  group_by(Race) %>%    
  summarise(count = n()) %>% mutate(prop = count/sum(count)) #Creating Frequency Table

# Bar Plots (Slide 25)
data %>% ggplot(aes(x=Race, fill = Race)) + geom_bar()


## Slide 26
data %>% ggplot(aes(x=Race)) + geom_bar() + ggtitle("Bar Plot of Race Distribution")

data %>% ggplot(aes(Age)) + geom_histogram() + ggtitle("Histogram of Age Distribution")



### Two Continuous ----

# Scatterplot (Slide 27)

data %>% ggplot(aes(x=Systolic, y = HeartRate)) + geom_point()


# Trends (Slide 31)
data %>% ggplot(aes(x=Systolic, y = HeartRate)) + geom_line() + ggtitle("Line Plot")

data %>% ggplot(aes(x=Systolic, y = HeartRate)) + geom_smooth() + ggtitle("Smooth Line Plot")


### One Continuous and One Categorical ----

# Slide 33
data$Infection <- as.factor(data$Infection)
data %>% ggplot(aes(y = HeartRate, fill = Infection)) + geom_boxplot() + ggtitle("Box Plot of Heart Rate")


data %>% ggplot(aes(x=HeartRate, color = Infection)) + geom_density() + ggtitle("Density Plot of Heart Rate")


# Slide 34 (Panels)
data %>% ggplot(aes(y=HeartRate, fill = Infection)) + facet_grid(~Infection) + geom_boxplot() + ggtitle("Box Plot of Heart Rate")

data %>% ggplot(aes(x=HeartRate, fill = Infection)) + facet_grid(~Infection) + geom_histogram() + ggtitle("Histogram of Heart Rate")



### Two Categorical ----

data <- data %>% 
  mutate(Type = factor(Type, 
                       levels = c("0", "1"),
                       labels = c("Elective", "Emergency"))) %>% 
  mutate(Cancer = factor(Cancer, 
                       levels = c("0", "1"),
                       labels = c("Yes", "No"))) #Creating labels


## Two-Way Table (Slide 35)
tab <- table(data$Cancer, data$Type)
names(attributes(tab)$dimnames) <- c("Cancer","Type")
tab

# Bar Plot in Multiple Panels (Slide 36)
data %>% ggplot(aes(x=Cancer, fill = Cancer))+ facet_grid(~Type) + geom_bar()



#### Exercise (Slides 37-41) ----


med <- read.csv("Medicalpremium.csv")

# Slide 33

med %>% ggplot(aes(x=Age, y = PremiumPrice)) + geom_point() + ggtitle("Scatterplot of Age vs Premium Price")
  

# Slide 34
med <- med %>% 
  mutate(AnyTransplants = factor(AnyTransplants, 
                       levels = c("0", "1"),
                       labels = c("No", "Yes"))) 

table(med$AnyTransplants)



med %>% ggplot(aes(x=AnyTransplants)) + geom_bar() + theme(axis.ticks.x=element_blank())

# Slide 35
favstats(x=~PremiumPrice|AnyTransplants, data = med)

med %>% ggplot(aes(y = PremiumPrice, fill = AnyTransplants)) + geom_boxplot() + ggtitle("Box Plot of Premium Price")

# Slide 36

med <- med %>% 
  mutate(AnyChronicDiseases = factor(AnyChronicDiseases, 
                                 levels = c("0", "1"),
                                 labels = c("No", "Yes"))) 


tab2 <- table(med$AnyTransplants ,med$AnyChronicDiseases)
names(attributes(tab2)$dimnames) <- c("Transplant","Chronic")
tab2


med %>% ggplot(aes(x=AnyChronicDiseases, fill = AnyTransplants))+ facet_grid(~AnyTransplants) + geom_bar() + ggtitle("Side-by-side bar plot of chronic diseases vs transplant")

