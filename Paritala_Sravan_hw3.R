library(ggplot2)
library(gridExtra)
library(dplyr)

# Read the 2016 MLS Players.csv into MLS_Player data object

MLS_player <- read.csv("C:/Users/lavan/Documents/Villanova/MSA 8105/R working Directory/2016 MLS Players.csv")

attach(MLS_player)
Player.Name <- paste(First, Last, sep = " ")

MLS_player <- data.frame(Player.Name, MLS_player)
MLS_player

MLS_player[!complete.cases(MLS_player),]

MLS_player <- subset(MLS_player,!Minutes == "#N/A" | !Goals =="#N/A")

MLS_player

sal <- table(MLS_player$Base.Salary, MLS_player$Club)
barplot(sal, main = "Salary", horiz = T, col = c("blue","red","green"))

# Relationship between Base salary & inutes played for all players
cor(MLS_player$Minutes, MLS_player$Base.Salary)

MLS_player_Fwd <- subset(MLS_player, MLS_player$Pos == 'F')



cor(MLS_player_Fwd$Base.Salary, MLS_player_Fwd$Goals)

my_MLS_model <- lm(MLS_player$Base.Salary ~MLS_player$Minutes)

my_MLS_Fwd_model <- lm(MLS_player_Fwd$Base.Salary ~ MLS_player_Fwd$Goals)
summary(my_MLS_model)
summary(my_MLS_Fwd_model)

my_MLS_Fwd_predict_model <- predict(my_MLS_Fwd_model)

str(MLS_player_Fwd)


str(MLS_player)