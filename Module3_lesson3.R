# Handlign missing data

# how to test
# missing values can be recoorded
# how to exclud emissing values

# How to test a vector for missing values

x <- c(1:4, NA, 6:7, NA)

is.na(x)  # to verify which objects contains missing values

which(is.na(x))   # gives the list of missing values

sum(is.na(x))     # counts the number of missing values

df <- data.frame(col1 = c(1:3, NA),
                 col2 = c("this", NA, "is", "text"),
                 col3 = c(TRUE, FALSE, TRUE, TRUE),
                 col4 = c(2.5, 4.2, 3.2, NA),
                 stringsAsFactors = FALSE)

df


is.na(df)

which(is.na(df))

sum(is.na(df))

complete.cases(df)   # this function will reveal which rows are void of NA's

df[complete.cases(df), ]  # this will present only the rows with no NA's at all

df[!complete.cases(df), ]  # this will present only the rows with NA's


############## Recoding of missing values ############################

df$col1[is.na(df$col1)] <- mean(df$col1, na.rm = TRUE)  ## replacing the row 4 column1 with the mean of column 1(first 3 rows)
df

# recode FALSE as NA
df[df == FALSE] <- NA
df

#### Excluding of missing values

mean(df$col4)   # without including, result in NA

mean(df$col4, na.rm = TRUE)




#################### Module 3 Lesson 3 EDPuzzle ##################################

## Create a data frame called my_study whihc contains presidents data set

my_study <- presidents

my_study <- matrix(my_study, nrow = 30, ncol = 4)
my_study <- as.data.frame(my_study)


# Naming the column names
colnames(my_study) <- paste("Q", 1:4, sep="")
my_study


rownames(my_study) <- 1945:1974

# count number of missing values
sum(is.na(my_study))

# which rows contain missing values

my_study[!complete.cases(my_study),]

## Create a new data frame, my_complete_study with the NA's in the  Q1
## replaced with the overall quarterly averages

my_complete_study <- my_study
my_complete_study$Q1[is.na(my_complete_study$Q1)] <- mean(my_complete_study$Q1, na.rm = TRUE)

my_complete_study$Q1 <- as.integer(my_complete_study$Q1)


# Re-do the same for Q2

my_complete_study$Q2[is.na(my_complete_study$Q2)] <- mean(my_complete_study$Q2, na.rm = TRUE)

my_complete_study$Q2 <- as.integer(my_complete_study$Q2)



# Re-do the same for Q4

my_complete_study$Q4[is.na(my_complete_study$Q4)] <- mean(my_complete_study$Q4, na.rm = TRUE)

my_complete_study$Q4 <- as.integer(my_complete_study$Q4)
my_complete_study
sum(is.na(my_complete_study))
# what if I want to calculate the mean of Q1 of my_study

mean(my_study$Q1, na.rm = TRUE)


mean(my_study$Q1)

