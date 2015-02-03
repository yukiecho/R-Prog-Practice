rankall <- function(outcome, num = "best") {

  ## Read outcome data
  ## define all the "Not Available" string as NA
  outcomefile <- read.csv("outcome-of-care-measures.csv",colClasses = "character",na.strings="Not Available")
  ## check that state and outcome are valid
  outcomelist <- c("heart attack","heart failure","pneumonia")
  m<- 0
  if (!outcome %in% outcomelist) 
  { print("invalid outcome")
    m<- 1
  }
  if (m==0){
    if (outcome == "heart attack")
    {i <-11 }
    else if (outcome == "heart failure")
    {i <-17}
    else if (outcome == "pneumonia")
    {i <-23 }

    # create final dataframe
    times <- as.numeric(length(unique(outcomefile[,7])))
    finaltable <- data.frame(rep(NA,times),unique(outcomefile[,7]))
    colnames(finaltable) <- c("hospital","state")  
    finaltable <- finaltable[order(finaltable$state),]
    # extract necessary information from original dataset
    newtable <- data.frame(outcomefile[,2],outcomefile[,7],outcomefile[,i])
    colnames(newtable)<- c("Name","State","Rate")
    newtable[,3] <- as.numeric(newtable[,3]) + 10  
    newtable <- newtable[complete.cases(newtable),]
    #write.table(newtable,"111.txt",sep=" ")
    # start to search for the value one by one
    for (n in 1:times)
    {
    new2 <- newtable[newtable$State==finaltable[n,2],]
    new2 <- new2[order(new2$Rate,new2$Name),]
    #write.table(new2,"222.txt",sep=" ")
    #new2 <- new2[complete.cases(new2),]
    #aa<- num
    if (num =="best") num11=1
    if (num =="worst") num11=nrow(new2)
    finaltable[n,1]<- as.character(new2[num11,1])  
    }
   finaltable  
  }
  }
