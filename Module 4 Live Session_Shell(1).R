library(tidyr)
library(dplyr)


## Exercise 1 Simple function example ##

#Create a function named "Pythag_c" that finds the length of the hypotenuse of a right triangle
#given the lengths of a and b



## Exercise 2 - Bike Share Problem ##

## Part A - Create a table of customer demand (count variable) where the rows correspond to 
## each month of the year and the columns represent each year. 


#Download Bike Share Demand.csv as my_data

#Check first 6 rows and structure of my_data


#Check for missing values and look to remove those rows since there is very miniscule impact


#Split DateTime column into day, month, day, and Year 

#Convert month into a factor variable and specify that the levels are months

#Spread year column into two columns representing Demand_2011 and Demand_2012

#Rename Demand_2011 and Demand_2012 columns as "2011 Demand" and "2012 Demand" Respectively

#Export the table to your working directory as a .csv files


## Part B - Create a Table that shows the each season of the year - "Winter", "Spring", "Summer", 
## "Fall" as the rows, and shows that most popular month by total demand (between 2011 and 2012)

#Recall original code to remove missing values and split dates. 
 

#Recode Season as "Winter", "Spring", "Summer", "Fall". 


#Check to make sure the loop worked!
  
    
#Replace season vector in my_data with newly created "Season" vector    


#Spread the month columns for demand



#Replace NAs with "0"



#Group by Season and show total Demand by month



#Create a vector Month_high that identifies the highest month of demand for a given season




#Combine Season column from my_table2 and new Month_high vector into 1 table
