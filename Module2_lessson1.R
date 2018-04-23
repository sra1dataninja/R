my_vec3 <- 1:5
print(my_vec3)

my_vec3 <- c(1:10)
print(my_vec3)

typeof(my_vec3)


seq(from =0, to = 9, by = 3)

seq(1, 20, length.out = 6)

# repeat sequence multiple times
rep(1:4, times = 2)

# generating min & max of numbers of uniform distribution
n <- 2
runif(n, min = 0, max = 10)

# syntax to generate n random numbers using normal distributions
rnorm(n, mean = 0, sd = 1)


# Syntax to set random numbers sees
set.seed(20)
rnorm(n=5, mean = 0, sd = 1)


# Operators
x <- c(1,2,3,4)
y <- c(1,2,3,5)
x == y
# function to give the count of elements that matched between 2 vectors

sum(x == y)

# function to give the list the elements that matched between 2 vectors

which(x == y)

# To identify if two vectors are identical or not
identical(x, y)

# How to round numbers to it's nearest integer
 x <- c(1.27, 2.63, 3.81, 2.15)
 
 round(x)
 
 ceiling(x)
 
 
 floor(x)
 
 
 
 ## Let a be a sequence of integers between 1 and 10
 
 a <- 1:10
 print(a)
 
 ## let b be 10 random draws from a unifrom distribution within min =1 & max = 10
 # set seed to 10
 set.seed = 10
 b <- runif(10, min = 1, max = 10)
 b
 
 
 ## let c be 10 random draws from a normal distribution with
 # mean = 5.5 and SD = 2 with a seed = 10
 
 set.seed(10)
 c <- rnorm(10, mean = 5.5, sd = 2)
 c
 
 ## let d also be a sequence of integers from 1 to 10 using a different R function from object a.
 
 d <- seq(1,10)
 print(d)
 
 ## let e be a double vector
 
 e <- as.double(d)
 print(e)
 
 ## show that a & d are identical
 
 identical(a,d)
 
 
 ## show that a & d are identical or not
 identical(a,e) # e is double vector whereas a is an integer vector
 
 ## show that b & c are double
 
 typeof(b)
 typeof(c)
 
 # round b to the nearest integer and convert into integer
 b <- as.integer(round(b))
 print(b)
 
 # round c to the highest integer and convert into integer
 c <- as.integer(ceiling(c))
 print(c)
 
 is.integer(b)
 is.integer(c)
 
 # show if there is any pairwise values equal between b & c
 
 sum(b == c) 
 
 which(b==c)
 
 print(b)
 print(c)

