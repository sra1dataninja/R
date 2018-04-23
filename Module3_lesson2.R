## Types of Data structures, Vectors, matrices, data frames & lists

# How to identify the structure of an object

str(object)

attributes(object)  # to identify attributed of an object

names(object)  # to assess names of an object

dim(object)   # to assess the dimensions of an object

length(object)  # to identify the length of an object

### Vectors ####

my_vec <- 1:5

my_vec <- as.vector(1:5)

### matrices  ####

my_matrix <- matrix(1:6, nrow = 2, ncol = 3)
my_matrix

# creation of matrix using cbind function

vec1 <- 1:2
vec2 <- 3:4
vec3 <- 5:6

matrix <- cbind(vec1, vec2, vec3)


# creation of matrix using rbind function

vec1 <- c(1,3,5)
vec2 <- c(2,4,6)

matrix_2 <- rbind(vec1, vec2)


##### Data frames #######

vec1 <- 1:3
vec2 <- 4:6
vec3 <- c("Yes", "No", "Yes")

df <- data.frame(vec1, vec2, vec3)
df

# conversion of matrix to data frame

vec1 <- 1:3
vec2 <- 4:6

matrix <- cbind(vec1, vec2)

df <- as.data.frame(matrix)

df


###### Lists #######

vec1 <- 1:3
vec2 <- 4:6

matrix <- cbind(vec1, vec2)
df <- as.data.frame(matrix)

my_list <- list(vec1, matrix, df)

my_list


is.vector(vec1)  # to check if an object is a vector or not

is.matrix(matrix)

is.data.frame(df)

is.list(my_list)


################# Amending data structures ################

# how to add to vectors

vec1 <- 1:3
vec2 <- 4:6
vec1 <- c(vec1, vec2)
vec1 

# adding names within a vector

vec1 <- 1:3
names(vec1) <- c("gold", "silver", "bronze")

vec1

## adding columns to a data frame

df <- data.frame(vec1, vec2, vec3)
x <- c("Bret", "Jill", "Mia")

df2 <- cbind(df, x)

df2

names(df2) <- c("col1", "col2", "col3", "col4")  # addin columns names to data frames
df2

## add rows to data frames

add_df <- data.frame(col1 = 4, col2 = 6, col3 = "No", col4 = "Hero", stringsAsFactors = FALSE)

df3 <- rbind(df2, add_df)
df3

## to add names to rows
rownames(df3) <- c("row1", "row2", "row3", "row4")
df3


############################### Subsetting #############################################

## subsetting with postive integers

my_vec <- 1:10
names(my_vec) <- c("a","b","c","d","e","f","g","h","i","j")
my_vec[2]

my_vec[2:4]

my_vec[c(2,4,6,8)]

my_vec[-1]

my_vec[-c(2,4,6,7,8)]

## subsetting using names

my_vec["b"]

# Subsetting using roww numbers

df3[2:3,]

# subsetting using row names

df3[c("row2", "row3"),]

## Subsetting using columns
df3[, 2:3]


############## Module 3 Lesson 2 EDPuzzle Assignment #################

my_vec1 <- 1:4   # create a vector of integers with an object of my_vec

my_vec2 <- c(3,6,9, 12)   #create a vector with integers 3,6,9,12 and store in object my_vec2

my_matrix <- cbind(my_vec1, my_vec2)
my_matrix

is.matrix(my_matrix)  # verify if my_matrix is a matrix or not

my_vec3 <- c("Low", "Medium", "High", "Low")  

my_vec3 <- factor(my_vec3, levels = c("Low", "Medium", "High"), ordered = TRUE)

my_df <- data.frame(my_vec1, my_vec2, my_vec3)

is.data.frame(my_df)           # to verify if this is a dataframe or not

# examine the underlying structure of data frame(my_df)

str(my_df)

# change the names of columns to Ratings, years and performance

names(my_df) <- c("Ratings", "Years", "Performance")
my_df

# labels  the rows
rownames(my_df) <- c("Bob", "Nancy", "Susan", "Steve")
my_df

# Show only Nancy's row
my_df["Nancy",]

# add new row
my_df <- rbind(my_df, c(3,10, "Medium"))
rownames(my_df)[5] <- "Carl"
my_df

# create a list
my_list <- list(my_vec1, my_vec2, my_vec3, my_matrix, my_df)
my_list

