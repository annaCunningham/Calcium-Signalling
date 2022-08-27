# Examining changing period. 
# Period duration of 200 seconds and a total of 2 oscillations. 

## CREATING THE PIECEWISE OSCILLATION
oscillation_number = 10 
period = 200          
time = c(0:(period-1))
spike_width = 28
max = 0.52
min = 0.1
fig_21_df = data.frame(x = c(0,c(1:(oscillation_number*period))), 
                       S = c(min, oscillation_function(time, oscillation_number, period, spike_width, max, min)))
# Plot piece-wise oscillation.
figure_21 = graphing_function(fig_21_df, fig_21_df$x, fig_21_df$S, "Calcium Oscillation", "Time", expression(paste("[Ca"^"2+"*"]", mu, "M")))+
  geom_step(colour="black") + geom_hline(yintercept=mean(fig_21_df$S),color="gray0", linetype="dashed") +
  annotate('text', x=(oscillation_number*(period+0.2)), y=mean(fig_21_df$S)+0.02, label="bar(S) ", parse=TRUE, size=4) 
figure_21

## CREATING PLOT FOR Y ACTIVITY.
fig_22_df = fig_21_df 
fig_22_df$Y_Values = as.numeric(unlist(y_activation_function(fig_22_df)))
end_t2 = tail(fig_22_df$x, 1)
start_t1 = end_t2-period
average_y = calculate_average_function(start_t1, end_t2,fig_22_df$Y_Values)

# Plot changes in Y activity. 
figure_22 = graphing_function(fig_22_df, fig_22_df$x, fig_22_df$Y_Values, "Calcium-dependent kinase",
                              "Time (s)","CDPK") + geom_line(colour="blue4") + 
  geom_hline(yintercept=average_y ,color="gray0", linetype="dashed") +
  annotate('text', x=50, y =(average_y+0.03), 
           label="bar(CDPK) ", parse=TRUE, size=3.5)+
  geom_segment(aes(x=0, y=1.05, xend=1250, yend=1.05), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=600 , y=1.1, label="Transient", parse=TRUE, size=3.5)+
  geom_segment(aes(x=1250, y=1.05, xend=2000, yend=1.05), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=1600 , y=1.1, label="Periodic", parse=TRUE, size=3.5)
figure_22

## CREATING PLOT FOR X ACTIVITY 
fig_22_df$X_Values = as.numeric(unlist(x_activation_function(fig_22_df)))
end_t2=tail(fig_22_df$x, 1)
start_t1=(end_t2-period)
dataframe=fig_22_df$X_Values
average_x = calculate_average_function(start_t1,end_t2, dataframe)
fig_23_df = fig_22_df[-1,]

# Plot changes in X activity.
figure_23 = graphing_function(fig_23_df, fig_23_df$x, fig_23_df$X_Values, "Target Transcription Factor",
                              "Time (s)", "TF") + geom_path(colour="blue4") + 
  geom_hline(yintercept=average_x ,color="gray0", linetype="dashed") +
  annotate('text', x = 0, y = (average_x+0.01), 
           label = "bar(TF) ",parse = TRUE,size=3.5)+
  geom_segment(aes(x=0, y=0.355, xend=1250, yend=0.355), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=600 , y=0.365, label="Transient", parse=TRUE, size=3.3)+
  geom_segment(aes(x=1250, y=0.355, xend=2000, yend=0.355), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=1600 , y=0.365, label="Periodic", parse=TRUE, size=3.3)
figure_23

## CALCULATING CHANGES IN [mRNA].
fig_21_mRNA_df = fig_23_df
fig_21_mRNA_df$X_concentration = (fig_21_mRNA_df$X_Values *1) #assume total (x) concentration is 1
#add mRNA concentration column 
X_conc_value_temp = fig_21_mRNA_df$X_concentration
fig_21_mRNA_df$mRNA_concentration  = mRNA_concentration_function(X_conc_value = X_conc_value_temp)
#calculating and plotting fold change 
fig_21_mRNA_df$fold_change = fig_21_mRNA_df$mRNA_concentration/SS_mRNA_0.16
