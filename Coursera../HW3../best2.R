best <- function(state,outcome)
{## Read outcome data
  outcomefile <- read.csv("111.csv",colClasses = "character",na.strings="Not Available")
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
  ## Return Hostpital name n that state with lowest 30-day death
  if (m==0)
  {
    if (outcome == "heart attack")
    {i <-11 }
    else if (outcome == "heart failure")
    {i <-17}
    else if (outcome == "pneumonia")
    {i <-23 }
    newtable <- data.frame(outcomefile[,2],outcomefile[,7],outcomefile[,i])
    colnames(newtable)<- c("Name","State","Rate")
    newtable[,3] <- as.numeric(levels(newtable[,3]))[newtable[,3]]
    newtable <- newtable[complete.cases(newtable),]
    new2 <- newtable[newtable$State==state,]
    new2 <- new2[order(new2$Rate,new2$Name),]
    as.character(new2[1,1])
  }
}
