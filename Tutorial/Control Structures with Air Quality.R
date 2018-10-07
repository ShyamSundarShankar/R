### next 
for (i in 1:9) {
        if (i == 4){
                next
        }
print(i)
}

####################### air quality ########################
#################### Control Structures ###################3
library(datasets)
aq = airquality
cat(colnames(aq)) 
# Ozone Solar.R Wind Temp Month Day

# Mean of Ozone Solar.R Wind Temp using For loop.
### using position of columns in aq Dataframe
for (i in 1:4){
        print(mean(aq[,i],na.rm = T))
}
### using column positions
for (i in c("Ozone", "Solar.R", "Wind", "Temp")){
        print(mean(aq[,i],na.rm = T))
}

#### store in a vector 
avg_all_cols = NA
for (i in 1:4){
        avg_all_cols[i] = mean(aq[,i],na.rm = T)
}
names(avg_all_cols) = c("Ozone", "Solar.R", "Wind", "Temp")
avg_all_cols
### using column positions
avg_all_cols = rep(NA,4)
names(avg_all_cols) = c("Ozone", "Solar.R", "Wind", "Temp")
for (i in c("Ozone", "Solar.R", "Wind", "Temp")){
        avg_all_cols[i] = mean(aq[,i],na.rm = T)
}
avg_all_cols

#### mean of Ozone, Wind and Temp (using Position and column names)a
avg_3_cols = rep(NA,3)
i.count = 0
names(avg_3_cols) = c("Ozone", "Wind", "Temp")
for (i in c(1,3,4)){
        i.count = i.count +1
        avg_3_cols[i.count] = mean(aq[,i],na.rm = T)
}
avg_3_cols

# average ozone, solar, wind and temp for 8th month
avg_all_cols = NA
for (i in 1:4){
        avg_all_cols[i] = mean(aq[aq$Month == 8,i],na.rm = T)
}
names(avg_all_cols) = c("Ozone", "Solar.R", "Wind", "Temp")
avg_all_cols
View(aq)


### Month wise average temparature output in a named vector
uniq_months = unique(aq$Month)
month_wise_Avg_temp = rep(NA,length(uniq_months))
names(month_wise_Avg_temp) = uniq_months
for (mi in uniq_months){
        month_wise_Avg_temp[as.character(mi)] = mean(aq[aq$Month == mi,"Temp"],
                                                     na.rm = T)
}
month_wise_Avg_temp
### Month wise average "Ozone", "Solar.R", "Wind", "Temp" 
# output in a named MAtrix./dataframe

uniq_months = unique(aq$Month)
coi = c("Ozone", "Solar.R", "Wind", "Temp")
month_wise_avg_all = matrix (NA, nrow = length(uniq_months), 
                             ncol = length(coi))
rownames(month_wise_avg_all) = uniq_months
colnames(month_wise_avg_all) = coi
print(month_wise_avg_all)

for (mi in uniq_months){
        for (ci in coi){
                month_wise_avg_all[as.character(mi),ci] =
                        mean(aq[aq$Month == mi,ci],na.rm = T)
        }
}
month_wise_avg_all
