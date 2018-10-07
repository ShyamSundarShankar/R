###### Dplyr ######
library(dplyr)
library(Lahman)
install.packages("Lahman")
colnames(Batting)
colnames(Master)
# colnames(Pitching)
colnames(AwardsPlayers)

class(Batting)
batting <- Batting %>%
        as_tibble() %>%
        select(playerID,yearID,teamID,lgID,G:H)%>%
        arrange(playerID,yearID,teamID)%>%
        semi_join(AwardsPlayers,by = "playerID")

players <- batting %>%
        group_by(playerID)

#### For each player find every year that was good
### than earlier years by number of games played
players%>%
        filter(G > lag(G))%>%
        select(playerID)%>%
        distinct()%>%
        ungroup()%>%
        count()

x <- c(1,1,2,2,2,3)
row_number(x)
min_rank(x)
dense_rank(x)
min_rank(desc(x))
#### for each player , 
#compute average change in games played per year
### mutate -- To add variables
players %>%
        mutate(g_chg = (G-lag(G))/(yearID-lag(yearID)))
        
sample_data <- read.csv("E:/R/R_Script/data/sampledata.csv")
head(sample_data)
tail(sample_data)
### to pick  random n rows
sample_data%>%
        sample_n(3)

#### Remove dups based on multiple variables

sample_data %>%
        distinct(Index,.keep_all = T)

### Select a colum that starts with Y

sample_data%>%
        filter(Y2002 > 200000)%>%
        select(starts_with("Y"))

sample_data%>%
        filter(Y2002 > 200000)%>%
        select(-starts_with("Y"))

#### filter index with a and w
sample_data %>%
        filter(Index %in% c("A","W"))

### 
sample_data %>%
        select(Index,Y2015)%>%
        filter(min_rank(desc(Y2015)) <=3)

### Select State that generated highest income among the 
# Variable Index


sample_data %>%
        group_by(Index)%>%
        filter(min_rank(desc(Y2015))==1)%>%
        select(Index,State,Y2015)
        

x=data.frame(ID = 0:5, ID1= 0:5)
y=data.frame(ID = 1:6,  ID1 = 1:6)

# union --> removes dups, arranges vals in asc order
# union_all --> Doesn't remove dups, prints in same order
# setdiff -- Minus, prints vals in a which is not in b
                        # removes dups, in asc
#intersetct -- Common vals, removes dups, asc ordr
union(x,y)
union_all(x,y)
setdiff(x,y)
setdiff(y,x) 
intersect(x,y)
