# for TCS mi
library(xlsx)

for (i in 1:7) {
  path <- paste("030",i,".xls",sep="")
  if (file.exists(path) == FALSE) next
  file <- read.xlsx(path,1,startRow=5,header=TRUE,colIndex=c(1,4,12,13,14,15,16),stringsAsFactors = FALSE)

  a <- nrow(file_df)
  fileTwo_df <- data.frame(file)
  
  file_df <<- rbind(fileTwo_df,file_df)
  print (i)
        
}

for (i in 10:31) {
  path <- paste("03",i,".xls",sep="")
  if (file.exists(path) == FALSE) next
  file <- read.xlsx(path,1,startRow=5,header=TRUE,colIndex=c(1,4,12,13,14,15,16),stringsAsFactors = FALSE)
  
  a <- nrow(file_df)
  fileTwo_df <- data.frame(file)
  
  file_df <<- rbind(fileTwo_df,file_df)
  print (i)
  
}

write.table(file_df,"22222.csv")
