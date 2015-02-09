library(datasets)
data(iris)
str(iris)
aa a<- split(iris,iris$Species)
## species is a factor variable with 3 levels
## then aa is a list of 3, each has 5 variables
aa[1]$setosa$Sepal.Length
## you have to reference the "factor" at first and then reference the specific variable
