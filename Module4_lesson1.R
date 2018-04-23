# How to create a present value function
 PV <- function(FV, r, n) {
   PV <- FV/(1 + r)^n
   round(PV,2)
 }
 
 # To get body of the function
 body(PV)
 
 # to get arguments of the function
 formals(PV)
 
 # Basic syntax of If Statement
 
 x <- c(8, 3, -2, -5)
 if(any(x < 0)) {
   print("x contains negatives")
 }
 
 x <- c(8, 3, 2, 5)
 if(any(x < 0)) {
   print("x contains negatives")
 } else {
   print("x contains all positives")
 }
 
 # Example of nested statements
 
 x <- 7
 if(x > 10){
   print("x exceeds tolerance")
 }else if(x >=0 & x <= 10){
   print("x is withnin tolerance levels")
 }else {
   print("X is negative")
   
 }
 
 
 # Syntax of for loop
 
 for(i in 2013:2017)
 {
   output <- paste("This year is ",i)
   print(output)
 }
 
 # Example of growing vector
x

# Syntax for filling vector
x <- vector(mode = "character", length = 5)
counter <- 1
for(i in 2013:2017){
  output <- paste("This year is ", i)
  x[counter] <- output
  counter <- counter +1
}
print(x)


# using for loop to fill in matrices

my_mat <- matrix(NA, nrow = 4, ncol = 5)
set.seed(12)
for(i in 1:ncol(my_mat)){
   my_mat[,i] <- round(runif(4, min=0, max = i),2)
}
print(my_mat)

# While loop
counter <-1
while()
  
  # apply loop function
  apply(mtcars, 2, mean)

apply(mtcars, 2, sum)

# rowsums & colsums

# tapply
# how to get mean of the mpg column group by cylinders
tapply(mtcars$mpg, mtcars$cyl, mean)




 