# Using Ca2+ signature with a period of 100, amplitude of 0.52 and 10 oscillations
# Analysing changing kinetics on mRNA transcription 
average_calcium = 0.16
analysing_mRNA_transcription_df = fig_18_mRNA_df
analysing_mRNA_transcription_df = subset (analysing_mRNA_transcription_df, select = -c(mRNA_concentration,fold_change))

# ANALYSING VMAX
analysing_vmax = analysing_mRNA_transcription_df
k_base_adj=0.01
v_max_adj=0.5
binding_affinity_adj=1
k_decay_adj=0.1
mRNA_concentration_adj=0.1
X_conc_value_temp = analysing_vmax$X_concentration

analysing_vmax$mRNA_concentration = mRNA_concentration_function(
  k_base = k_base_adj, v_max = v_max_adj,
  X_conc_value = X_conc_value_temp,
  binding_affinity = binding_affinity_adj,
  k_decay = k_decay_adj,
  mRNA_concentration = mRNA_concentration_adj
  )

X_conc_value_av = SS_mRNA_concentration(average_calcium)
SS_mRNA_temp  = mRNA_concentration_function(k_base = k_base_adj,v_max = v_max_adj,
                                            X_conc_value = X_conc_value_av, 
                                            binding_affinity = binding_affinity_adj,
                                            k_decay = k_decay_adj, 
                                            mRNA_concentration = mRNA_concentration_adj)
analysing_vmax$fold_change = analysing_vmax$X_concentration/SS_mRNA_temp

# ANALYSING KDECAY 
analysing_kdecay = analysing_mRNA_transcription_df
k_base_adj=0.01
v_max_adj=1
X_conc_value_temp = analysing_kdecay$X_concentration
binding_affinity_adj=1
k_decay_adj=0.05
mRNA_concentration_adj=0.1

analysing_kdecay$mRNA_concentration = mRNA_concentration_function(
  k_base = k_base_adj, v_max = v_max_adj,
  X_conc_value = X_conc_value_temp,
  binding_affinity = binding_affinity_adj,
  k_decay = k_decay_adj,
  mRNA_concentration = mRNA_concentration_adj
)

X_conc_value_av = SS_mRNA_concentration(average_calcium)
SS_mRNA_temp  = mRNA_concentration_function(k_base = k_base_adj,v_max = v_max_adj,
                                            X_conc_value = X_conc_value_av, 
                                            binding_affinity = binding_affinity_adj,
                                            k_decay = k_decay_adj, 
                                            mRNA_concentration = mRNA_concentration_adj)
analysing_kdecay$fold_change = analysing_kdecay$X_concentration/SS_mRNA_temp

# ANALYSING BINDING AFFINITY
analysing_binding_affinity = analysing_mRNA_transcription_df
k_base_adj=0.01
v_max_adj=1
X_conc_value_temp = analysing_binding_affinity$X_concentration
binding_affinity_adj=0.5
k_decay_adj=0.1
mRNA_concentration_adj=0.1

analysing_binding_affinity$mRNA_concentration = mRNA_concentration_function(
  k_base = k_base_adj, v_max = v_max_adj,
  X_conc_value = X_conc_value_temp,
  binding_affinity = binding_affinity_adj,
  k_decay = k_decay_adj,
  mRNA_concentration = mRNA_concentration_adj
)

X_conc_value_av = SS_mRNA_concentration(average_calcium)
SS_mRNA_temp  = mRNA_concentration_function(k_base = k_base_adj,v_max = v_max_adj,
                                            X_conc_value = X_conc_value_av, 
                                            binding_affinity = binding_affinity_adj,
                                            k_decay = k_decay_adj, 
                                            mRNA_concentration = mRNA_concentration_adj)
analysing_binding_affinity$fold_change = analysing_binding_affinity$X_concentration/SS_mRNA_temp

# ANALYSING BASE TRANSCRIPTION RATE 
analysing_k_base = analysing_mRNA_transcription_df
k_base_adj=0.005
v_max_adj=1
X_conc_value_temp = analysing_k_base$X_concentration
binding_affinity_adj=1
k_decay_adj=0.1
mRNA_concentration_adj=0.1

analysing_k_base$mRNA_concentration = mRNA_concentration_function(
  k_base = k_base_adj, v_max = v_max_adj,
  X_conc_value = X_conc_value_temp,
  binding_affinity = binding_affinity_adj,
  k_decay = k_decay_adj,
  mRNA_concentration = mRNA_concentration_adj
)

X_conc_value_av = SS_mRNA_concentration(average_calcium)
SS_mRNA_temp  = mRNA_concentration_function(k_base = k_base_adj,v_max = v_max_adj,
                                            X_conc_value = X_conc_value_av, 
                                            binding_affinity = binding_affinity_adj,
                                            k_decay = k_decay_adj, 
                                            mRNA_concentration = mRNA_concentration_adj)
analysing_k_base$fold_change = analysing_k_base$X_concentration/SS_mRNA_temp



