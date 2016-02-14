rankhospital<- function(state,outcome,N){
  outcome_data<- read.csv("data/outcome-of-care-measures.csv",colClasses = "character")
  possible_outcome<-c("heart attack","heart failure","pneumonia")
  ## Check that state and outcome are valid
  #print(str(outcome_data))
  if(!(state %in% outcome_data$State)){
    print("invalid state")
    sys.on.exit()
  }else if( !(outcome %in% possible_outcome)){
    print("invalid outcome")

  }
 

  sdata<-subset(outcome_data, State==state,select=c(Hospital.Name,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
  
  ## For each state, find the hospital of the given rank
  if(outcome=="heart attack"){
    data<-sdata[,c(1,2)]
  }else if( outcome == "heart failure"){
    data<-sdata[,c(1,3)]
  }else{
    data<-sdata[,c(1,4)]
  }
  names(data)[2]<-"Rate"
  data[, 2] = suppressWarnings( as.numeric(data[, 2]) )
  
  data = data[!is.na(data$Rate),]
  
  data<-data[order(data$Rate,data$Hospital.Name),]
  if(N=="best")
    return(data$Hospital.Name[1])
  else if(N=="worst"){
    return(data$Hospital.Name[nrow(data)])
  }else{
    return(data$Hospital.Name[N])
  }
}

