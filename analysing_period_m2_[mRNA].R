# PLOTTING [mRNA] AND FOLD CHANGE FOR PERIOD METHOD 2.
library("gridExtra")

# Plotting [mRNA].
fig_period50_m2 = graphing_function(fig_15_mRNA_df, fig_15_mRNA_df$x, fig_15_mRNA_df$mRNA_concentration,
                                    "Changing [mRNA]","Time (s)", "[mRNA]") + geom_path(colour="blue4") 
fig_period50_m2

fig_period100_m2 = graphing_function(fig_18_mRNA_df, fig_18_mRNA_df$x, fig_18_mRNA_df$mRNA_concentration,
                                     "Changing [mRNA]", "Time (s)", "[mRNA]") + geom_path(colour="blue4") 
fig_period100_m2

fig_period200_m2 = graphing_function(fig_21_mRNA_df, fig_21_mRNA_df$x, fig_21_mRNA_df$mRNA_concentration,
                                     "Changing [mRNA]", "Time (s)", "[mRNA]") + geom_path(colour="blue4") 
fig_period200_m2

# Plotting fold change.
fig_period50_m2_fold_change = graphing_function(fig_15_mRNA_df, fig_15_mRNA_df$x, fig_15_mRNA_df$fold_change,
                                                "[mRNA]-Fold change","Time (s)", "[mRNA]-fold change") + geom_path(colour="blue4") 
fig_period50_m2_fold_change

fig_period100_m2_fold_change = graphing_function(fig_18_mRNA_df, fig_18_mRNA_df$x, fig_18_mRNA_df$fold_change, 
                                                 "[mRNA]-Fold change", "Time (s)", "[mRNA]-fold change") + geom_path(colour="blue4") 
fig_period100_m2_fold_change

fig_period200_m2_fold_change = graphing_function(fig_21_mRNA_df, fig_21_mRNA_df$x, fig_21_mRNA_df$fold_change,
                                                 "[mRNA]-Fold change", "Time (s)", "[mRNA]- fold change") + geom_path(colour="blue4") 
fig_period200_m2_fold_change
