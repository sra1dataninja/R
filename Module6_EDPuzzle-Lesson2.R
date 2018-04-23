library(ggplot2)
library(dplyr)

#Import NBA stats data

NBA_data2 <- read.csv("NBA Stats.csv")

str(NBA_data2)

attach(NBA_data2)

Season.Team2 <- paste(Season, Team, sep = " ")

NBA_data2 <- data.frame(Season.Team2, NBA_data2)

detach(NBA_data2)
attach(NBA_data2)

p <-  ggplot(NBA_data2,aes(OffRtg, W))

p + geom_point() + ggtitle("Offratings vs Wins") +
theme(plot.title = element_text(hjust=0.5)) +
  
  geom_smooth(method = "lm")


# Run a linear regression model wins vs Offensive ratings and store in my_model object

attach(NBA_data)
my_model2 <- standardize(lm(W ~ OffRtg), data= train)
my_model2

length(NBA_data$OffRtg)