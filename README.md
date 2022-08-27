# Calcium-Signalling

DESCRIPTION:

An analysis of how information is encoded within the calcium signature.
Analysis of:
(1) amplitude,
(2) average calcium concentration,
(3) period,
(4) kinetics.

Information for each paramater is contained within a file formatted as "analysing__parameter_parameterValue". 

Three calcium signatures are constructed for (1), (2) and (3); each signature has a different value for the parameter being analysed, while the remianing parameters are maintained. Changes in CDPK, TF activity and subsequent mRNA concentration are calculated. The change in mRNA concentration induced by each graph for a parameter is plotted within a file formatted as "analysing_parameter_mRNA".

Further parameters (4) are analysed by changing the values for parameter values directly involved in the mRNA transcription process. Changes in mRNA concentration and fold change to activity is similarly plotted. 

Calcium signatures are created using an oscillation function, found in oscillation_function. 

A similar format for graphs are maintained by a graphing function, found in graphing_function.

Changes in CDPK and TF activity are calculated from ODE's, found in CDPK_and_TF_activity.

Variable descriptions:
oscillation number == total number of oscillations/period == duration (in seconds) of one oscillation/spike_width == time (seconds) for each peak/time == counts from 0 seconds to end of oscillation (seconds)/max == maximum calcium concentration/min == minimum calcium concentration


RUNNING INSTRUCTIONS:

(1) Run all "function" files first. 
These include: graphing_function, oscillation_function, differential_equations_function,      mRNA_concentration_function.

(2) Run steady_state_mRNA file. 
This calculates [mRNA] from the average calcium concentration of different signatures. 

(3) Run analysing_period_m1 files then plot results using analysing_period_m1_mRNA. 

(4) Run analysing_period_m2 files then plot results using analysing_period_m2_mRNA. 

(5) Run analysing_average files then plot results using analysing_average_mRNA. 

(6) Run analysing_amplitude files then plot results using analysing_amplitude_mRNA. 

(7) Run analysing_kinetics file then plot results using analysing_kinetics_mRNA. 

(8) Run analysing_all files then plot results using analysing_all_mRNA. 

(9) Run analysing_prolonged_signature and analysing_oscillatory_signature then plot results using analysing_signatures_mRNA. 
