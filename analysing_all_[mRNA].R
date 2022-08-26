library("gridExtra")
all_mRNA = data.frame(time = fig_42_mRNA_df$x,
                      high = fig_42_mRNA_df$mRNA_concentration,
                      medium = fig_44_mRNA_df$mRNA_concentration,
                      low = fig_47_mRNA_df$mRNA_concentration)

all_mRNA_fold_change = data.frame(time = fig_42_mRNA_df$x,
                                  high = fig_42_mRNA_df$fold_change,
                                  medium = fig_44_mRNA_df$fold_change,
                                  low = fig_47_mRNA_df$fold_change)

fig_all_mRNA_conc = ggplot(data=all_mRNA, mapping = aes(x=time)) +
  geom_line(mapping = aes(y=high, color="High")) +
  geom_line(mapping = aes(y=medium, color="Medium")) +
  geom_line(mapping = aes(y=low, color="Low"))  +
  scale_color_manual(values = c("High"="darkslategray","Medium"="darkslategray4", "Low"="darkslategray3")) +
  xlab("Time (s)") + ylab(expression(paste("[mRNA] ", mu, "M")))+
  theme(plot.title=element_text(size=10, face="bold"),axis.title.x=element_text(size=9.5),
        axis.title.y=element_text(size=9.5), legend.position = "top", legend.title = element_blank()) 

fig_all_mRNA_fold_change = ggplot(data=all_mRNA_fold_change, mapping = aes(x=time)) +
  geom_line(mapping = aes(y=high, color="High")) +
  geom_line(mapping = aes(y=medium, color="Medium")) +
  geom_line(mapping = aes(y=low, color="Low")) +
  scale_color_manual(values = c("High"="darkslategray","Medium"="darkslategray4", "Low"="darkslategray3")) +
  xlab("Time (s)") + ylab(expression(paste("[mRNA]-fold change")))+
  theme(plot.title=element_text(size=10, face="bold"),axis.title.x=element_text(size=9.5),
        axis.title.y=element_text(size=9.5),legend.position = "top",legend.title = element_blank()) 

grid.arrange(fig_all_mRNA_conc, fig_all_mRNA_fold_change, ncol=2)
