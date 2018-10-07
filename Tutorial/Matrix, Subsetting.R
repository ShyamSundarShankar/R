
# 07-APR-18
###### Matrix ############
###### 2 Dimensional Vector 
###### holds values of same class/data type (homogenous)
###### a matrix is always built using a vector

m1 = matrix(0,nrow = 4,ncol = 5) 
m1

v1 = 1:9

m2 = matrix(v1,3,3)
m2

### by default R will do column filling, to do a row wise filling
#### use byrow = T
m3 = matrix(v1,3,3,byrow = T)
m3

#### t --> transpose
m4 = t(m2)
m4


v1 = 1:13
m5 = matrix(v1,3,3)
m5


v1 = 1:4
m6 = matrix(v1,3,3)
m6

# View(m6)
### attributes of a matrix
dim(m6)
nrow(m6)
ncol(m6)
length(m6)

m1 = matrix(1:25,5,5)
m1

#### slicing in matrix
#### 2nd row and all columns
m1[2,]
#### all rows, 3 column
m1[,3]
#### 1 to 3 row and 2 to 4 cols
m1[1:3,2:5]
##### 1 to 3 rows, 1,3,5 cols
m1[1:3,c(1,3,5)]
#### every alternate row and all cols
m1[seq(1,nrow(m1),by=2),]
#### all rows and every alternate cols
m1[,seq(1,ncol(m1),by=2)]

#### value based slicing
m1[m1 > 5 & m1 < 25]
m1[m1 > 5]
m1[m1 >= 10 ]

m1[2,3]

###### score_matrix
#### binding columns or binding rows
score_mat_rbd = rbind(maths_score,science_score,english_score,student_names)
class(score_mat_rbd)

score_matrix = cbind(maths_score,science_score,english_score)
rownames(score_matrix)
colnames(score_matrix)


m1 = matrix(0,3,3)
m1
### paste is used to concatenate 
rownames(m1) = paste("row",1:3)
m1
colnames(m1) = paste("col",seq(ncol(m1)))
m1

### maths_score > 80 
score_matrix[score_matrix[,"maths_score"] > 80,"maths_score"]

#### avg english score of students who scored above avg in maths
cond = score_matrix[,"maths_score"] > mean(score_matrix[,"maths_score"])
mean(score_matrix[cond,"english_score"])
score_matrix[cond,"maths_score"]

m10 = matrix(1:9, nrow = 3, ncol = 3)
m11 = matrix(10,3,3)
dim(m10)
dim(m11)
# element wise sum
m10 + m11 
m10 * m11

# 3x4 3x4

### matrix multiplication 
m10 %*% m11
