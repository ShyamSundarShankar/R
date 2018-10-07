######## Functions ###############
######## R at its core is a functional language.
######## Functions :- Modularity, 
######### Functions are used to modularize the code base
## and divide among developers
#### Code maintenance  : have repeative logic as function

### Pre - defined function 
#### user - defined function

### pre defined 
### primitive, non primitive Functions

is.primitive(sum)
sum

formals(sum)
is.primitive(mean)

#### Any functions will have three different segments
### body, formals, environment

formals(mean)  ### arguments 
body(mean)    ### code logic
environment(mean) ### describes environment 

### return -- A function can return a value.
#### only one return will be used (once control flows to return program 
### terminates)
fn1 = function(ip){
        op = ip/2
        print("hu00")
        print("lok")
        return(op)
        return("op")
}

fn1(5)
formals(fn1)
body(fn1)
environment(fn1)


fn1 = function(ip1,ip2){
        op = ip1+ip2
        return(op)
}

fn1(5,4)
fn1(5)

### Fnctions with default value
fn2 <- function (ip1,ip2 = 0){
        op <- sqrt(ip1+ip2)^2
        return(op)
}
fn2(2)
fn2(NULL)

##### Lazy Evaluation
fn3_lazy = function(ip1,ip2){
        print("Working Fine")
        op = (ip1)*(ip1+2)
        print("Realizes that it did not receive ip2")
        op2 = op/ip2
        return(op2)
}
fn3_lazy(5)


tmpFn1 <- function (xVec){
        if(length(xVec) == 0){
                return("No Value")
        }else{
                xVec^(1:length(xVec))
        }
}
tmpFn1(NULL)
tmpFn1(1:3)


tmpFn2 <- function (xVec){
        n <- length(xVec)
        (xVec^(1:n))/(1:n)
}
tmpFn2(1:3)


tmpFn3 <- function(x,n){
        if (sign(n)==1 && is.integer(n)){
             1 + sum((x^(1:n))/(1:n))    
        } else{
                return("The value passed is not +ve int")
        }
}

##### Free  Variable #####
### Z here is the free variable the value of free variable are searched
## in the environment in which the function was defined, else it will search
## one level up
z = 0
fn4 <- function(x,y){
       # z = 1
         (x^2+y)/z        
}
fn4(2,2)

##### Super Assignment Operator 
#  "<<-"
fn2 <- function (ip1,ip2 = 0){
        op <<- sqrt(ip1+ip2)^2
        return(op)
}
rm(op)
fn2(2,2)
op

###### File Processing ######
acs_preprocessing <- function(fname){
        df = read.csv(fname,
                      stringsAsFactors = F,
                      colClasses = c("GEO.id2"= "character"))
        df_s = df[,c(3,4,6)]
        colnames(df_s) = c("State","TotHH","Income")
        print("State with lowest income")
        print(df_s$State[df_s$Income == min(df_s$Income)])
        print(min(df_s$Income))
}
acs_preprocessing("E:/R/R_Script/data/ACS_08_3YR_S1903.csv")
