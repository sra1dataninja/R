# How to get current timezone

Sys.timezone()


# How to get current date
Sys.Date()


sys.time()


# How to convert a string in (YYYY-MM-DD) format into a Date

x <- c("2015-07-01", "2015-08-01", "2015-09-01")
as.Date(x)

# How to convert a string in (YYYY-MM-DD) format into a Date of YYYY-MM-DD format


y <- c("07/01/2015", "08/01/2015", "09/01/2015")
as.Date(y, format = "%m/%d/%Y")

# How to create sequence of dates by years
seq(as.Date("2010-1-1"), as.Date("2013-1-1"), by = "years")

# How to create sequence of dates by quarters
seq(as.Date("2010-1-1"), as.Date("2013-1-1"), by = "quarters")

# How to create sequence of dates by days

seq(as.Date("2010-1-1"), as.Date("2010-1-25"), by = "5 days")

# calculate deadline

DeadLine <- as.Date9


### Module 2 Lesson 4 ED Puzzle questions

## Dates are stored in the objects Late_item_dates

Late_item_dates <- c("07/2/2017", "07/6/2017", "07/8/2017", "07/12/2017")

#check the class of Late_item_dates

class(Late_item_dates)

# Convert Late_item_dates to a date string
Late_item_dates <- as.Date(Late_item_dates, format = "%m/%d/%Y")

typeof(Late_item_dates)

class(Late_item_dates)

# How to repeat  2017-07-01 4 times  and convert it to  a Date

Deadline <- as.Date(rep("2017-07-01", 4))

class(Deadline)

## Create a Days_past_due string  which will represent  the days past  the deadline for each item

Days_past_due <- Late_item_dates - Deadline
print(Days_past_due)