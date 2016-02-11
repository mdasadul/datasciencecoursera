corr <- function(directory, threshold = 0){
  filenames = list.files(path=directory)
  file_list <-sprintf("%03d.csv",filenames)
  print(file_list)
 
  dataset <- do.call("rbind",lapply(file_list,
                                    FUN=function(files){read.csv(files,
                                                                 header=TRUE, sep=",")}))
  
 dataset<-na.omit(dataset)
 
}