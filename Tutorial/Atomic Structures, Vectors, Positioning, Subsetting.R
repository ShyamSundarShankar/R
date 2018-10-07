############### R Programming #########
# in R We have only Single line comment
# R is case sensitive 
# Atomic Classes in R
# numeric, integer, complex, logical,
# character

#### Data types are referred to as class in R

### numeric

v1 = 5   #(general Assignment operator)
v1 <- 5  #(Left Assignment Operator)
5 -> v1  #(Right Assignment Operator)
class(v1)
### variables are referred to as Object in R, 
### or Data structures. Most elementary Object that we can
### create is a vector
is.vector(v1)


#### integer 
v2 = 5L
class(v2)
print(v1)
print(v2)

# v3 = c(1,2,3,4,5,6)
# class(v3)
# 
# v4 = 1:6
# class(v4)
# v3
# v4

v3 = 5.5L
class(v3)

##### complex 
v4 = 2+2i
class(v4)
v4

v5 = 2-2i
class(v5)

v6 = v5*v4
v6
# abs --> absolute
class(abs(v6))

v7 = 10-87i
## to extract real part use Re(), to extract imaginary vals use Im()
Re(v7)
Im(v7)

##### Logical ##### 
### all conditional check in R are logical in nature
 class(5 > 6)

v8 = TRUE #or use T
class(v8)
v8

v9 = FALSE #or use F

v10 = NA
class(v10)

v11 = c(1,NA,5,6)
class(v11)
mean(v11,na.rm = T)

### character ### 
## we can use either '' or "" .

v12 = "God"
v13 = 'God'
v12 == v13
v13
toupper(v12)
tolower(v12)

######## Vector (Array) ######### Single Dimension
##### homogenous collection of values
##### it can hold only values of same data types

ls()  ### list 
### c is known as combine --> to combine indivudual elements
## as vector

v1 = c(1,3,8,0,99,3)
is.vector(v1)
v1

v2 = 1:100
v2

v3 = seq(from = 1, to = 100)
class(v3)

v4 = seq(from = 1, to = 100, by= 1)
v4
class(v4)

#### dummy vector
## rep --> repeat/replicate
v_dummy = rep(NA,10)
v_dummy 


#### length --> to count no. of elements in a vector4
length(v_dummy)
v4

min(v4)
max(v4)
sum(v4)
mean(v4)
median(v4)
sort(v4,decreasing = T)


###### To Extract a single or multiple value in a Vector 
###### is known as Slicing/Subsetting , use [] 
###### to pass argument to a function use ()

v5 = 3:100
length(v5)

### position/Index based slicing/subsetting
v5 [50]
v5 [-50]
v5[1:10]
v5[seq(1,20,2)]
v5[c(1,69,56)]

### 
v5[1:(length(v5)-2)]

########## value based slicing 
v5[v5 == 50]
v5[v5 != 50]

v5[v5 > 50]

#### 
maths_score   = c(90,80,55,66,75)
science_score = c(89,88,65,98,90)
english_score = c(67,68,89,59,90)
gender        = c("M","M","M","F","F")
fulltime      = c(T,T,T,T,F)
student_names  = c("Ram","Raj","Arul","Priya","Suba")

names(maths_score) = student_names
maths_score

names(science_score) = student_names
science_score

names(english_score) = student_names
english_score

names(gender) = student_names
gender

names(fulltime) = student_names
fulltime

names(student_names) = student_names
student_names

#### maths_Score >= 80 
maths_score[maths_score >= 80 ]

#### Avg english score of students who scored above average in
#### maths

mean(english_score[maths_score > mean(maths_score)])

#### english score of students who have scored above 80 in
### math and science 

english_score[maths_score > 80 & science_score > 80]

##### male student avg science score vs female students
mean(science_score[gender == "M"])> 
        mean(science_score[gender == "F"])

### fulltime students science_score
# fulltime == T

science_score[fulltime]
### parttime students science_score
# fulltime == F
science_score[!fulltime]

v1 = 1:5
v2 = 2:3

v1 
v2

v1*v2
