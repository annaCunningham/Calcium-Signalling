# Calcium-Signalling

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
