# Function that generates the values for a piece-wise signature
oscillation_function <- function(time, oscillation_number, period, spike_width, max,min){
  zero_second = 0
  zero_oscillation = ifelse(time >= (zero_second) & time <(spike_width), max, 
                            ifelse(time > (spike_width) & time < (period), min, min))
  all_oscillations = zero_oscillation
  
  if(oscillation_number>1){
    for(count in 1:(oscillation_number-1)){
      all_oscillations <- append(all_oscillations, zero_oscillation)
    } 
  }
  else{
    all_oscillations=all_oscillations
    }
  return(all_oscillations)
}
