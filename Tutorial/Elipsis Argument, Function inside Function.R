v1 = 1:10

mean(v1)

median(v1)

v2 = c(v1,1000)

mean(v2)

median(v2)

################### Ellipsis Argument ###################

# # (...)

# The ellipsis argument ... is a powerful way of passing an arbitraty number of

# functions to a lower level function

#### plotting



red.plot <- function(x,y,...){
        
        plot(x,y,col = "red")
        
}



red.plot(2:10,2:10,xlab = "Independent Variable",
         
         ylab = "Dependent Var",
         
         main = "Check")

plot(1:10,1:11,col = "red",xlab = "Independent Variable",
     
     ylab = "Dependent Var",
     
     main = "Check")



####### In R We can have a function within another function

pwr <- function(n){
        
        compute <- function(x){
                
                x^n
                
        }
        
}

s <- pwr(2)

class(s)

s(3)



# Function to get mode

mde <- function(x){
        
        chk_uniq <- unique(x)
        
        chk_uniq[which.max(tabulate(match(x,chk_uniq)))]
        
}



mde(c(1,1,1,2,3,4,5))



#####

a = 10

## to remove all objects from global env

rm(list = ls())

ls()





check <- function(){
        
        if (!exists("a")) {
                
                a<-1
                
        }else {
                
                a <- a+1
                
        }
        
        print(a)
        
}

check()



#### in R we can use user defined fn within predefined fnd

add <- function (x,y){
        
        x+y
        
}

sapply(1:10,add,3)



###########################

f <- function(x){
        
        f <- function(x){
                
                f <- function(x){
                        
                        x^2     
                        
                }
                
                f(x) +1
                
        }
        
        f(x) *2
        
}

f(10)



################## Connecting To Database #################

install.packages("RODBC",dependencies = T)

install.packages("DBI",dependencies = T)

library(RODBC)

library(DBI)





con <-odbcDriverConnect("Driver={Oracle in OraDB12Home1};
                        
                        Dbq=PDBORCL;Uid=hr;Pwd=admin;")





### to check connection parameters

odbcGetInfo(con)



#### List out tables in a specific schema

sqlTables(con,schema = "HR")



### Converting a table in ORacle to R as DF

emp <- sqlQuery(con,"SELECT * FROM HR.EMPLOYEES")

str(emp)

class(emp)