# PLOTTING [mRNA] AND FOLD CHANGE FOR PERIOD METHOD 2
library("gridExtra")
amplitude_mRNA = data.frame(time = fig_24_mRNA_df$x,
                            amplitude0.2 = fig_24_mRNA_df$mRNA_concentration,
                            amplitude0.7 = fig_27_mRNA_df$mRNA_concentration,
                            amplitude1.2 = fig_30_mRNA_df$mRNA_concentration)

amplitude_mRNA_fold_change = data.frame(time = fig_24_mRNA_df$x,
                                        amplitude0.2 = fig_24_mRNA_df$fold_change,
                                        amplitude0.7 = fig_27_mRNA_df$fold_change,
                                        amplitude1.2 = fig_30_mRNA_df$fold_change)

fig_amplitude_mRNA_conc = ggplot(data=amplitude_mRNA, mapping = aes(x=time)) +
  geom_line(mapping = aes(y=amplitude0.2, color="0.2  ")) +
  geom_line(mapping = aes(y=amplitude0.7, color="0.7  ")) +
  geom_line(mapping = aes(y=amplitude1.2, color="1.2  "))  +
  scale_color_manual(values = c("0.2  "="darkslategray","0.7  "="darkslategray4", "1.2  "="darkslategray3")) +
  xlab("Time (s)") + ylab(expression(paste("[mRNA] ", mu, "M"))) +
  theme(plot.title=element_text(size=10, face="bold"),axis.title.x=element_text(size=9.5),
        axis.title.y=element_text(size=9.5), legend.position = "top", legend.title = element_blank()) 

fig_amplitude_mRNA_fold_change = ggplot(data=amplitude_mRNA_fold_change, mapping = aes(x=time)) +
  geom_line(mapping = aes(y=amplitude0.2, color="0.2  ")) +
  geom_line(mapping = aes(y=amplitude0.7, color="0.7  ")) +
  geom_line(mapping = aes(y=amplitude1.2, color="1.2  ")) +
  scale_color_manual(values = c("0.2  "="darkslategray","0.7  "="darkslategray4", "1.2  "="darkslategray3")) +
  xlab("Time (s)") + ylab(expression(paste("[mRNA]-fold change"))) +
  theme(plot.title=element_text(size=10, face="bold"),axis.title.x=element_text(size=9.5),
        axis.title.y=element_text(size=9.5),legend.position = "top",legend.title = element_blank()) 

grid.arrange(fig_amplitude_mRNA_conc, fig_amplitude_mRNA_fold_change, ncol=2)
