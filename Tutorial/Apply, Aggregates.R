########################## Optimized Data Processing ##########################
score_df = data.frame(
        maths_score = c(34,57,89,78,33),
        science_score = c(59,89,54,78,97),
        english_score = c(89,68,90,66,65),
        gender = c("M","M","F","M","M"),
        fulltime  = c(T,T,F,T,F),
        student_names = c("Ram","Raj","Priya","Sam","Sonu")
)

################### Apply Family Functions ################################
#### it is recommended to avoid writing for loops for data processing 
#### instead make use of the available optimized functions for repetative 
#### operations when the dataset size is huge. 
#### R Would internally run the Optimized for loop.
### Vectorized form of apply function, returns the output in Vector
sapply(score_df[,1:3],mean)

#### lapply (list apply, returns the output in list format)
lapply(score_df[,1:3],mean)

###### apply ################# 
#### lapply and sapply will repeat operation across columns
##### apply is generic function which can used to perform 
##### both row wise operation and column wise operation, accepts three arguments
# equvivalent to sapply
apply(score_df[,1:3],2,mean,na.rm = T) ##"2" Stands for column wise operation 
apply(score_df[,1:3],1,mean) ##"1" Stands for row wise operation 

colMeans(score_df[,1:3])
rowMeans(score_df[,1:3])
rowSums(score_df[,1:3])
colSums(score_df[,1:3])

### gender wise average maths score using for loop
genderwise_maths_score= rep(NA,2)
uniq_gender = unique(score_df$gender)
uniq_gender = as.character(uniq_gender)
names(genderwise_maths_score) = uniq_gender
for (gi in uniq_gender){
        genderwise_maths_score[gi] = 
                mean(score_df[score_df$gender == gi,"maths_score"],na.rm = T)
}
genderwise_maths_score

#### tapply 
###  to segment the data based on a column and 
## apply a function on each segment in a repeated manner

tapply(score_df$maths_score,
       score_df$gender,
       mean)
### More than one categorical variable, use key word list in second arg
tapply(score_df$maths_score,
       list(score_df$gender,score_df$fulltime),mean,na.rm = T)

###### split ##########
### segment a dataframe or a vector based on a categorical variable
### output will be a list

genderwise_score = split(score_df,score_df$gender)
genderwise_score

#### aggregate function
## to repeat a function on multiple columns after segmentation of data
### will work for operation on one or many column
## and can be used as alternative to tapply
## output will be dataframe

aggregate(score_df[,1:3],list(Gender = score_df$gender),mean)


aggregate(score_df[,1:3],list(Gender = score_df$gender,Fulltime = 
                                      score_df$fulltime),mean)


################# mtcars ##############
mt = mtcars
colnames(mt)
# average of all columns except am, gear and carb
sapply(mt[,1:8],mean)
# gearwise average mpg
# 2 What is
# a. average mpg for 3 gear cars
# b. average mpg for 4 gear cars
# c. average mpg for 5 gear cars
tapply(mt$mpg,mt$gear,mean)
caggregate(mt$mpg,list (gear =mt$gear),mean)

# gearwise average hp, wt, qsec, vs


# 3 What is
# a. average hp, average wt, average sec, average vs for 3 gear cars
# b. average hp, average wt, average sec, average vs for 4 gear cars
# c. average hp, average wt, average sec, average vs for 5 gear cars
# Save the results together in a matrix or data frame

aggregate(mt[,c(4,6,7,8)],list (gear = mt$gear, am = mt$am),mean)


split(mt,list(mt$gear,mt$am))
