# Examining changing all parameters. 
# Amplitude (0.2), period(200), average(0.15), spike_width(23.8)

## CREATING THE PIECEWISE OSCILLATION
oscillation_number = 10
period = 200         
time = c(0:(period-1))
spike_width = 23.8  
max = 0.2
min = 0.1
fig_47_df = data.frame(x = c(0,c(1:(oscillation_number*period))), 
                       S =  c(min, oscillation_function(time, oscillation_number, period, spike_width, max, min)))
# Plot piece-wise oscillation.
figure_47 = graphing_function(fig_47_df, fig_47_df$x, fig_47_df$S, "Calcium Oscillation", "Time (s)",expression(paste("[Ca"^"2+"*"]", mu, "M")))+
  geom_step(colour="black") + geom_hline(yintercept=mean(fig_47_df$S),color="gray0", 
                                         linetype="dashed") +
  annotate('text', x=(oscillation_number*(period)), y=mean(fig_47_df$S)+0.004, 
           label="bar(S) ", parse=TRUE, size=4) 
figure_47

## CREATING PLOT FOR Y ACTIVITY. 
fig_48_df = fig_47_df 
fig_48_df$Y_Values = as.numeric(unlist(y_activation_function(fig_48_df)))
end_t2 = tail(fig_48_df$x, 1)
start_t1 = (end_t2-period)
average_y = calculate_average_function(start_t1, end_t2, fig_48_df$Y_Values)

# Plot changes in Y activity.
figure_48 = graphing_function(fig_48_df, fig_48_df$x, fig_48_df$Y_Values, "Calcium-dependent kinase",
                              "Time (s)","CDPK") + geom_line(colour="blue4") +
  geom_segment(aes(x=0, y=0.95, xend=2000, yend=0.95), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=1000 , y=1, label="Transient", parse=TRUE, size=3.5)
figure_48

## CREATING PLOT FOR X ACTIVITY.
fig_48_df$X_Values = as.numeric(unlist(x_activation_function(fig_48_df)))
end_t2=tail(fig_48_df$x, 1)
start_t1=(end_t2-period)
dataframe=fig_48_df$X_Values
average_x = calculate_average_function(start_t1,end_t2, dataframe)

# Plot changes in X activity.
figure_49 = graphing_function(fig_49_df, fig_49_df$x, fig_49_df$X_Values, "Target Target Factor",
                              "Time (s)", "TF") + geom_path(colour="blue4") + 
  geom_segment(aes(x=0, y=0.33, xend=2000, yend=0.33), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=1000 , y=0.34, label="Transient", parse=TRUE, size=3.3)
figure_49

## CREATING PLOT FOR [mRNA]
#fig 47 mRNA
fig_47_mRNA_df = fig_49_df
fig_47_mRNA_df$X_concentration = (fig_47_mRNA_df$X_Values *1) #assume total (x) concentration is 1
#add mRNA concentration column 
X_conc_value_temp = fig_47_mRNA_df$X_concentration
fig_47_mRNA_df$mRNA_concentration  = mRNA_concentration_function(X_conc_value = X_conc_value_temp)
#calculating and plotting fold change 
fig_47_mRNA_df$fold_change = fig_47_mRNA_df$mRNA_concentration/SS_mRNA_0.15
