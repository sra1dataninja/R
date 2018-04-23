library(ggplot2)
library(gridExtra)
library(dplyr)

my_data <- read.csv("autos.csv")


str(my_data)


## Scatter plot vs hoorsepower with linear reggression line without 95%confidence bands
p <- ggplot(my_data, aes(horsepower, price))
p + geom_point() + ggtitle("Price vs Horsepower") + 
  theme(plot.title = element_text(hjust=0.5)) +
  scale_y_continuous(labels= scales::dollar) +
  geom_smooth(method = "lm", se = T)

# Run linear regression of price vs horsepower
attach(my_data)
my_model <- lm(price ~horsepower)
my_model


summary(my_model)

# Regression equation
my_model$coefficients

my_predict <- predict(my_model)
first_six_predict <- data.frame(head(horsepower), head(my_predict))
colnames(first_six_predict) <- c("horsepower", "predicted price")

first_six_predict

# How to find predicted value for horsepower of 150
predict(my_model, data.frame(horsepower = 111))



# How to find predicted value for horsepower of multiple values
predict(my_model, data.frame(horsepower = c(100,150,200)))

# How to add confidenc intervals for multiple horsepower
predict(my_model, data.frame(horsepower = c(100,150,200)), interval = "confidence")

# How to construct a residual plot
my_resids <- data.frame(horsepower, my_model$residuals)
colnames(my_resids) <- c("horsepower", "residuals")
detach(my_data)
attach(my_resids)
p <- ggplot(my_resids, aes(horsepower, residuals))
p + geom_point() + ggtitle("Residuals vs Horsepower") +
  theme(plot.title = element_text(hjust=0.5))

# how to get a residual statistical summary
attach(my_resids)
summary(residuals)
