##########################################################################
# Instructions

# For this assignment, you have been assigned to a group of 3 or 4 students. 
# Consider your group to be an “analyst team” that is tasked with handling 
# a data set concerning major league soccer player salaries from the 2016 
# season and some key variables including club, position, minutes, and goals. 
# You have been asked to create a PowerPoint presentation that ultimately 
# examines 
# 1. how major league soccer teams allocate their salaries by position
# and 
# 2. addresses the relationship between salaries and minutes played for 
# all players and 
# 3. specifically, the relationship between salaries and 
# goals scored for forwards.

# Your use of visuals will be important to get your message across 
# and ultimately, these executives want to get to the bottom line of 
# 4. how much it costs to “buy goals” from forwards.

# Deliverables
# PowerPoint file and one R script with the underlying code behind the visualizations/analysis in the slides.


# Set working folders
setwd("C:/Users/stmuah/Desktop/Villanova/MSA8105/Group Assignment")

# Load libraries to enable piping, filter, summarise, select and group_by
library(tidyverse)

# load data from file into data frame
raw_data <- read_csv('2016 MLS Players.csv')

# Definitions of 
chart_titles <- c("A: League Salary By Positions (Average Salary)",
                  "A1: League Salary Distribution by Team (Average Salary)",
                  "B: League Salary vs. Minutes Played",
                  "B1: League Salary Correlation to Minutes",
                  "C: League Salary vs. Goals Scored",
                  "D: Average Cost/Goals from Forwards")
chart_caption <- "Source: Group 7 from 'MLS' Dataset"
chart_x_axes <-c("Player Positions","Minutes Played","Goals Scored","Teams")
chart_y_axes <-c("Average Salary x 100","$ per Goal x 100")
legend_titles <-c("Playing Time Rank (min)","Player's Position")

# Functions for munging and cleansing
Min_Category <- function(minutes) {
  ifelse(minutes>=2500,"High (>=2500)",
         ifelse(minutes >=1500 & minutes <2500,"Med (1500 to 2499)", 
                ifelse(minutes >=500 & minutes < 1500,"Low (500 to 1499)","Very Low (Below 500)")))}

Position_Mapping <- function(pos) {
  isForward = (grepl('F',pos) | grepl('F-M',pos) | grepl('M-F',pos) | grepl('M/F',pos) | grepl('F/M',pos))
  isDefenseMidfielder = (grepl('D-M',pos) | grepl('M-D',pos))
  isDefense = (trimws(pos)=='D')
  isGoalie = (trimws(pos) =='GK')
  isMidFielder =(trimws(pos) == 'M')
  ifelse(isForward,"Forward",
         ifelse(isDefenseMidfielder,"Defensive-Midfielder",
                ifelse(isDefense,"Defense",
                       ifelse(isGoalie,"Goalie",
                              ifelse(isMidFielder,"Midfielder","Invalid Position")))))
}

get_LeagueData <-function(wd){
  wd %>% group_by(Club,Player.ID,Player.Pos,Player.Name,MinutesRank) %>%
    summarise(PlayerCount = length(Player.ID),
              TotalSalary = sum(Player.Salary),
              TotalGoals = sum(Goals.Scored),
              TotalMinutes = sum(Minutes.Played),
              Total_Rate_per_Goal=sum(Rate_per_Goal),
              AverageSalary = round(mean(Player.Salary),2),
              AverageGoals = round(mean(Goals.Scored),2),
              AverageMinutes = round(mean(Minutes.Played),2),
              Average_Rate_per_Goal=round(mean(Rate_per_Goal),2))  
}

get_wrangled_data <-function(rd){
  
  rd %>% filter(Goals != "#N/A" | Minutes != "#N/A") %>% 
    mutate(Player.ID = as.integer(`Player ID`),Club =factor(Club),
           Player.Name = paste0(trimws(ifelse(is.na(First),"",First)),' ',trimws(Last)), 
           Player.Salary = as.double(Base.Salary),
           Goals.Scored = as.double(Goals),
           Rate_per_Goal = Player.Salary/ifelse(Goals.Scored>0,Goals.Scored,1),
           Minutes.Played=as.double(Minutes), 
           Player.Pos = Position_Mapping(Pos),
           MinutesRank= Min_Category(Minutes)) %>%
    select(Player.ID,Rate_per_Goal,Club,Player.Name,Player.Salary,Goals.Scored, Minutes.Played,Player.Pos,MinutesRank)
}

plot_Part_A <-function(ld){
  
  Allocation_by_Position <- ld %>% group_by(MinutesRank,Player.Pos) %>%
    summarise(Average.Salary=mean(AverageSalary))
  
  AvgSalary <- ld %>% group_by(Player.Pos) %>%
    summarise(AvgSal = mean(AverageSalary)/100)
  
  PlotPositions_Salaries <- ggplot(data = Allocation_by_Position,
    aes(x=Player.Pos,y= Average.Salary/100,fill=MinutesRank)) + 
    guides(fill=guide_legend(title=legend_titles[1]))+
    xlab(chart_x_axes[1]) + ylab(chart_y_axes[1]) +
    geom_col(position="dodge") + 
    theme(axis.text.x = element_text(angle=45,hjust=.75,vjust=.75)) +
    labs(title=chart_titles[1], caption=chart_caption) +
  geom_text(aes(label = paste0("$",round(Average.Salary/100,0)), 
            y = round(Average.Salary/100,0) + 0.2), 
            position = position_dodge(.9), vjust = -0.25)
  PlotPositions_Salaries  
}

plot_Part_A1 <-function(ld){
  
  Allocation_by_Position <- ld %>% group_by(Club,Player.Pos) %>%
    summarise(Average.Salary=mean(AverageSalary))
  
  AvgSalary <- ld %>% group_by(Player.Pos) %>%
    summarise(AvgSal = mean(AverageSalary)/100)
  
  PlotPositions_Salaries <- ggplot(data = Allocation_by_Position,
                                   aes(x=Club,y= Average.Salary/100)) + 
    guides(fill=guide_legend(title=legend_titles[2]))+
    xlab(chart_x_axes[4]) + ylab(chart_y_axes[1]) +
    geom_col(mapping=aes(fill=Player.Pos)) + 
    theme(axis.text.x = element_text(angle=45,hjust=.75,vjust=.75)) +
    labs(title=chart_titles[2], caption=chart_caption) 

    PlotPositions_Salaries  
}

plot_Part_B <-function(ld){
  Plot_Salary_Minutes <- ggplot(data = ld,  aes(x=TotalMinutes,y=TotalSalary/100)) +
    geom_point(aes(color = Player.Pos,size = TotalGoals))+
    geom_text(data=subset(ld,TotalSalary/100>20000), angle=45, vjust=-1,
              aes(label = Player.Name,x=TotalMinutes,y=TotalSalary/100),
              check_overlap = FALSE,size = 4) +
    labs(title=chart_titles[3], caption=chart_caption) + 
    ylab(chart_y_axes[1]) + 
    xlab(chart_x_axes[2]) 

  Plot_Salary_Minutes  
}

plot_Part_B1 <-function(ld){
  
  Plot_Salary_Minutes <- ggplot(data = subset(ld,TotalSalary/100 <20000),  
                                aes(x=TotalMinutes,y=TotalSalary/100)) +
    geom_point(aes(color = Player.Pos,size = TotalGoals))+
    geom_smooth() +           
    
    labs(title=chart_titles[4], caption=chart_caption) + 
    ylab(chart_y_axes[1]) + 
    xlab(chart_x_axes[2]) 
  
  Plot_Salary_Minutes  
}

plot_Part_C <-function(ld){
  SalaryGoalsForwards <- ld %>% filter(Player.Pos=='Forward')

  Plot_Salary_Goals_Forward <-ggplot(data = SalaryGoalsForwards,
                                     aes(x=TotalGoals,y=TotalSalary/100)) +
    coord_cartesian(xlim=c(0,26),ylim=c(0,max(SalaryGoalsForwards$TotalSalary/100)))+ 
    scale_x_continuous(breaks=seq(0,26,1))+ 
    scale_y_continuous(breaks=seq(0,max(SalaryGoalsForwards$TotalSalary)/100,5000)) +
    geom_point(aes(color = MinutesRank))+
    geom_text( vjust=-.5,data = subset(SalaryGoalsForwards,(TotalGoals > 10 | TotalSalary/100 >15000)),
              aes(label = Player.Name,x=TotalGoals,y=TotalSalary/100),
              check_overlap = FALSE)+
    labs(title=chart_titles[5], caption=chart_caption) +   xlab(chart_x_axes[3]) +
         ylab(chart_y_axes[1]) + guides(color=guide_legend(title=legend_titles[1]))
  
  Plot_Salary_Goals_Forward  
}

plot_Cost_to_buy_goals <-function(ld){
  SummaryForwards <- ld %>% filter(Player.Pos == 'Forward' & TotalGoals > 0) %>%
    group_by(Club) %>%  summarise(AvgSalary = round(mean(TotalSalary),2),  AvgMins = round(mean(TotalMinutes),2),
              AvgGoals = round(mean(TotalGoals),0),  DollarPerGoal = round(sum(TotalSalary)/sum(TotalGoals),2)) 
  
  LPPG <-  round(mean(SummaryForwards$DollarPerGoal)/100,2)
  lbl <- paste0("Average League Price/Goal for Forward: $",LPPG)
  Goals <-mean(SummaryForwards$AvgGoals)
  
  PlotBoughtGoals <- ggplot(data = SummaryForwards) +
    geom_point(aes(x=AvgGoals,y=DollarPerGoal/100,color = Club,size = AvgSalary))+
    geom_text(data = subset(SummaryForwards,DollarPerGoal/100 > 1800),
              aes(x=AvgGoals,y=DollarPerGoal/100,label=Club),nudge_y = 50,nudge_x = .25)+
    geom_smooth(aes(x=AvgGoals,y=DollarPerGoal/100),method="loess",color='red')+
    geom_hline(yintercept = LPPG, size=1,color='blue')+
    geom_text (aes(label=lbl),color='blue',size=5,y=LPPG+10,x=Goals+1.5,vjust=-.3) +
    labs(title=chart_titles[6], caption=chart_caption) + 
    ylab(chart_y_axes[2]) + xlab(chart_x_axes[3])
  
  PlotBoughtGoals 
}

# Get cleaned organized Working data
workingdata <- get_wrangled_data(raw_data)

#Get Summary Datasets (League, Grouped By Teams, Grouped By Positions, Grouped by Team and Positions)
league_data <- get_LeagueData(workingdata)

#Output A: League Salary By Positions (Average Salary)
# league_positions is a dataframe that contains grouped information
# by position irrespective of teams
# added is the distribution within positions of average salaries
# by time on the field
plot_Part_A(league_data)
plot_Part_A1(league_data)

# Output B: Relationship between Salary & Minutes Played
# in the league use working data directly in a scatter xy plot
# to show salary relationship to minutes played
# the chart has an added dimensional measure of goals which is used
# to show the size of the dots
plot_Part_B(league_data)
plot_Part_B1(league_data)

# Output C: Salary versus Goals Scored for forwards
# This shows the relative value or relationship between
# salaries and goals
plot_Part_C(league_data)

# Output D: How much does it cost to buy goals from forwards?
# Shown is also is the generalize relationship in terms of an
# unfitted linear model which shows a general relationship between
# Salary and goals.
# The below chart shows that the value of goals scored, based on the dataset
# diminishes as more goals are scored on average.  Therefore inorder to
# find the 'sweet spot' for what is an ideal cost of buying goals from
# forwards, we have to find the average cost/goal (Rate for Goals)
# Determine the distribution of Goals and the rate of 
# a goal in each grouping.

plot_Cost_to_buy_goals(league_data)
