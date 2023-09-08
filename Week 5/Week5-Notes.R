## ---- echo=FALSE, message=FALSE----------------------------------------------------------------------------
library(tidyverse)
fev <- read.csv("FEV.csv")

fev %>% ggplot(aes(x=fev)) +
  geom_density(color="black", fill="blue")



## ---- echo=FALSE-------------------------------------------------------------------------------------------
fev %>% ggplot(aes(x=height)) +
  geom_density(color="black", fill="blue")



## ---- echo=FALSE, out.width = "40%", fig.align='center'----------------------------------------------------

ggplot(data.frame(x = c(-3, 3)), aes(x = x)) +
        stat_function(fun = dnorm) + ylab("Density")


## ---- echo= FALSE, out.width="55%", fig.align='center'-----------------------------------------------------
# Return dnorm(x) for 0 < x < 2, and NA for all other x
dnorm_limit <- function(x) {
    y <- dnorm(x)
    y[x > 0  |  x < -2] <- NA
    return(y)
}

# ggplot() with dummy data
p <- ggplot(data.frame(x = c(-3, 3)), aes(x = x))

p +
  stat_function(fun = dnorm_limit, geom = "area", fill = "blue", alpha = 0.2) +
  stat_function(fun = dnorm) + ylab("Density")


## ---- echo= FALSE, out.width="85%", fig.align='center'-----------------------------------------------------
# ggplot() with dummy data
dnorm_limit <- function(x) {
    y <- dnorm(x)
    y[x > -1  |  x < -3] <- NA
    return(y)
}

p1 <- ggplot(data.frame(x = c(-3, 3)), aes(x = x))

p1 +
  stat_function(fun = dnorm_limit, geom = "area", fill = "blue", alpha = 0.4) +
  stat_function(fun = dnorm) + ylab("Density")


## ---- echo= FALSE, out.width="85%", fig.align='center'-----------------------------------------------------
# ggplot() with dummy data
dnorm_limit <- function(x) {
    y <- dnorm(x)
    y[x > 1  |  x < -1] <- NA
    return(y)
}

p2 <- ggplot(data.frame(x = c(-3, 3)), aes(x = x))

p2 +
  stat_function(fun = dnorm_limit, geom = "area", fill = "blue", alpha = 0.4) +
  stat_function(fun = dnorm) + ylab("Density")


## ---- echo=FALSE-------------------------------------------------------------------------------------------
library(mosaic)


## ---- message=FALSE, out.width="40%", fig.align='center'---------------------------------------------------
xpnorm(q=1.5, mean = 2.64, sd=0.87)


## ---- message=FALSE, echo=FALSE, out.width="90%"-----------------------------------------------------------
xpnorm(3, mean=3.3, sd=0.56)


## ---- message=FALSE, echo=FALSE, out.width="90%"-----------------------------------------------------------
xpnorm(4, mean=3.3, sd=0.56)


## ---- message=FALSE, echo=FALSE, out.width="85%"-----------------------------------------------------------
xpnorm(3, mean=3.3, sd=0.56)


## ---- message=FALSE, echo=FALSE, out.width="80%"-----------------------------------------------------------
xpnorm(4, mean=3.3, sd=0.56)


## ---- message=FALSE----------------------------------------------------------------------------------------
1-xpnorm(5, mean=3.3, sd=0.56)


## ---- out.width="60%", message=FALSE-----------------------------------------------------------------------
xpnorm(180.3, mean=177, sd=7.1)


## ---- out.width="60%", message=FALSE-----------------------------------------------------------------------
xpnorm(172.7,mean=163.3,sd=6.4)


## ---- echo=FALSE, fig.align='center'-----------------------------------------------------------------------
knitr::include_graphics("../images/Week5/empirical rule.png")


## ---- message=FALSE, out.width="45%", fig.align='center'---------------------------------------------------
xqnorm(0.40, mean=2.64, sd=0.87)


## ---- message=FALSE, out.width="65%", fig.align='center'---------------------------------------------------
xqnorm(0.2,mean=3.296,sd=0.56)


## ---- message=FALSE, out.width="65%", fig.align='center'---------------------------------------------------
1-xqnorm(0.4,mean=3.296,sd=0.56)


## ---- message=FALSE,fig.align='center', echo = FALSE, fig.height=7, fig.width=10---------------------------

set.seed(10)
data1 <- data.frame(value = rnorm(n=30, mean=0, sd=1), type = "Small (n=30)")
data2 <- data.frame(value = rnorm(n=100, mean=0, sd=1), type = "Medium (n=100)")
data3 <- data.frame(value = rnorm(n=300, mean=0, sd=1), type = "Large (n=300)")
data <- rbind(data1, data2, data3)
data$type <- factor(data$type, levels = c("Small (n=30)", "Medium (n=100)", "Large (n=300)"))

data %>% 
  ggplot(aes(x=value, fill = type)) + facet_wrap(vars(type)) + 
  geom_histogram(bins = 15)


## ---- message=FALSE, fig.align='center', echo = FALSE, fig.height=7, fig.width=10--------------------------
data %>% ggplot(aes(sample=value, color = type)) + facet_wrap(vars(type)) +
  stat_qq() + stat_qq_line()


## ---- echo=FALSE, fig.align='center', fig.height=7, fig.width=10-------------------------------------------
set.seed(12345)
data1 <- data.frame(value = c(rbeta(15, 10, 3), rbeta(15, 3, 10)), type = "Bimodal")
data2 <- data.frame(value = rbeta(30, 10, 3), type = "Left Skew")
data3 <- data.frame(value = rbeta(30, 3, 10), type = "Right Skew")

data <- rbind(data1, data2, data3)

data %>% 
  ggplot(aes(x=value, fill = type)) + facet_wrap(vars(type)) + 
  geom_histogram(bins = 15)


## ----echo=FALSE, fig.align='center', fig.height=7, fig.width=10--------------------------------------------
data %>% 
  ggplot(aes(sample=value, color = type)) + facet_wrap(vars(type)) + 
  stat_qq() + stat_qq_line()


## ----echo=FALSE, fig.align='center', fig.height=8.5, fig.width=10------------------------------------------
fev %>% 
  ggplot(aes(x=height)) + geom_density(color="black", fill="blue")


## ----echo=FALSE, fig.align='center', fig.height=8.5, fig.width=10------------------------------------------
fev %>% 
  ggplot(aes(sample=height)) +
  stat_qq() + stat_qq_line()


## ----echo=FALSE, fig.align='center', fig.height=6.5, fig.width=10------------------------------------------
fev %>% 
  ggplot(aes(sample=height, color = sex)) + facet_wrap(vars(sex)) + 
  stat_qq() + stat_qq_line()

