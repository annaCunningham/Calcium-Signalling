# FUNCTION CALCULATES RATE CHANGE FOR [mRNA]
mRNA_concentration_function <- function(k_base=0.01, v_max=1, X_conc_value, binding_affinity=1, k_decay=0.1, mRNA_concentration=0.1){
    complex_and_DNA = X_conc_value/binding_affinity
    altered_rate = (v_max * complex_and_DNA) / (1 + complex_and_DNA)
    transcription_rate = k_base + altered_rate
    differential_mRNA_concentration = (transcription_rate - (k_decay*mRNA_concentration))
   return(differential_mRNA_concentration)
}

#FUNCTION THAT CALCULATES STEADY-STATE-[mRNA]
SS_mRNA_concentration <- function(average_calcium){
  t_dur = list(from=(0), to=(1))
  dy_soln = integrateODE(dy~(RC_aY*(S^2)*(1-y)-(RC_BY*y)), RC_aY=as.numeric(0.1), RC_BY=as.numeric(0.0001),y=as.numeric(0.01), S=as.numeric(1),tdur=t_dur) 
  y0 = dy_soln$y(average_calcium) 
  dx_soln = integrateODE(dx~RC_aX*Y_t*y*(1-x)-(RC_BX*x), RC_aX=as.numeric(1), RC_BX=as.numeric(2), x=as.numeric(0.01), Y_t=as.numeric(1), y = 2, tdur=t_dur)
  x0 = dx_soln$x(y0) 
  return(x0)
  }

#FUNCTION THAT CALCULATES FOLD CHANGE 
mRNA_fold_change_function <- function(dataframe, contant_mRNA){
  mRNA_fold_change = (dataframe$mRNA_concentration)/constant_mRNA
  return(mRNA_fold_change)
  }



