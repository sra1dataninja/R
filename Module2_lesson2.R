
# create two character strings

a <- "learning to create"
c <- "character strings"

paste(a,c)

paste("I", "Love", "R")

paste("I", "Love", "R", sep = '_')

# generate character strings sequence characters
paste("R ", 1:3, sep = "version ")

b <- pi
is.character(b)

c <- as.character(b)
is.character(c)
c
is.character(c)
paste(a,c)

a <- "The life of "
d <- paste(a,c)
print(d)

noquote(d)

x <- "learning is fun"
chartr(old = "l", new = "L", x)

companies <- c("Cognizant Technology solutions", "MPhasis limited", "Infosys technologies")
toupper(abbreviate(companies, minlength = 5))


#String split

x <- "I_love_R"
strsplit(x, split = "_")
x


## Module 2 Lesson 2 Assignment Edpuzzle

# let a be a sequence of character strings day1, day2, day3 .. day10

a <- paste("day", 1:10, sep = " ")

# let a be a sequence of character strings Day 1, Day 2, Day 3 .. Day 10
b <- paste("day", 1:10, sep = " ")
?chartr

chartr( old= "d", new ="D", b)

# let c be a character of strings  Day-1, Day-2.. Day-10

c <- chartr(old = "d", new = "D", paste("day", 1:10, sep = "-") )
print(c)

# Convert to uppercase

d <- toupper(c)


# Convert to lowercase
e <- tolower

# let f be repeat function

f <- rep("month-1",10)

print(f)

##let g be  a sequence of character strings month-1 day-1, month-1 day-2 .....

g <- paste(f,e, sep=" ")
print(g)

print(noquote(g))

# let cust_1 be a set contains apples, bananas, pears, avocadoes and grapes
cust_1 <- c("apples", "bananas", "pears", "avocados", "grapes")

# let cust_2 be a set of peaches, avocados, grapes, pears and cherries
cust_2 <- c("peaches", "avocados","grapes", "pears", "cherries")

intersect(cust_1, cust_2)

union(cust_1, cust_2)

setdiff(cust_1, cust_2)

setdiff(cust_2, cust_1)
