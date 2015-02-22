library (openxlsx)

file <- read.xlsx("Chen.xlsx",sheet=1)
path <- paste("~/Documents/Coursera/R/new2/","groupname",".txt",sep="")
write.table(file,path,row.name=F,col.name=F)

for (i in 2:174) {
  file <- read.xlsx("Chen.xlsx",sheet=i)
  path <- paste("~/Documents/Coursera/R/new2/",i-1,".txt",sep="")
  write.table(file,path,row.name=F,col.name=F)
  print(i)
}
