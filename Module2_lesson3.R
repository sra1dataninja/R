# How to create a factor string

gender <- factor(c("male", "female","female","male","female" ))
print(gender)

# How too inspect if a factor string
class(gender)

# Not to be confused with type of function
# Vectors are actuall build on integers
typeof(gender)

unclass(gender)

levels(gender)


summary(gender)

# How to specify ordinal levels

income <- factor(c("low", "low", "high", "middle", "high"), 
                levels = c("low", "middle", "high"), ordered = TRUE)
income

reverse_income <- factor(income, levels = rev(levels(income)))
reverse_income

# How to revalue factor levels by using plyr package

install.packages(plyr)

revalue_income <- plyr::revalue(income, 
                                c("low" = "small", "middle" = "medium", "high" = "large"))
revalue_income


# Module 2 Lesson 3 EDPuzzle assignments

## Assume this string of relationship status

status <- c("married", "single", "single", "married", "single")

## convert the status character  string to a factor

status <- as.factor(status)

## Count the number of single  and married members of the set

summary(status)


## Assume a string of ratings 
ratings <- c("2", "5", "3", "4", "5", "5", "4", "3", "5")

## Check the class of data that is within ratings
class(ratings)

## Convert ratings to a factor string reflect on ordinal scale
## 1 is the lowest, 5 is the highest

factor(ratings, levels = c("1", "2", "3", "4", "5"), ordered = TRUE)

## create a factor string called rankigs with the same values  as in ratings
## Make it ordinal, but reverse the order where 1 is the highest and 5 is the lowest

rankings <- factor(ratings, levels = rev(levels(ratings)))
rankings

## For the ratings string, drop 1 as a factor level

ratings <- droplevels(ratings)

