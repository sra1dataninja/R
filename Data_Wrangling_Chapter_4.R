## Working with Integers

# create a string of double precision values
dbl_var <- c(1, 2.5, 4.5)
dbl_var

# Placing an L after each values create a string of integers
int_var <- c(1L, 2L, 6L)
int_var

# convert integers to double - precision values
as.double(int_var)

# iddentical to as.double()
as.numeric(int_var)

# converts doubles to integer
