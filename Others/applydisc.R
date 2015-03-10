applydisc <- function(filename,discfile=disc.csv)
  # Create discount table
  disc <- read.csv(discfile, stringsAsFactors = F)
  disc_df <- data.frame(disc)  
  
  file <- read.csv(filename,stringsAsFactors = F)
  file_df <- data.frame(file)
    for (i in 1:nrow(file_df))
    {
      switch(file_df[i]$Code,
             1 = {
               disc <- match(discfile$Code = 1)
               file_df[i]$Adj.Base <- file_df[i]$Base * (1-)
               
               
               
             }
        
        
        
        
        
        )
      
      
      
      
    }
      
