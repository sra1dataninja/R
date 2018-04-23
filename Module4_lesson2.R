# read wide data set

wide <- read.csv("Quarterly Revenue.csv")

setwd("C:/Users/lavan/Documents/Villanova/MSA 8105/R working Directory")
wide

install.packages("tidyr")
library(tidyr)


long <- wide %>% gather(Quarter, Revenue, Qtr.1:Qtr.4)
head(long,15)
long


messy <- read.csv("messy.csv")
messy



messy <- messy %>% separate(col = Group_Ind, into = c("Grp", "Ind"))

messy <- messy %>% separate(col = City_State, into = c("City", "State", sep = "("))

messy

??seperate