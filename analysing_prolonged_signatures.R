# PLOTTING [mRNA] AND FOLD CHANGE FOR OSCILLATORY AND PROLONGED SIGNATURES.
library("gridExtra")
signatures_mRNA = data.frame(time = mRNA_piece_wise_0.15_x$x,
                             mRNA_oscillatory = mRNA_piece_wise_0.15_x$mRNA_concentration,
                             mRNA_prolonged = mRNA_prolonged_0.15_x$mRNA_concentration)

signatures_mRNA_fold_change = data.frame(time = mRNA_piece_wise_0.15_x$x,
                                         FC_mRNA_oscillatory = mRNA_piece_wise_0.15_x$fold_change,
                                         FC_mRNA_prolonged = mRNA_prolonged_0.15_x$fold_change)

fig_signatures_mRNA_conc = ggplot(data=signatures_mRNA, mapping = aes(x=time)) +
  geom_line(mapping = aes(y=mRNA_oscillatory, color="Oscillatory")) +
  geom_line(mapping = aes(y=mRNA_prolonged, color="Prolonged")) +
  scale_color_manual(values = c("Oscillatory"="darkslategray","Prolonged"="darkslategray4")) +
  xlab("Time (s)") + ylab(expression(paste("[mRNA] ", mu, "M")))+
  theme(plot.title=element_text(size=10, face="bold"),axis.title.x=element_text(size=9.5),
        axis.title.y=element_text(size=9.5), legend.position = "top", legend.title = element_blank()) 

fig_signatures_FC_mRNA_conc = ggplot(data=signatures_mRNA_fold_change, mapping = aes(x=time)) +
  geom_line(mapping = aes(y=FC_mRNA_oscillatory, color="Oscillatory")) +
  geom_line(mapping = aes(y=FC_mRNA_prolonged, color="Prolonged")) +
  scale_color_manual(values = c("Oscillatory"="darkslategray","Prolonged"="darkslategray4")) +
  xlab("Time (s)") + ylab(expression(paste("[mRNA] ", mu, "M")))+
  theme(plot.title=element_text(size=10, face="bold"),axis.title.x=element_text(size=9.5),
        axis.title.y=element_text(size=9.5), legend.position = "top", legend.title = element_blank()) 

grid.arrange(fig_signatures_mRNA_conc, fig_signatures_FC_mRNA_conc, ncol=2)
tail(signatures_mRNA_fold_change)
