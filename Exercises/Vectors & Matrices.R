## Creating Vectors - With Ranges, Repeat & Repeat Length ##

OneA = c(1:20) ## Also can be done as 1:20
OneA

OneB = c(20:1)
OneB

OneC = c(1:20, 19:1)
OneC

OneD = c(4, 6, 3)
OneD

OneE = rep(OneD, 10)
OneE

OneF = rep_len(OneD, 31)
OneF

OneG1 = c(rep(4, 10))
OneG2 = c(rep(6, 20))
OneG3 = c(rep(3, 30))
OneG = c(OneG1, OneG2, OneG3)
OneG

## Creating Vectors - Using Paste ##

Two = c(paste("label", 1:30))
Two

## Subsetting Vectors ##

xVec = c(42,85,84,23,11,55,14,96,13,30)
yVec = c(13,8,85,71, 1,7,55, 2,34,24)

ThreeA = xVec > 60
xVec[ThreeA]

ThreeB = yVec < mean(yVec)
yVec[ThreeB]

ThreeC = "Dont know how to solve!"

ThreeD1 = min(xVec)
ThreeD1
ThreeD2 = max(xVec)
ThreeD2
ThreeD = c((xVec > ThreeD1) & xVec < ThreeD2)
xVec[ThreeD]

## Creating Matrix ##
Four1 = c(2, 4, 3)
Four2 = c(1, 5, 7)
Four = rbind(Four1, Four2)
Four

# Extract 1st and 3rd column
FourA = Four[,c(1, 3)]
FourA

# Extract 1st row, 2nd column element
FourB = Four[1,2]
FourB

# Add rownames to the matrix ("row1","row2")
rownames(Four) = c("row1", "row2")
FourC = Four

# Add column names to the matrix ("col1","col2","col3")
colnames(Four) = c("col1", "col2", "col3")
FourD = Four

# Get average of row 1 elements using row name
FourE = mean(Four["row1",])

# Extract elements in matrix A with values greater than or equal to 4
FourF = Four[Four >= 4]