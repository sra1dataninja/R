library(ggplot2)
library(gridExtra)
library(dplyr)

## Import NBA stats.csv and store it in as NBA_data

NBA_data <- read.csv("NBA stats.csv")

str(NBA_data)

## attach NBA data
detach(NBA_data)

attach(NBA_data)

# Convert team into a character vector including season tag then add on to the NBA_data

Season.Team <- paste(Season, Team, sep = " ")
NBA_data <- data.frame(Season.Team, NBA_data)


# detach/ reattach 

detach(NBA_data)
attach(NBA_data)

# Show the  offensive rating for the 2015 Golden state warriors

NBA_data$OffRtg[Season.Team == "2015 Golden State Warriors"]

# create two data frames one with team with wins > 41 and wins < 41

Winning_teams <- NBA_data %>% filter(W >=41)
losing_teams <- NBA_data %>% filter(W <=41)

# Show statstical summary of offensive ratins for winning teams
summary(Winning_teams$OffRtg)

# Show statstical summary of offensive ratins for loosing teams
summary(losing_teams$OffRtg)

  
  # show side by side boxplots of winning vs losing teams
  p1 <- ggplot(Winning_teams, aes("Offensive Rate", y = Winning_teams$OffRtg)) +
        geom_boxplot(fill = "blue") +
        ggtitle("Boxplot of offensive rating for winning teams") +
        theme(plot.title = element_text(hjust=0.5)) + xlab(" ") +  ylab("Offensive Ratings")
  
  p2 <- ggplot(losing_teams, aes("Offensive Rate", y = losing_teams$OffRtg)) +
    geom_boxplot(fill = "red") +
    ggtitle("Boxplot of offensive rating for winning teams") +
    theme(plot.title = element_text(hjust=0.5)) + xlab(" ") +  ylab("Offensive Ratings")
  
  grid.arrange(p1, p2)
  
  
  # create a winning vector that shows "YES"  if a team is at or above  41 wins and "NO" if a team is below 41 wiins
  
  Winning <- NULL
              for(i in 1:nrow(NBA_data)){
                output <- ifelse(W[i] >= 41, "YES", "NO")
                Winning <- append(Winning, output)
              }
  
  Winning <- factor(Winning, levels = c("NO", "YES"), ordererd = t)
  
  
  NBA_data$Season.Team[(OffRtg < 95)]
  
  
  standard_OffRtg <- scale(OffRtg)
  NBA_data <- data.frame(NBA_data, standard_OffRtg)
  NBA_data$standard_OffRtg[Season.Team == "2014 Philadelphia 76ers"]
  
  # Show  a histogram of overall offensive ratings and set banwidth = 3
  ggplot(NBA_data, aes(OffRtg, y= ..count..)) + geom_histogram(binwidth = 3, col = "black" )+
  ggtitle("Histogram of offensive Rating") +
    theme(plot.title = element_text(hjust=0.5))
  
  # show a facet wrap of histograms for winning vs losing teams
  ggplot(NBA_data, aes(OffRtg, y = ..count.., fill = Winning)) + 
  geom_histogram(binwidth = 3, col = "black") +
    ggtitle("Histograms of offensive Rating for winning vs Losing teams") +
    theme(plot.title = element_text(hjust=0.5)) +
    facet_wrap(~Winning)
  
  # Correlation between winning & offrating
  cor(W, OffRtg)
  
  # Correlation betweeen winning, offrating & Def rating
  cor(data.frame(W, OffRtg,DefRtg))
  
    
  