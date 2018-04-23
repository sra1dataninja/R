# List all available data sets

data()

BJSales
mtcars
mtcars$mpg

## Module 3 Lesson 1 EDPuzzle

# How to get info about chickweight data set
?ChickWeight

# To store chickweight data into object called my_data

my_data <- ChickWeight

# Importing chichweight.csv but before that make sure that the file is in working directory
getwd()

setwd("C:/Users/lavan/Documents/Villanova/MSA 8105/R working Directory")

my_data2 <- read.csv("Chickweight.csv")

head(my_data)

head(my_data2)


tail(my_data)

head(my_data$Time)

head(my_data2$Time)

tail(my_data2)

