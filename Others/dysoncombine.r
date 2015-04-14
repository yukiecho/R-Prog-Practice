library(data.table)
# ask user to enter a working path
wk_path <- readline("enter a working path: ")

#Change \ to /, note here R always want you double slash
wk_path <- gsub("\\\\","//",wk_path)

n <- 0
c <- 0

setwd(wk_path)
reading_list <- c(3,5,11,12,14,21,29,34,44:46,49,52,53)

#read function to avoid repeating processes
read <- function(path) {
  file  <- fread(path,header = FALSE, stringsAsFactors = FALSE, select = c(1:55), data.table = FALSE)
}

runonce <- function(i) {
  if (n==0) b<-3
  else if(n ==1) b<-4
  else if(n ==2) b<-5 
  
  i <- sprintf("%02d", i)
  b <- sprintf("%02d", b)
  path <- paste("Invoice_00002209BP_",b,i,"14.csv",sep="")
  file_two <- read(path)
  #fileTwo_df <- data.frame(file)
  file <<- rbind(file_two,file)
  #check the progress
  print (i)
  print (nrow(file_two))
  c <<- c+1
}

file <- read("Invoice_00002209BP_030114.csv")
print(nrow(file))

#March
for (i in seq(8, 29, 7)) {
  runonce(i)
}

n <- 1
#April
for (i in seq(5, 26, 7)) {
  runonce(i)
}

n <- 2
#May
for (i in seq(3, 31, 7)) {
  runonce(i)
}

#check whether print enough files
print (c+1)

#output
write.table(file,"finaldyson.csv")
