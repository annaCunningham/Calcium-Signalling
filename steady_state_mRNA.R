# Calculating SSmRNA for different average [Ca2+] levels
k_base=0.01
v_max=1
binding_affinity=1
k_decay=0.1
mRNA_concentration=0.1

# AVERAGE = 0.49
average_calcium = 0.49
X_conc_value = SS_mRNA_concentration(average_calcium)
SS_mRNA_0.49  = mRNA_concentration_function(k_base,v_max,X_conc_value, binding_affinity,k_decay, mRNA_concentration)

# AVERAGE = 0.16
average_calcium = 0.16
X_conc_value = SS_mRNA_concentration(average_calcium)
SS_mRNA_0.16  = mRNA_concentration_function(k_base,v_max,X_conc_value, binding_affinity,k_decay, mRNA_concentration)

# AVERAGE = 0.18
average_calcium = 0.18
X_conc_value = SS_mRNA_concentration(average_calcium)
SS_mRNA_0.18  = mRNA_concentration_function(k_base,v_max,X_conc_value, binding_affinity,k_decay, mRNA_concentration)


# AVERAGE = 0.15
average_calcium = 0.15
X_conc_value = SS_mRNA_concentration(average_calcium)
SS_mRNA_0.15  = mRNA_concentration_function(k_base,v_max,X_conc_value, binding_affinity,k_decay, mRNA_concentration)

# AVERAGE = 0.3
average_calcium = 0.3
X_conc_value = SS_mRNA_concentration(average_calcium)
SS_mRNA_0.3  = mRNA_concentration_function(k_base,v_max,X_conc_value, binding_affinity,k_decay, mRNA_concentration)

# AVERAGE = 0.47
average_calcium = 0.47
X_conc_value = SS_mRNA_concentration(average_calcium)
SS_mRNA_0.47  = mRNA_concentration_function(k_base,v_max,X_conc_value, binding_affinity,k_decay, mRNA_concentration)


