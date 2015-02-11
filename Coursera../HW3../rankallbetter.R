rankall <- function(outcome, num = "best") {
  
  ## Read outcome data
  ## define all the "Not Available" string as NA
  outcomefile <- read.csv("111.csv",colClasses = "character",na.strings="Not Available")
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
  }

    ## create new data frame and order
    newtable <- data.frame(outcomefile[,2],outcomefile[,7],outcomefile[,i])
    colnames(newtable)<- c("Name","State","Rate")
    newtable[,3] <- as.numeric(levels(newtable[,3]))[newtable[,3]]
    newtable[,1] <- as.character(levels(newtable[,1]))[newtable[,1]]
    newtable[,2] <- as.character(levels(newtable[,2]))[newtable[,2]]
    newtable <- newtable[order(newtable$State,newtable$Rate,newtable$Name),]
  
    ## split data frame based on state name
    st <- split(newtable,newtable$State)
    
    ## create final data frame
    final <- data.frame(matrix(0,ncol =2, nrow =length(st)))
    colnames(final) <- c("Hospital","State")
    for (n in 1 : length(st))
    {
      if (num =="best") 
      {num11=1}
      else if (num =="worst")
      {num11 =nrow(st[[n]])}
      else {num11 = num}
      
      final[n,1] <- st[[n]][num11,1]
      final[n,2] <- st[[n]][1,2]
    }
    
    final
}
