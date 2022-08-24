# Examining changing period. 
# Period duration of 50 seconds and a total of 10 oscillations. 

## CREATING PIECEWISE OSCILLATION.
oscillation_number = 10 
period = 50          
time = c(0:(period-1))
spike_width = 7
max = 0.52
min = 0.1
fig_15_df = data.frame(x = c(0,c(1:(oscillation_number*period))), 
                       S = c(min, oscillation_function(time, oscillation_number, period, spike_width, max, min)))
# Plot piece-wise oscillation.
figure_15 = graphing_function(fig_15_df, fig_15_df$x, fig_15_df$S, "Calcium Oscillation", "Time", expression(paste("[Ca"^"2+"*"]", mu, "M")))+
  geom_step(colour="black") + geom_hline(yintercept=mean(fig_15_df$S), color="gray0", linetype="dashed") +
  annotate('text', x=(oscillation_number*(period+0.2)), y=(mean(fig_15_df$S)+0.02), 
           label="bar(S) ", parse=TRUE, size=4) 
figure_15

## CREATING PLOT FOR Y ACTIVITY.
fig_16_df = fig_15_df 
fig_16_df$Y_Values = as.numeric(unlist(y_activation_function(fig_16_df)))
end_t2 = tail(fig_16_df$x, 1)
start_t1 = (end_t2-period)
average_y = calculate_average_function(start_t1, end_t2, fig_16_df$Y_Values)

# Plot changes in Y activity.
figure_16 = graphing_function(fig_16_df, fig_16_df$x, fig_16_df$Y_Values, "Calcium-dependent kinase",
                              "Time (s)","CDPK") + geom_line(colour="blue4") + 
  geom_segment(aes(x=0, y=0.9, xend = (oscillation_number*period), yend = 0.9), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=250 , y=0.92, label="Transient", parse=TRUE, size=3.5)
figure_16

## CREATING PLOT FOR X ACTIVITY.
fig_16_df$X_Values = as.numeric(unlist(x_activation_function(fig_16_df)))
average_x = calculate_average_function(end_t2=tail(fig_16_df$x, 1), start_t1=(end_t2-period), dataframe=fig_16_df$X_Values)
fig_17_df = fig_16_df[-1,]

# Plot changes in X activity.
figure_17 = graphing_function(fig_17_df, fig_17_df$x, fig_17_df$X_Values, "Target Transcription Factor",
                              "Time (s)", "TF") + geom_path(colour="blue4") + 
  geom_segment(aes(x=0, y=0.315, xend=(oscillation_number*period), yend=0.315), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=250 , y=0.325, label="Transient", parse=TRUE, size=3.3)
figure_17

## CALCULATING CHANGES IN [mRNA]
fig_15_mRNA_df = fig_16_df
fig_15_mRNA_df$X_concentration = (fig_15_mRNA_df$X_Values*1) #assume total (x) concentration is 1
#add mRNA concentration column 
X_conc_value_temp = fig_15_mRNA_df$X_concentration
fig_15_mRNA_df$mRNA_concentration  = mRNA_concentration_function(X_conc_value=X_conc_value_temp)
#calculating and plotting fold change 
fig_15_mRNA_df$fold_change = fig_15_mRNA_df$mRNA_concentration/SS_mRNA_0.16

