# install.packages("ggplot2")
wgdata = read.csv("E:/R/R_SCRIPT/data/wg.csv",stringsAsFactors = F)
str(wgdata)
summary(wgdata)
wgclean = wgdata[complete.cases(wgdata),]
summary(wgclean)

##################### Histogram #####################
##### Distribution of Weight Gain 
hist(wgclean$wg,
     main = "Distribution of Weight Gain",
     xlab = "Weight Gain",
     ylab = "Count of Observations/ Frequency",
     col = "green",
     border = "red",
     freq = T,
     breaks = 5)

par(mfrow = c(1,3))
hist(wgclean$wg[wgclean$Gender == "M"])
hist(wgclean$wg[wgclean$Gender == "F"])

#### Boxplot (Tukey's  Box plot) ######
## Also gives distribution graph
###Smiple way of representing a data on aplot in which 
### a rectangle is drawn to represent the second
### second and third quartile (with line inside to show 
# median )
boxplot(wgclean$wg)
# dev.off()
boxplot(wgclean$wg[wgclean$Gender == "M"]
        ,wgclean$wg[wgclean$Gender == "F"])
boxplot(wgclean$wg)

summary(wgclean$wg)
#### median = 15
# 25% 8
Q1st = 8
Q3rd = 20
 
#IQR (Inter Quartile Range)
IQR = Q3rd - Q1st
IQR

### LWL (LOWER Whisker Line)
LWL = Q1st - 1.5*(IQR)
### LWL whisker line formula can return values
## Less than min value of datasets at times
### in such cases we will ignore LWL and take min value
### as LWL
min(wgclean$wg)

### UWL (Upper Whisker Line)
UWL = Q3rd + 1.5*(IQR)
UWL

cond = wgclean$wg >= LWL & wgclean$wg<= UWL
boxplot(wgclean$wg[cond])
#### to relax outliers use range
boxplot(wgclean$wg,range = 2)

### Compare
boxplot(wgclean$wg[wgclean$Gender == "M"]
        ,wgclean$wg[wgclean$Gender == "F"]
        ,names = c("Male","Female")
        ,horizontal = T)
