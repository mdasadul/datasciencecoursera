complete <- function(directory, id =1:332){
  file_list <-sprintf("%s/%03d.csv",directory,id)
  print(file_list)
  df<-data.frame(id = numeric(0),nobs = numeric(0))
  for(file in file_list){
      data <-read.csv(file)
      df<-rbind(df,data.frame(id=strtoi(substr(file,10,12),10L),nobs=nrow(da<-na.omit(data))))
  }
 print(df)
}