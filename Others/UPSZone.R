library(xlsx)
list <- read.xlsx("upsrate.xls",1)
list_df <- data.frame(list)
final <- read.xlsx("upsrate.xls",2)
final_df <- data.frame(final)
a <- rep(1,nrows(final_df)
final_df[,"zone"] <- a

for(i in 1:nrow(final_df)){
  interval <- final_df[i,1]-4
  print(i)
  for (j in 1:nrow(list_df)){
    if(list_df[j,3]>=interval){
      final_df[i,2] <- list_df[j,4]
      break    
    }   
  }
}

write.csv(final_df, "zone.csv")
