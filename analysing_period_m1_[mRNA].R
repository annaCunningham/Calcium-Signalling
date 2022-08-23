# PLOTTING [mRNA] AND FOLD CHANGE FOR PERIOD METHOD 1.
install.packages("gridExtra")
library("gridExtra")
period_m1_mRNA = data.frame(time = fig_6_mRNA_df$x,
                            period8 = fig_6_mRNA_df$mRNA_concentration,
                            period40 = fig_9_mRNA_df$mRNA_concentration,
                            period200 = fig_12_mRNA_df$mRNA_concentration)

period_m1_mRNA_fold_change = data.frame(time = fig_6_mRNA_df$x,
                                        period8 = fig_6_mRNA_df$fold_change,
                                        period40 = fig_9_mRNA_df$fold_change,
                                        period200 = fig_12_mRNA_df$fold_change)
tail(period_m1_mRNA,1)
tail(period_m1_mRNA_fold_change,1)
fig_period_m1_mRNA_conc = ggplot(data=period_m1_mRNA, mapping = aes(x=time)) +
  geom_line(mapping = aes(y=period8, color="8 s")) +
  geom_line(mapping = aes(y=period40, color="40 s")) +
  geom_line(mapping = aes(y=period200, color="200 s"))  +
  scale_color_manual(values = c("8 s"="darkslategray","40 s"="darkslategray4", "200 s"="darkslategray3")) +
  xlab("Time (s)") + ylab(expression(paste("[mRNA] ", mu, "M")))+
  theme(plot.title=element_text(size=10, face="bold"),axis.title.x=element_text(size=9.5),
        axis.title.y=element_text(size=9.5), legend.position = "top", legend.title = element_blank()) 

fig_period_m1_mRNA_fold_change = ggplot(data=period_m1_mRNA_fold_change, mapping = aes(x=time)) +
  geom_line(mapping = aes(y=period8, color="8 s")) +
  geom_line(mapping = aes(y=period40, color="40 s")) +
  geom_line(mapping = aes(y=period200, color="200 s")) +
  scale_color_manual(values = c("8 s"="darkslategray","40 s"="darkslategray4", "200 s"="darkslategray3")) +
  xlab("Time (s)") + ylab(expression(paste("[mRNA]-fold change")))+
  theme(plot.title=element_text(size=10, face="bold"),axis.title.x=element_text(size=9.5),
        axis.title.y=element_text(size=9.5),legend.position = "top",legend.title = element_blank()) 

grid.arrange(fig_period_m1_mRNA_conc, fig_period_m1_mRNA_fold_change, ncol=2)

