# Data Visualizations using ggplots

install.packages("ggplot2")
library(ggplot2)

my_data

qplot(payroll, wins, main ="Wins vs Payroll in MLB") + theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous(labels = scales::dollar)

# Differentiating points by shape  color
qplot(payroll, wins, col= league, shape= division, main ="Wins vs Payroll in MLB") +
theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous(labels = scales::dollar)

# How to create a bar chart for payroll by league

qplot(league, weight = payroll, fill = league, 
      ylab = "payroll", main = "Payroll by league in MLB") +
    theme(plot.title = element_text(hjust=0.5)) + 
  scale_y_continuous(labels = scales:: dollar)

# How to create a stack bar chart for payroll by league

qplot(league, weight = payroll, fill = division, 
      ylab = "payroll", main = "Payroll by league in MLB") +
  theme(plot.title = element_text(hjust=0.5)) + 
  scale_y_continuous(labels = scales:: dollar)



# How to create a bar chart for payroll by league using ggplot

p <- ggplot(my_data, aes(payroll, wins, col = league, shape = division))

p + geom_point() + ggtitle(" Wins vs. payroll in MLB") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_x_continuous(labels =  scales :: dollar) + 
  geom_text(aes(label = ifelse(wins > 90, 
                               as.character(code)," ")), hjust = 0, vjust = 0, size = 3)


# How to create a bar chart for payroll by league using ggplot

p <- ggplot(my_data, aes(league, payroll, fill = league))

p + geom_bar(stat = "identity") + ggtitle("Payroll by League in MLB") + 
  theme(plot.title = element_text(hjust = 0.5)) + scale_y_continuous(labels = scales::dollar)


# How to create a stack bar chart for payroll by league using ggplot

p <- ggplot(my_data, aes(league, payroll, fill = division))

p + geom_bar(stat = "identity") + ggtitle("Payroll by League & Division in MLB") + 
  theme(plot.title = element_text(hjust = 0.5)) + scale_y_continuous(labels = scales::dollar)



# How to create a side by side  bar chart for payroll by league using ggplot

p <- ggplot(my_data, aes(league, payroll, fill = division))

p + geom_bar(stat = "identity", position = "dodge") + ggtitle("Payroll by League & Division in MLB") + 
  theme(plot.title = element_text(hjust = 0.5)) + scale_y_continuous(labels = scales::dollar)


# How to create a chart using facet wrap

p <- ggplot(my_data, aes(payroll, wins, col = league, shape = division))
p + geom_point() + ggtitle("Wins vs. playroll in MLB") +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(size = 7))
 + scale_x_continuous(labels =scales::dollar) + facet_wrap(~league)


### Module 5 lesson ggplot & qplot EDPuzzle Assignment



employees <- read.csv("Employee Data CSV.csv")

str(employees)

## Convert salary to integer
employees$Salary <- as.integer(employees$Salary)

str(employees)

# convert education to ordered factor variable

attach(employees)

# create scatter plot using qplot. 
# qplot is basic and quicck version of ggplot

qplot(Experience, Salary, main = "Salary vs Exp", ylab = "Salary ( in thousands)") +
  theme(plot.title = element_text(hjust = 0.5)) + 
  scale_y_continuous(labels = scales::dollar)

# to show gender & ethnicity in different colors

qplot(Experience, Salary, main = "Salary vs Exp", ylab = "Salary ( in thousands)", col = Gender, shape = Ethnicity) +
  theme(plot.title = element_text(hjust = 0.5)) + 
  scale_y_continuous(labels = scales::dollar)

# Use ggplot to display  a bar chart for avg salary by gender

p <- ggplot(employees, aes(Gender, Salary, fill = Gender), ylab = "Salary in thousands")

p + geom_bar(stat = "Summary", fun.y = "mean") + ggtitle("Average Salary by Gender") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_y_continuous(labels = scales::dollar)


# create a side by side chart of average salary by gender and level of education



p <- ggplot(employees, aes(Gender, Salary, fill = Education), ylab = "Salary in thousands")

p + geom_bar(stat = "Summary", fun.y = "mean", position =  "dodge") + ggtitle("Average Salary by Gender") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_y_continuous(labels = scales::dollar)  

## Create a facet wrap on education bar chart showing average salary by gender

p <- ggplot(employees, aes(Gender, Salary, fill = Gender), ylab = "Salary in thousands")

p + geom_bar(stat = "Summary", fun.y = "mean", position = "dodge") + ggtitle("Average Salary by Gender") +
  theme(plot.title = element_text(hjust = 0.5)) +
  scale_y_continuous(labels = scales::dollar) +
  facet_wrap(~Education)
