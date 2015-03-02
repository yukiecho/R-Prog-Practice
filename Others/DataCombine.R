## for TCS report combine
library(xlsx)
file <- read.xlsx("1.xls",1,startRow=5,header=TRUE,colIndex=c(1,4,12,13,14,15,16))
file[,1] <- as.Date(file[,1],format ="%m/%d/%Y")
file_df <- data.frame(file)

for (i in 2:56) {
  path <- paste(i,".xls",sep="")
  file <- read.xlsx(path,1,startRow=5,header=TRUE,colIndex=c(1,4,12,13,14,15,16))
  
file[,1] <- as.Date(file[,1],format ="%m/%d/%Y")
file[,3] <- as.character(file[,3])
  a <- nrow(file_df)
  fileTwo_df <- data.frame(file)
  
  file_df <- rbind(fileTwo_df,file_df)
  print (i)
        
}

write.table(file_df,"22222.csv")
