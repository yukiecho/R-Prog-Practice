rankhospital <- function(state, outcome, num = "best") {
  ## Read outcome data
  outcomefile <- read.csv("outcome-of-care-measures.csv",colClasses = "character",na.strings="Not Available")
  ## check that state and outcome are valid
  outcomelist <- c("heart attack","heart failure","pneumonia")
  m<- 0
  if (!state %in% unique(outcomefile[,7]))
  {    stop("invalid state")
       m<- 1
  }
  if (!outcome %in% outcomelist) 
  { stop("invalid outcome")
    m<- 1
  }
  ## Return hospital name in that state with the given rank
  ## 30-day death rate
  if (m==0){
    if (outcome == "heart attack")
    {i <-11 }
    else if (outcome == "heart failure")
    {i <-17}
    else if (outcome == "pneumonia")
    {i <-23 }
    newtable <- data.frame(outcomefile[,2],outcomefile[,7],outcomefile[,i])
    colnames(newtable)<- c("Name","State","Rate")
    newtable[,3] <- as.numeric(newtable[,3]) + 10  
    newtable <- newtable[complete.cases(newtable),]
    #index <- which.min(as.double(newtable[,3]))
    new2 <- newtable[newtable$State==state,]
    new2 <- new2[order(new2$Rate,new2$Name),]
    if (num =="best") num=1
    if (num =="worst") num = nrow(new2)
    as.character(new2[num,1])  
    
  }
  
}
