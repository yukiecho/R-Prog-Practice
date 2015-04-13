# for Dyson MI & MIL

library(xlsx)
# ask user to enter a working path
wk_path <- readline("enter a working path: ")

#Change \ to /, note here R always want you double slash
wk_path <- gsub("\\\\","//",wk_path)

setwd(wk_path)

n <- 0

file <- read.xlsx("0303.xls",1,startRow=5,header=TRUE,colIndex=c(1,4,12,13,14,15,16),stringsAsFactors = FALSE)
file_df <- data.frame(file)

for (i in 4:31) {
  i <- sprintf("%02d", i)
  path <- paste("03",i,".xls",sep="")
  if (file.exists(path) == FALSE) next
  file <- read.xlsx(path,1,startRow=5,header=TRUE,colIndex=c(1,4,12,13,14,15,16),stringsAsFactors = FALSE)

  a <- nrow(file_df)
  fileTwo_df <- data.frame(file)
  
  file_df <<- rbind(fileTwo_df,file_df)
  #check the progress
  print (i)
  n = n + 1
}
#check the progress
print (n)

# write a function for zone pair
zonetable <- read.csv("C:/Hui Li_2014 Fall/HL/Program/Test/R/zone.csv",1)
zone <- function(subzip){
  a <- which(zonetable[,2]==subzip)
  return (zonetable[a,3])
}

#substring zipcode
file_df["subzip"] <- NA
file_df["zone"] <- NA
file_df$subzip <- substr(file_df$Zip,1,3)

for (i in 1:nrow(file_df)) {
  file_df[i,"zone"] <- zone(file_df[i,"subzip"])
}

write.table(file_df,"summary3.csv")

