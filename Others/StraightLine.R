library(xlsx)
library(taRifx.geo)
library(sp)
library(rgeos)


file <-read.xlsx("1111.xlsx",1)
add <- data.frame(file[3])
add[,1] <- as.character(levels(add[,1]))[add[,1]]
add.list <- split(add,rownames(add))

a <- data.frame(Longtitude=0,Latitude=0)
time = 0.5

for (i in 1:length(add.list))
{
  a[i,1] <- geocode(add[i,1])[3]
  a[i,2] <- geocode(add[i,1])[4]
  Sys.sleep(time)
  print(i)
}
a[,3] <- add[1]

write.csv(a,"add.csv")

# sp.mydata<-a
# coordinates(sp.mydata) <- ~Longtitude+Latitude
# 
# for (i in 1:length(a))
# {
#   d <- gDistance(sp.mydata[i]$coordinates,sp.mydata[3]$coordinates,byid=T)
#   a[i,4] <- d
# 
# }
file.2 <- read.csv("add.csv")
file.df <- data.frame(file.2[2],file.2[3],file.2[5],file.2[6])
colnames(file.df) <- c("lon1","lat1","lon2","lat2")

for(i in 1: nrow(file.df))
{
  a.test <- sdist(file.df[i,1],file.df[i,2],file.df[i,3],file.df[i,4])
  file.df[i,5] <- a.test  
}
View(file.df)

write.csv(file.df,"1111.csv")
