library(data.table)
# ask user to enter a working path
wk_path <- readline("enter a working path: ")

#Change \ to /, note here R always want you double slash
wk_path <- gsub("\\\\","//",wk_path)

n <- 0
c <- 0

setwd(wk_path)
reading_list <- c(3,5,11,12,14,21,29,34,44:46,49,52,53)

#read function to avoid repeating processes
read <- function(path) {
  file  <- fread(path,header = FALSE, stringsAsFactors = FALSE,select = c(1:55),data.table = FALSE)
}

runonce <- function(i) {
  if (n==0) b<-3
  else if(n ==1) b<-4
  else if(n ==2) b<-5 
  else if(n ==3) b<-6 
  
  i <- sprintf("%02d", i)
  b <- sprintf("%02d", b)
  path <- paste("Invoice_00002209BP_",b,i,"14.csv",sep="")
  file_two <- read(path)
  #fileTwo_df <- data.frame(file)
  file <<- rbind(file_two,file)
  #check the progress
  print (i)
  print (nrow(file_two))
  c <<- c+1
}

file <- read("Invoice_00002209BP_030114.csv")

#March
for (i in seq(8, 29, 7)) {
  runonce(i)
}

n <- 1

#April
for (i in seq(5, 26, 7)) {
  runonce(i)
}

n <- n+1

#May
for (i in seq(3, 31, 7)) {
  runonce(i)
}
n <- n+1

#June
for (i in seq(7, 14, 7)) {
  runonce(i)
}

#check whether print enough files
print (c+1)

#add header
header <- fread("ups_bill_csv_header.csv",header = FALSE, stringsAsFactors = FALSE,data.table = FALSE)
header_list <- as.list(as.character(t(header)))

names(file) <- header_list[1:55]

#only keep useful columns
dyson_new <- file[,reading_list]

#delete irrelevant AccountNames
aa <- c()
i <- 0
tcsaccount <- c("000005R505","00001E0R32","0000R0967V")
for (i in 1 : nrow(dyson_new)) {
  if (dyson_new[i,1] %in% tcsaccount) {
    aa <- append(aa,i,after = length(aa))
    i <- i+1
    print (i)
  }
}

dyson_new <- dyson_new[aa,]

#define the tracking # list
aaa <- c()
i <- 0
chargetypecode <- c("003","03","3")
for (i in 1 : nrow(dyson_new)) {
  if (dyson_new[i,10] %in% chargetypecode) {
    aaa <- append(aaa,i,after = length(aaa))
    i <- i+1
    print (i)
  }
}

#the items only contain "003" "03" "3"
dyson_ground <- dyson_new[aaa,]

##list and sort
ground_tracking_list <- sort(unique(dyson_ground$TrackingNumber2))

#print out the effective rows
ground_or_not <- dyson_new[dyson_new[,6] %in% ground_tracking_list,c(2,6,10,11)]

##not used? ???dyson_ground_1 <- dyson_new[ground_or_not,]

write.csv(ground_tracking_list,"ground_list.csv")

##sort by trackingnumber2
dyson_new <- dyson_new[order(dyson_new$TrackingNumber2),]

#output
write.table(dyson_new,"dysonfinal4.csv",row.names = FALSE)

######
## categorize residential and commercial

dyson_temp <- dyson_new[dyson_new[,6] %in% ground_tracking_list,][,c(2,6,10,11)]

dyson_temp <- dyson_temp[order(dyson_new$TrackingNumber2),]


##write.table(dyson_temp,"333.csv",row.names = FALSE)


# in default all should be commercial, if they have "RES" & "COM", then it goes to com;
# if only "RES", goes to res

trial <- data.frame(ground_tracking_list, stringsAsFactors=FALSE)
trial["rorc"] <- NA

corr_f <- function(trackingnumber) {
  res <- 0
  com <- 0
  
  temp <- which(dyson_temp[,2]==trackingnumber)
  begi <- temp[1]
  las <- temp[length(temp)]
 ## print (begi,las)
  for (i in (begi:las)) {
    ## RES + COM --> COM (1,1)
    ## RES --> RES (1,0)
    if (dyson_temp[i,2] =="RES") {res<- res + 1
    }
    else if (dyson_temp[i,2] == "COM") {com <- com + 1
    }
  }
  
  if (res == 0 && com == 1) {
    return ("com")
  }
  else if (res >= 1 && com == 0) {
    return ("res")
  }
  else if (res == 1 && com == 1) {
    return ("com")
  }
  else return("111")
  
}



for (i in 1: nrow(trial)){
    trial[i,2] <- corr_f(trial[i,1])
    print (i)
  }
  
