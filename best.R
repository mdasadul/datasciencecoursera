best <- function(state, outcome) {
  ## Read outcome data
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
  ddata<-subset(outcome_data, State==state,select=(Hospital.Name))
  
  sdata<-subset(outcome_data, State==state,select=c(Hospital.Name,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack,Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure, Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia))
  
  heart_attack <-sort(subset(sdata,as.numeric(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack)==min(as.numeric(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack),na.rm=TRUE),select=(Hospital.Name)))
  
  heart_failure <-sort(subset(sdata,as.numeric(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure)==min(as.numeric(Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure),na.rm=TRUE),select=(Hospital.Name)))
  pnumonia <-sort(subset(sdata,as.numeric(Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia)==min(as.numeric(Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia),na.rm=TRUE),select=c(Hospital.Name)))
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