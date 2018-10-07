######### Scatter Plot #########
#### Comparing dependent vs idv
wgdata = read.csv("E:/R/R_Script/data/wg.csv",
                  stringsAsFactors = F)
wgclean = wgdata[complete.cases(wgdata),]

str(wgclean)
#### 
# IDV :=  metmin
# Dv  :=  wg

cor()### Correlation between 2 variables
###min Val = -1 0 Max +1
# +1 -> positive correlation
# -1 -> Negative Correlation
# 0  -> No Correlation
cor(wgclean$metmin,wgclean$wg)
plot(wgclean$metmin,wgclean$wg
     ,main = "Comparision of metmin vs wg",
     xlab = "metmin",
     ylab = "wg",
     col = as.factor(wgclean$Gender),
     )

levels(as.factor(wgclean$Gender))

plot(iris)
colnames(iris)
cor(iris$Sepal.Length,iris$Sepal.Width)

# install.packages("corrplot")
library(corrplot)
corrplot(cor(iris[,1:4]),method = "color",
         type = "upper")
formals(corrplot)

points_color = rep("red",nrow(wgclean))
points_color[wgclean$Gender == "M"] ="blue"
plot(wgclean$metmin,wgclean$wg
     ,main = "Comparision of metmin vs wg",
     xlab = "metmin",
     ylab = "wg",
     col = points_color)
points_shape = rep(16,nrow(wgclean))
points_shape[wgclean$Gender == "M"] =15


plot(wgclean$metmin,wgclean$wg
     ,main = "Comparision of metmin vs wg",
     xlab = "metmin",
     ylab = "wg",
     col = points_color
     ,pch = points_shape)
legend(3500,50,legend = c("Male","Female"),
       col = c("red","blue"), pch =15:16, cex = .50)

############# Stock Prices ###################
stock_data = read.csv("E:/R/R_Script/data/Stock_Price.csv")
stock_data


plot(stock_data$Intel, type = "l"
     ,main = "Dell vs Intel Closing Stock price"
     ,col = "blue")
lines(stock_data$DELL,col = "red")
legend ("topright",c("Intel","Dell"),lty = 1,
        col = c("blue","red"))


##### ggplot 
library(ggplot2)
stock_data$Date = seq(as.Date("2018-05-26"),
                      as.Date("2018-05-26")+76-1,"days")
# View(stock_data)
# ###To drop a column
# stock_data$Date = NULL

x <-ggplot (data = stock_data,aes(color = Company))+
        ylab("Closing Stock Price")+
        xlab ("Data/Instances")+
        geom_line(aes(x= Date, y = DELL, color = "DELL"))+
        geom_line(aes(x= Date, y = Intel, color = "Intel"))
x

ggplot(mtcars,aes(x = wt,y = mpg,
                   color = as.factor(cyl))) +geom_point()

str(mtcars)
