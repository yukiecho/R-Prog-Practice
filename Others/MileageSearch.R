library(xlsx)
library(taRifx.geo)

file <-read.xlsx("1-2.xlsx",1)
dataset <- file
nrow(dataset)
disTemp <- matrix(0,nrow=1,ncol=nrow(dataset))
Dis = 0;
time = 0.5
for (i in 1:nrow(dataset))
  {
    Dis <- georoute(c(toString(dataset[i,]$B),toString(dataset[i,]$C)),service="bing",returntype="distance")
    disTemp[1,i]<-Dis[1,1]
    print(i)
    Sys.sleep(time)

  }


workbook.sheets workbook.test addDataFrame(x = sample.dataframe, sheet = workbook.test,
      row.names = FALSE, startColumn = 4) # write data to sheet starting on line 1, column 4
saveWorkbook(workbook.sheets, "test.excelfile.xlsx") # and of course you need to save it.


#write.csv(mymatrix, "test.csv")
#reltl <- (dataset$B,dataset$C,t(disTemp)) 
# t  transpose
