# for Massimo Data combine, but you need to change all files' names at first

library (xlsx)

# ask user to enter a working path
wk_path <- readline("enter a working path: ")

#Change \ to /, note here R always want you double slash
wk_path <- gsub("\\\\","//",wk_path)

setwd(wk_path)

file <- read.xlsx("1.xlsx",2,header=TRUE,colIndex=c(7,9,16,30:39,41),stringsAsFactors=FALSE)
file_df <- data.frame(file)

#start to read files
n <- readline("enter how many files: ")
for (i in 2:n) {
  path <- paste(i,".xlsx",sep = "")
  file <- read.xlsx(path,2,header=TRUE,colIndex=c(7,9,16,30:39,41),stringsAsFactors=FALSE)
  
  a <- nrow(file_df)
  fileTwo_df <- data.frame(file)
  
  file_df <- rbind(fileTwo_df,file_df)
  print (i)
    
  }
  
  write.table(file_df,"22222.csv")
  
