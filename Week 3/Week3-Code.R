## Case Study 1:

data <- read.csv("Week 3/data/ICUAdmissions.csv") #read in the data


library(tidyverse) #Package Necessary

#Slide 13

data %>% ggplot(aes(Age)) + geom_histogram() + ggtitle("Histogram of Age with 30 Bins")

data %>% ggplot(aes(Age)) + geom_histogram(bins = 15) + ggtitle("Histogram of Age with 15 Bins")

# Slide 14

data %>% ggplot(aes(Age)) + geom_density() + ggtitle("Density Plot of Age")

data %>% ggplot(aes(Age)) + geom_density(color="darkblue", fill="lightblue") + ggtitle("Density Plot of Age")

# Slide 17
j <- t(data.frame(c(summary(data$HeartRate), sd= sd(data$HeartRate), n= length(data$HeartRate), missing=sum(is.na(data$HeartRate)))))
rownames(j) <- NULL 
j

data %>% ggplot(aes(HeartRate)) + geom_histogram() + ggtitle("Histogram of Heart Rate")

#Slide 19

data <- data %>% 
  mutate(Race = factor(Race, 
                    levels = c("1", "2", "3"),
                    labels = c("White", "Black", "Other")))

dt <- data %>%    
  group_by(Race) %>%    
  summarise(count = n()) %>% mutate(prop = count/sum(count))

dt
#Slide 20

data %>% ggplot(aes(y=Race)) + geom_bar()

dt %>% ggplot(aes(x= Race, y = prop)) + geom_bar(stat = "identity")


# Slide 21

data %>% ggplot(aes(x=Race)) + 
  geom_bar() + 
  ggtitle("Bar Plot of Race Distribution")data %>% ggplot(aes(y=Race)) + geom_bar()


data %>% ggplot(aes(Age)) + 
  geom_histogram() + 
  ggtitle("Histogram of Age Distribution")

#Slide 23

data %>% ggplot(aes(x=Systolic, y = HeartRate)) + geom_point()


# Slide 25
data %>% ggplot(aes(x=Systolic, y = HeartRate)) + geom_line()

data %>% ggplot(aes(x=Systolic, y = HeartRate)) + geom_smooth()


#Slide 27


data$Infection <- as.factor(data$Infection)
data %>% ggplot(aes(y = HeartRate, fill = Infection)) + geom_boxplot() + ggtitle("Box Plot of Heart Rate")

data %>% ggplot(aes(x=HeartRate, color = Infection)) + geom_density() + ggtitle("Density Plot of Heart Rate")

#Slide 28

data %>% ggplot(aes(y=HeartRate, fill = Infection)) + facet_grid(~Infection) + geom_boxplot() + ggtitle("Box Plot of Heart Rate")


data %>% ggplot(aes(x=HeartRate, fill = Infection)) + facet_grid(~Infection) + geom_histogram() + ggtitle("Histogram of Heart Rate")


#Slide 30
data <- data %>% 
  mutate(Type = factor(Type, 
                       levels = c("0", "1"),
                       labels = c("Elective", "Emergency"))) %>% 
  mutate(Cancer = factor(Cancer, 
                         levels = c("0", "1"),
                         labels = c("Yes", "No")))
tab <- table(data$Cancer, data$Type)
names(attributes(tab)$dimnames) <- c("Cancer","Type")
tab




### Case Study 2


med <- read.csv("Week 3/data/Medicalpremium.csv") #Read in the DAta


#Slide 32
med %>% ggplot(aes(x=Age, y = PremiumPrice)) + geom_point() + ggtitle("Scatterplot of Age vs Premium Price")
  

#Slide 33
med <- med %>% 
  mutate(AnyTransplants = factor(AnyTransplants, 
                                 levels = c("0", "1"),
                                 labels = c("No", "Yes"))) 

t(table(med$AnyTransplants))


med %>% ggplot(aes(x=AnyTransplants)) + geom_bar() + theme(axis.ticks.x=element_blank())


#Slide 34

med %>% group_by(AnyTransplants) %>% summarise(min = min(PremiumPrice), Q1=quantile(PremiumPrice, probs = 0.25),
                                               median=median(PremiumPrice), Q3=quantile(PremiumPrice, probs = 0.75), max = max(PremiumPrice), 
                                               mean = mean(PremiumPrice), sd= sd(PremiumPrice), n = n(), missing= sum(is.na(PremiumPrice)))


med %>% ggplot(aes(y = PremiumPrice, fill = AnyTransplants)) + geom_boxplot() + ggtitle("Box Plot of Premium Price")

#Slide 35


med <- med %>% 
  mutate(AnyChronicDiseases = factor(AnyChronicDiseases, 
                                 levels = c("0", "1"),
                                 labels = c("No", "Yes"))) 

med %>% ggplot(aes(x=AnyChronicDiseases, fill = AnyTransplants))+ facet_grid(~AnyTransplants) + geom_bar()


