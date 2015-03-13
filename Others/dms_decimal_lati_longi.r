library("chron")

## format decimal numbers
specify_decimal <- function(x, k) format(round(x, k), nsmall=k)

## from degree --> decimal
degtodeci <- function(x)
{
  degree <- floor(x/100)
  second <- (x - floor(x))*100
  a <- floor(x)/100 
  # a is a internal variable to get minute
  minute <- 100 * (a - floor(a))
  dd <- degree + minute/60 + second/3600
  dd <- round(dd,digits=4)
  return(dd)
}

## deal with the doc
trans_lati <- function(file_name,output_name)
{
  rawdata <- read.table(file_name,header = FALSE, stringsAsFactors=FALSE)
  col <- matrix(rep(1,2*nrow(rawdata)),nrow=nrow(rawdata),ncol=2)
  rawdata_df <- data.frame(rawdata,col)
  colnames(rawdata_df) <- c("Date","Time","Lati_1","lati_2","Longi_1","Longi_2","Accelerate_X","Accelerate_Y","Accelerate_Z","PM2.5","Temperature","Humidity","Latitude","Longtitude")
  rawdata_df[,1] <- as.factor(rawdata_df[,1])
  rawdata_df[,2] <- times(rawdata_df[,2])
  for (i in 1:nrow(rawdata_df)){
    if (rawdata_df[i,4]== "N")
    {
      rawdata_df[i,13]<- degtodeci(rawdata_df[i,3])
    }
    else {
      rawdata_df[i,13]<- - degtodeci(rawdata_df[i,3])
    }
      
    if (rawdata_df[i,6] =="W")
    {
      rawdata_df[i,14] <- - degtodeci(rawdata_df[i,5])
    }
    else {
      rawdata_df[i,14] <- degtodeci(rawdata_df[i,5])
    }
    
    drops <- c("Lati_1","lati_2","Longi_1","Longi_2")
    rawdata_df[,!(names(rawdata_df)%in% drops)]
    newdata_df <-rawdata_df[,c("Date","Time","Latitude","Longtitude","Accelerate_X","Accelerate_Y","Accelerate_Z","PM2.5","Temperature","Humidity")]
    
    }
  write.table(newdata_df,file=output_name,row.name=F,col.name=F)
}
  
