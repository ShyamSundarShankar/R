###### pie chart

plx <- c(21,52,54,30)
lbl <- c("London","Ny","Singapore","Mumbai")
pie(plx,labels,main = "Pie Chart",col = 
            rainbow(length(plx)))

#### pie 3D
# install.packages("plotrix")
library(plotrix)
pie3D(plx,labels =lbl, explode = 0.2,)


##### install.packages("googleVis")
library(googleVis)
df = data.frame (country = c("US","UK","IN"),
                 val1 = c(10,13,15),
                 val2 = c(23,12,65))
#### line Chart
p1 <- gvisLineChart(df)
plot(p1)


####Bar Chart 
p2 <- gvisBarChart(df)
plot(p2)

p3 <- gvisColumnChart(df)
plot(p3)

p4 <- gvisPieChart(df[,1:2])
plot(p4)



p4 <-gvisTable(df)
plot(p4)

CityPopularity

p5 <- gvisGauge(CityPopularity,
                options = list (min = 0,max=800,
                                greenFrom = 500,
                                greenTo = 800,
                                yellowFrom = 300,
                                yellowTo = 500,
                                redFrom = 0, 
                                redTo = 300,
                                width = 1920,
                                height = 1080))
plot(p5)


#### Maps (Filled Map)

Geo <- gvisGeoChart(Exports,locationvar = "Country",colorvar = "Profit")
# colnames(Exports)
plot(Geo)

class(Andrew)
View(Andrew)

#### gvisMap
AndrewMap <- gvisMap(Andrew, "LatLong" , "Tip",
                     options=list(showTip=TRUE,
                                  showLine=TRUE,
                                  enableScrollWheel=TRUE,
                                  mapType='satellite',
                                  useMapTypeControl=TRUE))
plot(AndrewMap)
