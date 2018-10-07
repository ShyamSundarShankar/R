##### data frame ### 
## The most important data type for data analytics
### saves ina table format
## but not same as matrix because objects or different class can be saved in a ## dataframe

score_df = data.frame(
        maths_score = c(98,78,58,98,55),
        science_score = c(54,65,65,89,75),
        english_score = c(98,23,98,56,89),
        gender        = c("M","M","F","M","M"),
        fulltime      = c(T,T,T,F,F),
        student_names = c("Raj","Ram","Valli","Steven","Lex")
        
)

class(score_df)
View(score_df)

typeof(score_df)
class(score_df$maths_score)
typeof(score_df$maths_score)
dim(score_df)


###maths_score >80

### list - list 
score_df$maths_score[score_df$maths_score > 80]
### matrix - matrix
score_df[score_df[,"maths_score"] > 80,"maths_score"]
### list - matrix
score_df$maths_score[score_df[,"maths_score"] > 80]
### matrix - list
score_df[score_df$maths_score > 80,"maths_score"]

#### avg enlighs score of students who scored above avg in 
### maths and science

####################### FILE PROCESSING ####################

setwd("E:\\R\\R_Script")
getwd()

income_2008 = read.csv("data/ACS_08_3YR_S1903.csv"
                       ,stringsAsFactors = F
                       ,colClasses = c("GEO.id2" = "character"))
class(income_2008)
# View(income_2008)
str(income_2008)

income_2013 = read.csv("data/ACS_13_5YR_S1903.csv"
                       ,stringsAsFactors = F
                       ,colClasses = c("GEO.id2" = "character"))

str(income_2013)

#### slice 1:7 columns

income_2008_s = income_2008[,1:7]
income_2013_s = income_2013[,1:7]

colnames(income_2008_s) = c("ID","FIPS","State","TotHH","TotHHMOE",
                           "Income","IncomeMOE")

colnames(income_2013_s)  = c("ID","FIPS","State","TotHH","TotHHMOE",
                             "Income","IncomeMOE")


#### state with highest income ###:"??? 
### 
income_2008_s$State[income_2008_s$Income == max(income_2008_s$Income)]

# income2008_s = FIPS Code, TotHH_2008, Income_2008
# income2013_s = FIPS Code, TotHH_2013, Income_2013

income_2008_s = income_2008[,c(2,4,6)]
income_2013_s = income_2013[,c(2,4,6)]

colnames(income_2008_s) = c("FIPS_Code", "TotHH_2008", "Income_2008")
colnames(income_2013_s) = c("FIPS_Code", "TotHH_2013", "Income_2013")


###### Joins ##### 
#### Joins in R is known as MERGE

### Type: Inner, Outer --> Full, Left, Right

#### Inner Join = Only Matched Records
merged_income_inner = merge(income_2008_s,income_2013_s,by = "FIPS Code")
# View(merged_income_inner)

dummy_state1 = data.frame(FIPS_Code = 1236
                          ,TotHH_2008 =56656
                          ,Income_2008 = 16565)
dummy_state2 = data.frame(FIPS_Code = 1238,TotHH_2013 =45565
                          ,Income_2013= 67878)


income_2008_s1 = income_2008_s
income_2013_s1 = income_2013_s
colnames(income_2013_s1)
income_2013_s1 = rbind(income_2013_s1,dummy_state2)
income_2008_s1 = rbind(income_2008_s1,dummy_state1)

nrow(income_2008_s1)

#### Outer Join 
##### Left Outer Join: Matched Records + Unmatched from First DF

merged_income_left = merge(income_2008_s1,income_2013_s1,by = "FIPS_Code"
                           ,all.x= T)
# View (merged_income_left)


## Right Outer Join 
merged_income_right = merge(income_2008_s1,income_2013_s1,by = "FIPS_Code"
                           ,all.y= T)

## full outer join
merged_income_full = merge(income_2008_s1,income_2013_s1,by = "FIPS_Code"
                           ,all= T)



income_2013_s2 = income_2013_s1
income_2008_s2 = income_2008_s1

colnames(income_2013_s2) = c("FIPS_2013", "TotHH_2013", "Income_2013")
colnames(income_2008_s2) = c("FIPS_2008", "TotHH_2008", "Income_2008")

merged_income_full = merge(income_2008_s2,income_2013_s2
                           ,by.x ="FIPS_2008"
                           ,by.y = "FIPS_2013"
                           ,all = T)


#### Exporting data 

getwd()

write.csv(merged_income_full,"data/output1.csv",row.names = F)
write.table(merged_income_full,"data/output2.csv",col.names = F)


library(datasets)
mt = mtcars
ti = Titanic
class(ti)
ti
