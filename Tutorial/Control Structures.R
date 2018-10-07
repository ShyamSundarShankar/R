##### Control Instructions /Control Structures ####
# if 
# # if (condition){
#         print('statement')
# }

if (5>8) print("hi")

if (7 <= 8){
        print("Statment True")
}

### nested if
if (8<=9){
        print("Cond1 True")
        if (8>=7){
                print("Cond2 True")
        }
}

### else 
if (8<=7){
        print("True")
} else {
        print("false")
}


#### else if
x = 3
if (x==5){
        print("Val is 5")
} else if (x > 3){
        print ("Val >3")
} else if (x==3){
        print("Cond satified")
} else {
        print("This wont be printed")
}

### ifelse

 ifelse(x==3,T,F)

 v1 = 1:6
v1 
# use "%" odd even 

if (v1%%2 == 0){
        print("even")
} else {
        print("odd")
}

# to do a vectorized operation use ifelse
ifelse(v1%%2 == 0,"even","odd")
## multiple conditons
## && for and condition
# || for OR condition
x= -10
if (x < 0){
        print("Negative Number")
} else if (x > 100){
        print ("large number")
} else if (x > 0 && x < 100){
        print ("valid range")
}
help("&")

#### Looping ####
# while 

## while (cond){
## statment
# }

while (T){
        print('Hi')
}

x = 5 
i.count = 0
while (x<=10){
        print(abs(x))
        x = x-1
        i.count = i.count +1
        if (i.count == 100){
                break
        }
}

### for Loop
for (i in 1:9) {
        print(i)
}

# nested loop (widely used in matrix/ data frame processing)
for (i in 1:9){
        for (j in 9:1){
                print(paste("i:",i,"j:",j))
        }
}


m1 = matrix(0,4,4)
m1

i = NA
j = NA

for (x in seq(nrow(m1))){
        for(y in seq(ncol(m1))){
           i[x] = x
           j[y] = y
           ifelse(i[x] == j[y],m1[x,y] <- 1, m1[x,y] <- 0)
        }
}
m1