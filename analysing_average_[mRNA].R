# PLOTTING [mRNA] AND FOLD CHANGE FOR AVERAGE
library("gridExtra")
average_mRNA = data.frame(time = fig_33_mRNA_df$x,
                          average_mRNA0.15 = fig_33_mRNA_df$mRNA_concentration,
                          average_mRNA0.30 = fig_36_mRNA_df$mRNA_concentration,
                          average_mRNA0.47 = fig_39_mRNA_df$mRNA_concentration)

average_mRNA_fold_change = data.frame(time = fig_33_mRNA_df$x,
                                      average_mRNA0.15 = fig_33_mRNA_df$fold_change,
                                      average_mRNA0.30 = fig_36_mRNA_df$fold_change,
                                      average_mRNA0.47 = fig_39_mRNA_df$fold_change)

fig_average_mRNA_conc = ggplot(data=average_mRNA, mapping = aes(x=time)) +
  geom_line(mapping = aes(y=average_mRNA0.15, color="0.15  ")) +
  geom_line(mapping = aes(y=average_mRNA0.30, color="0.30  ")) +
  geom_line(mapping = aes(y=average_mRNA0.47, color="0.47  "))  +
  scale_color_manual(values = c("0.15  "="darkslategray","0.30  "="darkslategray4", "0.47  "="darkslategray3")) +
  xlab("Time (s)") + ylab(expression(paste("[mRNA] ", mu, "M")))+
  theme(plot.title=element_text(size=10, face="bold"),axis.title.x=element_text(size=9.5),
        axis.title.y=element_text(size=9.5), legend.position = "top", legend.title = element_blank()) 

fig_average_mRNA_fold_change = ggplot(data=average_mRNA_fold_change, mapping = aes(x=time)) +
  geom_line(mapping = aes(y=average_mRNA0.15, color="0.15  ")) +
  geom_line(mapping = aes(y=average_mRNA0.30, color="0.30  ")) +
  geom_line(mapping = aes(y=average_mRNA0.47, color="0.47  ")) +
  scale_color_manual(values = c("0.15  "="darkslategray","0.30  "="darkslategray4", "0.47  "="darkslategray3")) +
  xlab("Time (s)") + ylab(expression(paste("[mRNA]-fold change")))+
  theme(plot.title=element_text(size=10, face="bold"),axis.title.x=element_text(size=9.5),
        axis.title.y=element_text(size=9.5),legend.position = "top",legend.title = element_blank()) 

grid.arrange(fig_average_mRNA_conc, fig_average_mRNA_fold_change, ncol=2)
