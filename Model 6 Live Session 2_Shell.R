## Module 6 Live Session #2 Shell Script

#Require ggplot2 and dplyr


#Read in 2016 MLS Players.csv and store as players


#Look at structure of players


##Problem 1 - Convert "#N/A" to "NA" for Minutes and Goals Column
##Problem 2 - Convert "D-M", "M-D" to "D" and "F-M", "M-F", "M/F", "F/M" to "F"  for Pos.

#Convert Minutes,Goals, Pos to character



#Look at structure and levels of Position column


#Create new columns that convert #N/A to NA for minutes and goals
#Also create new column for position as D, M, F, or GK



##Problem 3 Produce a table that shows the average salary by position (D, M, F, GK)

#Convert Pos_new column to factor


#Convert Minutes_new and Goals_new columns to numeric


#Create a table to shows average salary by position and count



##Problem 4 - Show a bar chart of average salaries by position. 




##Problem 5 - Produces a scatter plot of goals (y) vs. salaries (x) for forwards only
 
 #Create a data frame that filters out forwards and complete cases involve goals and base salary

 
 #Look at column names of forwars

 
 #Produce a scatterplot of goals vs. salaries for Forwards
 

## Problem 6 - What is the correlation between goals and salaries for forwards?

 #Attach Forwards data frame

 #Find correlation of Goals vs. Salary
 
 
## Problem 7 - Generate a linear regression model for goals (y) vs. salaries (x) for forward. 
## Present the equation of the line.
 


## Problem 8 - Who are the top 5 overachieving forwards based on actual - predicted goals?
 
 #Append predicted goals and residuals to Forwards data frame

 #Look at column names

 #Change last two columns to "Predicted_Goals" and "Residuals"
 

 #Show the first five rows of the new data frame, sorted in descending order for residuals

 
## Problem 9 - Who are the top 5 underachieving forwards based on actual - predicted goals?
 #Show the first five rows of Forwards_predict, sorted in ascending order
 


 ## Problem 10 - Which team is the most overachieving on the aggregate 
## considering actual - predicted goals?
 
 #Create Teams table which groups aggregate residuals by team


#Show first row of Teams sorted by aggregate residuals in descending order









