# Loading libraries
library(datasets)

# Assigning mtcars dataset
mt = mtcars

# Checking class & Viewing the loaded dataset
class(mt)
View(mt)

## Actual Workings ##
# Average miles per gallon (mpg) of all cars
AvgMPG = mean(mt$mpg)
AvgMPG

# Average mpg of automatic transmission cars
AvgMPGAuto = mean(mt$mpg[mt$am == 0])
AvgMPGAuto

# Average mpg of manual transmission cars
AvgMPGManu = mean(mt$mpg[mt$am == 1])
AvgMPGManu

# Average Displacement of cars with 4 gears
AvgDis4 = mean(mt$disp[mt$gear == 4])
AvgDis4

# Average Horse power of cars with 3 carb
AvgHP3 = mean(mt$hp[mt$carb == 3])
AvgHP3

# Average mpg of automatic cars with 4 gears
AvgMPGAuto4 = mean(mt$mpg[mt$am == 0 & mt$gear == 4])
AvgMPGAuto4

# Average qsec of cars with mpg above average mpg and weight below average weight
AvgM = mean(mt$mpg)
AvgW = mean(mt$wt)
mean(mt$qsec[AvgM & AvgW])

# Name of the vehicle which has the highest miles per gallon
row.names(mt[max(mt$mpg) == mt$mpg,])

# Name of the vehicle with the highest horsepower
row.names(mt[max(mt$hp) == mt$hp,])

# Mileage and hp of car with highest weight
HighwtCar = row.names(mt[max(mt$wt) == mt$wt,])
mpgHP = mt[HighwtCar,c("mpg", "hp")]
mpgHP

# Average of ratio of mpg to carb
EAvgMPG = mean(mt$mpg)
EAvgCarb = mean(mt$carb)
Eleven = EAvgMPG /  EAvgCarb
Eleven

# Weight of the car with the minimum displacement
TMinDisp = row.names(mt[min(mt$disp) == mt$disp,])
Twelve = mt[TMinDisp, c("wt")]
Twelve

# All columns of 3 gear cars
Thirteen = mt[mt$gear == 3,]
Thirteen

# Mpg, displacement and hp columns of manual transmission cars
Fourteen = mt[mt$am == 0, c("mpg", "disp", "hp")]
Fourteen

# Fifteen - a. average mpg for 3 gear cars
Fifteena = mean(mt$mpg[mt$gear == 3])
Fifteenb = mean(mt$mpg[mt$gear == 4])
Fifteenc = mean(mt$mpg[mt$gear == 5])
Fifteen = c(Fifteena, Fifteenb, Fifteenc)
Fifteen

# Sixteen - a. average hp, average wt, average sec, average vs for 3 gear cars
a = c(mean(mt$mpg[mt$gear == 3]),
      mean(mt$wt[mt$gear == 3]),
      mean(mt$qsec[mt$gear == 3]),
      mean(mt$vs[mt$gear == 3])
)

# Sixteen - b. average hp, average wt, average sec, average vs for 4 gear cars
b = c(mean(mt$mpg[mt$gear == 4]),
      mean(mt$wt[mt$gear == 4]),
      mean(mt$qsec[mt$gear == 4]),
      mean(mt$vs[mt$gear == 4])
)

# Sixteen - c. average hp, average wt, average sec, average vs for 5 gear cars
c = c(mean(mt$mpg[mt$gear == 5]),
      mean(mt$wt[mt$gear == 5]),
      mean(mt$qsec[mt$gear == 5]),
      mean(mt$vs[mt$gear == 5])
)

# Sixteen Answers
Sixteen = rbind(a, b, c)
Sixteen