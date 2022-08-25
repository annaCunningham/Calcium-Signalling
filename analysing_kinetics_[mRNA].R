# PLOTTING [mRNA] AND FOLD CHANGE FOR PERIOD KINETIC PARAMETERS
library("gridExtra")
kinetics_mRNA = data.frame(time = analysing_vmax$x,
                           adj_vmax = analysing_vmax$mRNA_concentration,
                           adj_kdecay = analysing_kdecay$mRNA_concentration,
                           adj_binding = analysing_binding_affinity$mRNA_concentration,
                           adj_kbase = analysing_k_base$mRNA_concentration,
                           original = fig_18_mRNA_df$mRNA_concentration)

kinetics_mRNA_fold_change = data.frame(time = analysing_vmax$x,
                                       adj_vmax = analysing_vmax$fold_change,
                                       adj_kdecay = analysing_kdecay$fold_change,
                                       adj_binding = analysing_binding_affinity$fold_change,
                                       adj_kbase = analysing_k_base$fold_change,
                                       original = fig_18_mRNA_df$fold_change)

fig_kinetics_mRNA_conc = ggplot(data=kinetics_mRNA, mapping = aes(x=time)) +
  geom_line(mapping = aes(y=adj_vmax, color="Vmax")) +
  geom_line(mapping = aes(y=adj_kdecay, color="Kdecay")) +
  geom_line(mapping = aes(y=adj_binding, color="Kd"))  +
  geom_line(mapping = aes(y=adj_kbase, color="Kbase"))  +
  geom_line(mapping = aes(y=original, color="Original"))  +
  scale_color_manual(values = c("Vmax"="gray45","Kdecay"="darkblue", "Kd"="black", "Kbase"="darkgreen","Original"="red")) +
  xlab("Time (s)") + ylab(expression(paste("[mRNA] ", mu, "M")))+
  theme(plot.title=element_text(size=10, face="bold"),axis.title.x=element_text(size=9.5),
        axis.title.y=element_text(size=9.5), legend.position = "top", legend.title = element_blank()) 

fig_kinetics_mRNA_fold_change = ggplot(data=kinetics_mRNA_fold_change, mapping = aes(x=time)) +
  geom_line(mapping = aes(y=adj_vmax, color="Vmax")) +
  geom_line(mapping = aes(y=adj_kdecay, color="Kdecay")) +
  geom_line(mapping = aes(y=adj_binding, color="Kd"))  +
  geom_line(mapping = aes(y=adj_kbase, color="Kbase"))  +
  geom_line(mapping = aes(y=original, color="Original"))  +
  scale_color_manual(values = c("Vmax"="gray45","Kdecay"="darkblue", "Kd"="black", "Kbase"="darkgreen","Original"="red")) +
  xlab("Time (s)") + ylab(expression(paste("[mRNA] ", mu, "M")))+
  theme(plot.title=element_text(size=10, face="bold"),axis.title.x=element_text(size=9.5),
        axis.title.y=element_text(size=9.5), legend.position = "top", legend.title = element_blank()) 

grid.arrange(fig_kinetics_mRNA_conc, fig_kinetics_mRNA_fold_change, ncol=2)
tail(kinetics_mRNA_fold_change)