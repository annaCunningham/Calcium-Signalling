install.packages("mosaicCalc") # Installing and activating packages required for integration or ODEs.
library(mosaicCalc)

## FUNCTION FOR Y ACTIVATION 
#Y0 is the amount of protein Y when the cell is resting. 
y_activation_function <- function(dataframe, RC_aY = as.numeric(0.1), RC_BY = as.numeric(0.0001), n=as.integer(2), y0=as.numeric(0.01)){
  y_active = list(y0) 
  range = 1:(nrow(dataframe["S"])) 
  
  for(i in range){
    t_dur = list(from=(i-1), to=(i)) # Values calculated for each second change.
    dy_soln = integrateODE(dy~(RC_aY*(S^2)*(1-y)-(RC_BY*y)), RC_aY=RC_aY, RC_BY=RC_BY,y=y0, S=as.numeric(dataframe$S[i]),tdur=t_dur) 
    y0 = dy_soln$y(i) 
    y_active = append(y_active, y0)
  }
  return(head(y_active,-1))
}

## FUNCTION FOR X ACTIVATION 
x_activation_function <- function(dataframe, RC_aX = as.integer(1), 
                                  RC_BX = as.integer(2), Y_t = as.integer(1), x0 = as.numeric(0.01)){
  x_active = list(x0) 
  range = 1:(nrow(dataframe["S"])) 
  
  for(i in range){
    xt_dur = list(from=(i-1), to=(i)) # Values calculated for each second change. 
    dx_soln = integrateODE(dx~RC_aX*Y_t*y*(1-x)-(RC_BX*x), RC_aX=RC_aX, RC_BX=RC_BX, x=x0, Y_t=Y_t, y = dataframe$Y_Values[i], tdur=xt_dur) # Differential equation.
    x0 = dx_soln$x(i) 
    x_active = append(x_active, x0)
  }
  return(head(x_active,-1))
}

# CALCULATING Y_BAR and X_BAR
# Finding the start and end time for an exact period.
# Choosing datapoints from the end of the dataframe as this ensures Y activity is in the "periodic" state.
calculate_average_function = function(start_t1, end_t2, dataframe_values){
  time_range = start_t1:(end_t2-1)
  summation = 0
  n_time = (end_t2-start_t1)
  
  for(i in time_range){
    summation = summation+dataframe_values[i]
  }
  average = summation/n_time 
  return(average)
}
