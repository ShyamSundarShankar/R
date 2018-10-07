xVec = c(42,85,84,23,11,55,14,96,13,20)
yVec = c(13,8,85,71,1,7,55,2,34,24)
# a) 	Subset xVec with values greater than 60
# b) 	Subset yVec with values less than mean of yVec 
# c)	How many odd numbers in xVec? 
# d)	Subset values in yVec which are between minimum and maximum values of xVec (yes, xVec) 	

v1 = xVec%%2
length(v1[v1==1])
sum(v1 == 1)

v2 = min(xVec)
v3= max(xVec)
yVec[yVec > v2 & yVec < v3]


########### Determinant ##############
m1 = matrix(1:9,3,3)

det(m1)

4,55
6,58

v1 = c(4,55)
v2 = c(6,58)
m3 = rbind(v1,v2)
det(m3)
cbind(m3)
rbind(m3)

############# Coercion ##################
# objects in vectors or matrix should be of same data type
# if given a mix of different data types, R will not throw error
# R will change the data types by itself to one (implicit coercion)

v1 = c("G",2,3,4,T,3+6i,5L)
v1
class(v1)

v2 = c(1,2,T,F,T,F,T,4,5,8,3+6i)
class(v2)
v2

v3 = c(1,3L)
class(v3)

# Explicit Coercion
v4 = c(1,2,3,'4',5)
v4
mean(v4)

mean(as.numeric(v4))

v5 = c(1,'e',4,5,6)
v5        
v6 = as.numeric(v5)
v6

mean(v6,na.rm =T)

v6[is.na(v6)] <- 0
mean(v6)

#### date and Time #####
c1 = '2018-04-08' #%Y-%m-%d
class(c1)
d1 =as.Date(c1)
class(d1)
### use format to extract information from date --> TO_CHAR
as.numeric(format(d1,'%Y%m'))

d2 = '08/04/2018'
d2 =as.Date(d2)
class(d2)
### to change format use strptime --> user_Defined to R format TO_DATE
d3 = strptime(d2,format('%d/%m/%Y'))
class(d3)
## Portable Operating System Interface -> POSIXlt & POSIXct
d4 = Sys.time()
d4
class(d4)
unclass(d4)

d5 = as.POSIXlt(d4)

d6 = unclass(d5)

d7 = '2018-01-14'
d8 = as.Date(d7)
d9 = as.POSIXlt(d8)
d10 = unclass(d9)
d10

d10

#################List ###################
# list supports multiple data types
## disadvantage of list --> is not a table like structure

mix_list = list(1,4,6,'Sasd',3+64i,T,5L)
mix_list
class(mix_list)
typeof(mix_list)

l1 = list(c(1,3,4),5,6,7)
l1[[c(1,2)]]
l1[c(1,2)]
names(l1) = c('A',"B","c","d")
l1
maths_score = c(99,67,89,55,78)
score_list = list(
        maths_score = c(99,67,89,55,78),
        science_score = c(78,86,54,88,92),
        english_score = c(72,39,59,60,90),
        gender = c("M","M","M","F","F"),
        fulltime = c(TRUE,FALSE,TRUE,TRUE,TRUE),
        student_names = c("Rajkumar","Alwin","Saravanan","Priyanka","Mancy")
)
score_list
# View(score_list)

### maths_Score > 80

score_list$maths_score[score_list$maths_score > 80]
dim(score_list)

### avg english score of students who scored above avg in 
## maths
names(score_list$maths_score) = score_list$student_names
score_list$maths_score

mean(score_list$english_score[score_list$maths_score > mean(score_list$maths_score)])
