# Examining changing period. 
# Period duration of 200 seconds and a total of 2 oscillations. 

## CREATING PIECEWISE OSCILLATION.
oscillation_number = 2 
period = 200          
time = c(0:(period-1))
spike_width = 25    
max = 0.52
min = 0.1
fig_12_df = data.frame(x = c(0,c(1:(oscillation_number*period))), 
                      S =  c(min, oscillation_function(time, oscillation_number, period, spike_width, max, min)))
# Plot piece-wise oscillation.
figure_12 = graphing_function(fig_12_df, fig_12_df$x, fig_12_df$S, "Calcium Oscillation", "Time (s)", expression(paste("[Ca"^"2+"*"]", mu, "M")))+
  geom_step(colour="black") + geom_hline(yintercept=mean(fig_12_df$S), color="gray0", linetype="dashed") +
  annotate('text', x=(oscillation_number*(period+0.2)), y=mean(fig_12_df$S)+0.015, 
           label="bar(S) ", parse=TRUE,size=4) 
figure_12

## CREATING PLOT FOR CHANGES IN Y ACTIVITY.
fig_13_df = fig_12_df 
fig_13_df$Y_Values = as.numeric(unlist(y_activation_function(fig_12_df)))
end_t2 = tail(fig_13_df$x, 1)
start_t1 = (end_t2-period)
average_y = calculate_average_function(start_t1, end_t2,fig_13_df$Y_Values)

# Plot changes in Y activity.
figure_13 = graphing_function(fig_13_df, fig_13_df$x, fig_13_df$Y_Values, "Calcium-dependent kinase",
                              "Time (s)","CDPK") + geom_line(colour="blue4") + 
  geom_segment(aes(x=0, y=0.82, xend=(oscillation_number*period), yend=0.82), colour="black",
               arrow = arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=200 , y=0.84, label="Transient", parse=TRUE, size=3.5)

figure_13

## CREATING PLOT FOR CHANGES IN X ACTIVITY.
fig_13_df$X_Values = as.numeric(unlist(x_activation_function(fig_13_df)))
average_x = calculate_average_function(end_t2=tail(fig_13_df$x, 1), start_t1=(end_t2-period), dataframe=fig_13_df$X_Values)
fig_14_df = fig_13_df[-1,]
# Plot changes in X activity.
figure_14 = graphing_function(fig_14_df, fig_14_df$x, fig_14_df$X_Values, "Target Transcription Factor",
                              "Time (s)", "TF") + geom_path(colour="blue4") + 
  geom_segment(aes(x=0, y=0.3, xend=(oscillation_number*period), yend=0.3), colour = "black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=200 , y=0.31, label="Transient", parse=TRUE, size=3.5)

figure_14

## CALCULATING CHANGES IN [mRNA].
fig_12_mRNA_df = fig_14_df
fig_12_mRNA_df$X_concentration = (fig_12_mRNA_df$X_Values*1) #assume total (x) concentration is 1
#add mRNA concentration column 
X_conc_value_temp = fig_12_mRNA_df$X_concentration
fig_12_mRNA_df$mRNA_concentration  = mRNA_concentration_function(X_conc_value=X_conc_value_temp)
#calculating and plotting fold change 
fig_12_mRNA_df$fold_change = fig_12_mRNA_df$mRNA_concentration/SS_mRNA_0.15
