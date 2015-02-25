pollutantmean <- function(directory, pollutant, id = 1:332){
  sssum <- 0
  cccot <- 0
  for (x in id) {
    file <- read.csv(paste(directory, "/", sprintf("%03d", x), ".csv", sep=''),header=TRUE)
      sssum <- sum(file[pollutant],na.rm=TRUE)+sssum
      cccot <- length(which(!is.na(file[pollutant])))+cccot
      }
  filemean <- sssum/cccot
  print(filemean)
}

complete <- function(directory, id = 1:332) {
  j<-1
  obss <- rep(0,length(id))
  for (i in id) {
    file <- read.csv(paste(directory, "/", sprintf("%03d", i), ".csv", sep=''),header=TRUE)
    
    obss[j] <- sum((!is.na(file$sulfate)&!is.na(file$nitrate)))
    j <- j+1
    
  }
  data.frame(id,obss)
}

#test: complete("specdata", 1)
#test2: complete("specdata", 3)
#test3: complete("specdata", 30:25)
#test4:complete("specdata", c(2, 4, 8, 10, 12))


  
corr <- function(directory, threshold = 0) 
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
{
crll <- rep(NA,332)
id <- 1:332
j <- 1
for (x in id) {
  file <- read.csv(paste(directory, "/", sprintf("%03d", x), ".csv", sep=''),header=TRUE)
  if (sum((!is.na(file$sulfate)&!is.na(file$nitrate))) > threshold)
  {crll[j] <- cor(file$sulfate,file$nitrate,use ="complete")
  j<-j+1
}
}
crlll <- na.pass(crll)
}

corr22 <- function(directory, threshold = 0) 
  # the second way for 3rd question
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files
  
  ## 'threshold' is a numeric vector of length 1 indicating the
  ## number of completely observed observations (on all
  ## variables) required to compute the correlation between
  ## nitrate and sulfate; the default is 0
  
  ## Return a numeric vector of correlations
{
  source('~/r/corr.R')
  j <- 1
  filec <-complete(directory)
  filecc <- filec[filec$obss>threshold,]
  crll <- rep(NA,length(filecc$id))
  
  for (x in filecc$id) {
    file <- read.csv(paste(directory, "/", sprintf("%03d", x), ".csv", sep=''),header=TRUE)
    finalfile <-file[((!is.na(file$sulfate))&(!is.na(file$nitrate))),]
    crll[j] <- cor(finalfile$sulfate,finalfile$nitrate,use ="complete")
    j<-j+1
  }
  crll
  
}
