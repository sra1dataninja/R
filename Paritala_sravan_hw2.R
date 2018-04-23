### Solution for Homework assignment Table 1- Starts

getwd()

setwd('C:/Users/lavan/Documents/Villanova/MSA 8105/R working Directory')

# Reading the Transactions.csv file from working directory
trns <- read.csv('Transactions.csv')

# Verify the structure of the file
str(trns)

# Verify the first 6 & last 6 rowws of the transactions data that was read
head(trns)
tail(trns)

# check for missin values an remove the missing values from the trns data set
trns[!complete.cases(trns),]
trns <- trns[complete.cases(trns),]

# Final solution to create table 1 i.e. total sales amounts & average sales per trasnaction by 
# product category using the Trasnactions.csv

library(tidyr)
library(dplyr)
# finding total amount by product category
sum <- aggregate( trns$amount ~ trns$prod_cat, trns, sum)

sum <- aggregate(trns$amount, by = list(prd_cat = trns$prod_cat), sum)
# finding average amount spent by prodct category i.e. mean
mean <- aggregate(trns$amount, by = list(prd_cat = trns$prod_cat), mean)


# merging these two data sets
final <- cbind(sum,mean[,2])
colnames(final) <- c("Product Category", "Total Sales","Sales Amount per Transaction")
print(final)

write.table(final)



### Solution for Homework assignment Table 1- End


######################### Table 2 solution Starts ################################################

# Looping through the transactions data and populating the transaction level values based on amount
# Transaction_level will be added as a new column to the trns
for(i in 1:nrow(trns)){
  trns$transaction_level[i] <- if(trns$amount[i] >= 1000) {
    "High"
  } else if(trns$amount[i] >= 100 & trns$amount[i] <= 999 ) {
    "Medium"
  } else {
    "Low"
  } 
}

# Verify the structure of the trns table
str(trns)

# Creating a subset of cc transactions
CC_trns <- subset(trns,trns$payment_method=='CC')

# Creating a data frame with %CC of transactions by Transaction_level
final_2 <- CC_trns %>%
  group_by(CC_trns$transaction_level) %>%
  summarise(n()/length(trns$payment_method))


# Creating a subset of product A,B,C,D transactions
prdt_A_trns <- subset(trns,trns$prod_cat == 'A')
prdt_B_trns <- subset(trns,trns$prod_cat == 'B')
prdt_C_trns <- subset(trns,trns$prod_cat == 'C')
prdt_D_trns <- subset(trns,trns$prod_cat == 'D')

# Creating data frames for each of the product cateogry by transaction level

# For product A
prdt_A_pr <- prdt_A_trns %>%
  group_by(prdt_A_trns$transaction_level)%>%
  summarise(n()/length(trns$payment_method))

prdt_A_pr <- rbind(c("High",0),prdt_A_pr,c("Medium",0))


# For product B
prdt_B_pr <- prdt_B_trns %>%
  group_by(prdt_B_trns$transaction_level)%>%
  summarise(n()/length(trns$payment_method))
prdt_B_pr <- rbind(c("High",0),prdt_B_pr)

# For product C
prdt_C_pr <- prdt_C_trns %>%
  group_by(prdt_C_trns$transaction_level)%>%
  summarise(n()/length(trns$payment_method))


# For product D
prdt_D_pr <- prdt_D_trns %>%
  group_by(prdt_D_trns$transaction_level)%>%
  summarise(n()/length(trns$payment_method))




# Concatenating to form the final result
final_sol <- cbind(final_2,prdt_A_pr[,2],prdt_B_pr[,2],prdt_C_pr[,2],prdt_D_pr[,2])
colnames(final_sol) <- c("Transaction_level","%CC","%A","%B","%C","%D")

# Printing of final solution
print(final_sol)

######################### Table 2 solution Ends ################################################


######################## Table 3 Solution starts ###############################################

str(trns)
# Converting the date column to Date 
trns$trans_dt <- as.Date(trns$trans_dt, format = "%m/%d/%Y")

# Converting the Date column to have date values in month name, day, year format
trns$trans_dt <- format(trns$trans_dt, format = "%B %d %Y")

# Spliting the date column into 3 columns as Month, Day & year
trns <- trns %>% separate(col = trans_dt, into = c("month", "day", "Year"), sep = " ")

# Aggregating sales amount by month
s_month <- aggregate(trns$amount, by = list(month = trns$month), sum)


# Aggregating CC sales amount by month column
CC_trns_month <- subset(trns,trns$payment_method=='CC')
CC_month <- aggregate(CC_trns_month$amount, by = list(month = CC_trns_month$month), sum)

# Next step is to aggregate by transaction amounts by month & product

best_sell <- with(trns,aggregate(trns$amount, list(trns$month, trns$prod_cat), sum))

colnames(best_sell) <- c("month","product","sum")
best_sell <- spread(best_sell,month, sum )

# Find the best selling product by creating a vector
best_sell_prdt <- vector("character", length(12))


best_sell_prdt[1] <- if(max(best_sell[1:4,2]) == max(best_sell[1,2])){
  "A"
} else if(max(best_sell[1:4,2]) == max(best_sell[2,2])) {
  "B"
} else if(max(best_sell[1:4,2]) == max(best_sell[3,2])) {
  "B"
} else {
  "D"
}

best_sell_prdt[2] <- if(max(best_sell[1:4,3]) == max(best_sell[1,3])){
  "A"
} else if(max(best_sell[1:4,3]) == max(best_sell[2,3])) {
  "B"
} else if(max(best_sell[1:4,3]) == max(best_sell[3,3])) {
  "B"
} else {
  "D"
}


best_sell_prdt[3] <- if(max(best_sell[1:4,4]) == max(best_sell[1,4])){
  "A"
} else if(max(best_sell[1:4,4]) == max(best_sell[2,4])) {
  "B"
} else if(max(best_sell[1:4,4]) == max(best_sell[3,4])) {
  "B"
} else {
  "D"
}

best_sell_prdt[4] <- if(max(best_sell[1:4,5]) == max(best_sell[1,5])){
  "A"
} else if(max(best_sell[1:4,5]) == max(best_sell[2,5])) {
  "B"
} else if(max(best_sell[1:4,5]) == max(best_sell[3,5])) {
  "B"
} else {
  "D"
}

best_sell_prdt[5] <- if(max(best_sell[1:4,6]) == max(best_sell[1,6])){
  "A"
} else if(max(best_sell[1:4,6]) == max(best_sell[2,6])) {
  "B"
} else if(max(best_sell[1:4,6]) == max(best_sell[3,6])) {
  "B"
} else {
  "D"
}

best_sell_prdt[6] <- if(max(best_sell[1:4,7]) == max(best_sell[1,7])){
  "A"
} else if(max(best_sell[1:4,7]) == max(best_sell[2,7])) {
  "B"
} else if(max(best_sell[1:4,7]) == max(best_sell[3,7])) {
  "B"
} else {
  "D"
}

best_sell_prdt[7] <- if(max(best_sell[1:4,8]) == max(best_sell[1,8])){
  "A"
} else if(max(best_sell[1:4,8]) == max(best_sell[2,8])) {
  "B"
} else if(max(best_sell[1:4,8]) == max(best_sell[3,8])) {
  "B"
} else {
  "D"
}


best_sell_prdt[8] <- if(max(best_sell[1:4,9]) == max(best_sell[1,9])){
  "A"
} else if(max(best_sell[1:4,9]) == max(best_sell[2,9])) {
  "B"
} else if(max(best_sell[1:4,9]) == max(best_sell[3,9])) {
  "B"
} else {
  "D"
}


best_sell_prdt[9] <- if(max(best_sell[1:4,10]) == max(best_sell[1,10])){
  "A"
} else if(max(best_sell[1:4,10]) == max(best_sell[2,10])) {
  "B"
} else if(max(best_sell[1:4,10]) == max(best_sell[3,10])) {
  "B"
} else {
  "D"
}

best_sell_prdt[10] <- if(max(best_sell[1:4,11]) == max(best_sell[1,11])){
  "A"
} else if(max(best_sell[1:4,11]) == max(best_sell[2,11])) {
  "B"
} else if(max(best_sell[1:4,11]) == max(best_sell[3,11])) {
  "B"
} else {
  "D"
}


best_sell_prdt[11] <- if(max(best_sell[1:4,12]) == max(best_sell[1,12])){
  "A"
} else if(max(best_sell[1:4,12]) == max(best_sell[2,12])) {
  "B"
} else if(max(best_sell[1:4,12]) == max(best_sell[3,12])) {
  "B"
} else {
  "D"
}

best_sell_prdt[12] <- if(max(best_sell[1:4,13]) == max(best_sell[1,13])){
  "A"
} else if(max(best_sell[1:4,13]) == max(best_sell[2,13])) {
  "B"
} else if(max(best_sell[1:4,13]) == max(best_sell[3,13])) {
  "B"
} else {
  "D"
}


# Creating a final table to create table 3 that has total sales, total sales from Credit card 
# & most popular  product of the month

table_3 <- cbind(s_month, CC_month[,2],best_sell_prdt )
colnames(table_3) <- c("Month","Total Sales","Total Sales from Credit Card"," Most popular")

write.table(table_3)



######################## Table 3 Solution ends ###############################################
