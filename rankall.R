rankall <- function(outcome, num = "best") {
  ## Read outcome data
  ## Read outcome data
  outcome_data<- read.csv("data/outcome-of-care-measures.csv",colClasses = "character")
  possible_outcome<-c("heart attack","heart failure","pneumonia")
  ## Check that state and outcome are valid
  #print(str(outcome_data))
   if( !(outcome %in% possible_outcome)){
    print("invalid outcome")
    stop()
  }
  
  sdata<-subset(outcome_data, select=c(Hospital.Name,State,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
  
  ## For each state, find the hospital of the given rank
  if(outcome=="heart attack"){
    data<-sdata[,c(1,2,3)]
  }else if( outcome == "heart failure"){
    data<-sdata[,c(1,2,4)]
  }else{
    data<-sdata[,c(1,2,5)]
  }
  names(data)[3]<-"Rate"
  data[, 3] = suppressWarnings( as.numeric(data[, 3]) )
  
  data = data[!is.na(data$Rate),]
  
  splitdata = split(data,data$State)
  
  output = lapply(splitdata,function(x,num){
    newdata= x[order(x$Rate,x$Hospital.Name),]
    if(num=="best"){
      num<-1
    }else if(num=="worst"){
      num<-nrow(newdata)
    }
    return(newdata$Hospital.Name[num])
  } ,num
  )
  return(data.frame(hospital=unlist(output),state=names(output)))
         ## Return a data frame with the hospital names and the
         ## (abbreviated) state name
}