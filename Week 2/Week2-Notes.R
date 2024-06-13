## ----echo=FALSE, message=FALSE, warning = FALSE----------------------------------------------
library(tidyverse)
library(knitr)

knitr::knit_hooks$set(purl = knitr::hook_purl)
hook_output = knit_hooks$get('output')
knit_hooks$set(output = function(x, options) {
  # this hook is used only when the linewidth option is not NULL
  if (!is.null(n <- options$linewidth)) {
    x = xfun::split_lines(x)
    # any lines wider than n should be wrapped
    if (any(nchar(x) > n)) x = strwrap(x, width = n)
    x = paste(x, collapse = '\n')
  }
  hook_output(x, options)
})


## ----echo = FALSE----------------------------------------------------------------------------
library(oibiostat)
data("LEAP")

#head(LEAP[,1:4])
#head(LEAP[,5:6])

kableExtra::kable(LEAP[c(1:5,8),], col.names = c("ID", "Treatment", "Age (in Months)", "Sex", "Ethnicity", "Outcome")) 


## ----echo=FALSE------------------------------------------------------------------------------
table(LEAP$treatment.group, LEAP$overall.V60.outcome)

## ----echo=FALSE------------------------------------------------------------------------------
library(ggplot2)

x<- as.data.frame(table(LEAP$treatment.group, LEAP$overall.V60.outcome))


## ----echo=FALSE------------------------------------------------------------------------------
x %>% ggplot(aes(Var2, Freq, fill = Var1)) + geom_bar(stat="identity", width=.5, position = "dodge") + xlab("Outcome") + ylab("Count")  + labs(fill="Treatment Group")


## ----echo=FALSE------------------------------------------------------------------------------
x %>% ggplot(aes(Var2, Freq, fill = Var1)) + geom_bar(stat="identity", width=.5, position = "fill") + xlab("Outcome") + ylab("Count")  + labs(fill="Treatment Group")

## ----echo = FALSE----------------------------------------------------------------------------

kableExtra::kable(LEAP[c(1:4),], col.names = c("ID", "Treatment", "Age (in Months)", "Sex", "Ethnicity", "Outcome")) 


## ----results='asis', echo=FALSE, fig.align='center'------------------------------------------

i1 <- img_modal(src = "../images/Week2/categorical.png", alt = "Categorical Data")

c(str_split(i1, "\\n", simplify = T)[1:2],
  str_split(i1, "\\n", simplify = T)[3:9]
  ) %>% paste(collapse = "\n") %>% cat()


## ----results='asis', echo=FALSE, fig.align='center'------------------------------------------

i2 <- img_modal(src = "../images/Week2/numerical.png", alt = "Numerical Data")

c(str_split(i2, "\\n", simplify = T)[1:2],
  str_split(i2, "\\n", simplify = T)[3:9]
  ) %>% paste(collapse = "\n") %>% cat()


## ----echo = FALSE----------------------------------------------------------------------------
kableExtra::kable(LEAP[c(1:4, 8),], col.names = c("ID", "Treatment", "Age (in Months)", "Sex", "Ethnicity", "Outcome")) 


## ----echo=FALSE, fig.align='center', out.width="80%"-----------------------------------------

knitr::include_graphics("../images/Week2/population_sample.png")


## ----echo=FALSE------------------------------------------------------------------------------

knitr::include_graphics("../images/Week2/sampling.png")



## ----echo=FALSE------------------------------------------------------------------------------

knitr::include_graphics("../images/Week2/ice-cream1.png")


## ----echo=FALSE, results='asis'--------------------------------------------------------------
i2 <- img_modal(src = "../images/Week2/ice-cream2.png", alt = "",other=list(width="50%"))

c(str_split(i2, "\\n", simplify = T)[1:2],
  str_split(i2, "\\n", simplify = T)[3:9]
  ) %>% paste(collapse = "\n") %>% cat()



## ----echo=FALSE------------------------------------------------------------------------------

knitr::include_graphics("../images/Week2/random.png")


