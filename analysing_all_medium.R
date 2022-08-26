# Examining changing all parameters. 
# Amplitude (0.7), period(40), average(0.3), spike_width(19)

## CREATING THE PIECEWISE OSCILLATION
oscillation_number = 50 
period = 40         
time = c(0:(period-1))
spike_width = 19  
max = 0.7
min = 0.1
fig_44_df = data.frame(x = c(0,c(1:(oscillation_number*period))), 
                       S =  c(min,oscillation_function(time, oscillation_number, period, spike_width, max, min)))
# Plot piecei-wise oscillation.
figure_44 = graphing_function(fig_44_df, fig_44_df$x, fig_44_df$S, "Calcium Oscillation", "Time (s)", expression(paste("[Ca"^"2+"*"]", mu, "M")))+
  geom_step(colour="black") + geom_hline(yintercept=mean(fig_44_df$S), color="gray0", 
                                         linetype="dashed") +
  annotate('text', x = (oscillation_number*(period+1)), y=mean(fig_44_df$S)+0.02, 
           label="bar(S) ", parse=TRUE, size=4) 
figure_44

## CREATING PLOT FOR Y ACTIVITY.
fig_45_df = fig_44_df 
fig_45_df$Y_Values = as.numeric(unlist(y_activation_function(fig_45_df)))
end_t2 = tail(fig_45_df$x, 1)
start_t1 = end_t2 - (period)
average_y = calculate_average_function(start_t1, end_t2,fig_45_df$Y_Values)

# Plot changes in Y activity.
figure_45 = graphing_function(fig_45_df, fig_45_df$x, fig_45_df$Y_Values, "Calcium-dependent kinase",
                              "Time (s)","CDPK") + geom_line(colour="blue4") + 
  geom_hline(yintercept=average_y ,color="gray0", linetype="dashed") +
  annotate('text', x=50, y=(average_y+0.04), label="bar(CDPK) ", parse=TRUE, size=3.5)+
  geom_segment(aes(x=0, y=1.09, xend=256, yend=1.09), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=130 , y=1.11, label="Transient", parse=TRUE, size=3.5) +
  geom_segment(aes(x=256, y=1.09, xend=2000, yend=1.09), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=1100 , y=1.11, label="Periodic", parse=TRUE, size=3.5)
figure_45

## CREATING PLOT FOR X ACTIVITY 
fig_45_df$X_Values = as.numeric(unlist(x_activation_function(fig_45_df)))
end_t2=tail(fig_45_df$x, 1)
start_t1=(end_t2-period)
dataframe=fig_45_df$X_Values
average_x = calculate_average_function(start_t1,end_t2, dataframe)

# Plot changes in X activity.
figure_46 = graphing_function(fig_46_df, fig_46_df$x, fig_46_df$X_Values, "Target Transcription Factor",
                              "Time (s)", "TF") + geom_path(colour="blue4") + 
  geom_hline(yintercept=average_x ,color="gray0", linetype="dashed") +
  annotate('text', x=0, y=(average_x+0.015), label="bar(TF) ", parse=TRUE, size=3.5)+
  geom_segment(aes(x=50, y=0.36, xend=256, yend=0.36), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=130 , y=0.37, label="Transient", parse=TRUE, size=3.3)+
  geom_segment(aes(x=256, y=0.36, xend=2000, yend=0.36), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=1100 , y=0.37, label="Periodic", parse=TRUE, size=3.3)
figure_46

## CREATING PLOT FOR [mRNA]
fig_44_mRNA_df = fig_46_df
fig_44_mRNA_df$X_concentration = (fig_44_mRNA_df$X_Values *1) #assume total (x) concentration is 1
#add mRNA concentration column 
X_conc_value_temp = fig_44_mRNA_df$X_concentration
fig_44_mRNA_df$mRNA_concentration  = mRNA_concentration_function(X_conc_value = X_conc_value_temp)
#calculating and plotting fold change 
fig_44_mRNA_df$fold_change = fig_44_mRNA_df$mRNA_concentration/SS_mRNA_0.3


