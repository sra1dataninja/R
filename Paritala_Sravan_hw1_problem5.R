##Assume a set of the following objects: a<-"7" b<-"10" c<-2017"
##Write a script that converts a, b, and c to "7/10/2017" and stores it as an object called delivery_date.
##Convert delivery_date into a date.##Assume that 7/16/2017 is the delivery deadline. 
##Show in R the difference between the delivery_deadline and the delivery_date.



################## Problem 5 script begins ######################################


# Input objects
a <- "7"
b <- "10"
c <- "2017"

# Combining input objcts a,b,c to for the date using paste function

delivery_date <- paste(a,b,c, sep = "/")

# printing the delivery date to the console

print(delivery_date)

# converting the delivery_date to date string

delivery_date <- as.Date(delivery_date,  format = "%m/%d/%Y")

# verifying the type and class of delivery_date

typeof(delivery_date)
class(delivery_date)

# assigning delivery_deadline and converting the delivery_deadline to date string

delivery_deadline <- "07/16/2017"
delivery_deadline <- as.Date(delivery_deadline, format = "%m/%d/%Y")

# verifying the type and class of delivery_deadline
typeof(delivery_deadline)
class(delivery_deadline)


# new variable "diff_in_days" to calcualte the difference in days between delivery deadline & delivery date
diff_in_days <- delivery_deadline - delivery_date

#printing the differnce in day to the console. Answer is 6
print(diff_in_days)





######################## Problem 5 scripts ends ###################