# Read the metropolitan data file
library(magrittr)
library(ggplot2)
getwd()
setwd('C:/Users/lavan/Documents/Villanova/MSA 8105/R working Directory')

my_data <- read.csv("metropolitan.csv")

str(my_data)

dim(my_data)

summary(my_data)

# How to find Pearson coorelation coefficient between two variables
attach(my_data)
cor(CENSUS2010POP,BIRTHS2010)

# how to generate correlation matrix
my_data_numeric <- my_data[,3:11]
round(cor(my_data_numeric),2)

# How to generate a boxplot
my_data_micro <- my_data %>%
                    filter(LSAD == "Metropolitan Statistical Area")

boxplot(my_data_micro$BIRTHS2010, names = 
          c("BIRTHS2010"), show.names  = T, main = "Boxplor of BIRTHS2010")


#How to generate multiple boxplots using ggplot2
p1 <- ggplot(my_data_micro, aes("BRITHS2010", y = BIRTHS2010)) +
            geom_boxplot() +
            ggtitle("Boxplot of BIRTHS2010") +
            theme(plot.title = element_text(hjust = 0.5)) + xlab(" ") + ylab("Counts")

p1

p2 <- ggplot(my_data_micro, aes("DEATHS2010", y= DEATHS2010)) +
                            geom_boxplot() +
                            ggtitle("Boxplot of DEATHS2010") +
                            theme(plot.title = element_text(hjust = 0.5)) +
                            xlab(" ") + ylab("Counts")

grid.arrange(p1,p2,ncol=2)
