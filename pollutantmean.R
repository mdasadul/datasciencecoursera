pollutantmean <- function(directory, pollutant, id =1:332){
  file_list <-sprintf("%s/%03d.csv",directory,id)
  print(file_list)
  dataset <- do.call("rbind",lapply(file_list,
                                    FUN=function(files){read.csv(files,
                                                                   header=TRUE, sep=",")}))
  
  print(summary(dataset))
  }