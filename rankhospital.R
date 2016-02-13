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
  if(N =="best") N=1
  else if(N=="worst")N=-1

  sdata<-subset(outcome_data, State==state,select=c(Hospital.Name,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failu$
  h_a<-subset(sdata,select = c(Hospital.Name,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack))
  heart_attack<-h_a[order(as.numeric(h_a[,2]),h_a[,1]),][N,]
  h_f<-subset(sdata,select = c(Hospital.Name,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure))
  heart_failure<-h_f[order(as.numeric(h_f[,2]),h_f[,1]),][N,]
  temp_pnu<-subset(sdata,select = c(Hospital.Name,Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
  pneumonia<-temp_pnu[order(as.numeric(temp_pnu[,2]),temp_pnu[,1]),][N,]
  return_state=''

  if(outcome == possible_outcome[1]){

    return_state =heart_attack
    #print(heart_attack)
  } else if(outcome ==possible_outcome[2]){
    return_state = heart_failure
  }else if(outcome ==possible_outcome[3]){
    return_state = pnumonia
  }
  return_state
}

