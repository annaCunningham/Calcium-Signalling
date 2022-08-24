# Examining changing amplitude 
# Amplitude of 0.2 micro-M.  

## CREATING THE PIECEWISE OSCILLATION.
oscillation_number = 50 
period = 40          
time = c(0:(period-1))
spike_width = 30
max = 0.2
min = 0.1
fig_24_df = data.frame(x = c(0,c(1:(oscillation_number*period))), 
                       S =  c(min, oscillation_function(time, oscillation_number, period, spike_width, max, min)))
# Plot piece-wise oscillation.
figure_24 = graphing_function(fig_24_df, fig_24_df$x, fig_24_df$S, "Calcium Oscillation", "Time (s)",expression(paste("[Ca"^"2+"*"]", mu, "M"))) +
  geom_step(colour="black") + geom_hline(yintercept=mean(fig_24_df$S), color="gray0", linetype="dashed") +
  annotate('text', x=(oscillation_number*(period)+50), y=mean(fig_24_df$S), label = "bar(S) ",parse = TRUE,size=4) 
figure_24


## CREATING PLOT FOR Y ACTIVITY.
fig_25_df = fig_24_df 
fig_25_df$Y_Values = as.numeric(unlist(y_activation_function(fig_25_df)))
end_t2 = tail(fig_25_df$x, 1)
start_t1 = (end_t2-period)
average_y = calculate_average_function(start_t1, end_t2, fig_25_df$Y_Values)

# Plot changes in Y activity.
figure_25 = graphing_function(fig_25_df, fig_25_df$x, fig_25_df$Y_Values, "Calcium-dependent kinase",
                              "Time (s)","CDPK") + geom_line(colour="blue4") + 
  geom_hline(yintercept=average_y, color="gray0", linetype="dashed") +
  annotate('text', x=50, y=(average_y+0.03), label="bar(CDPK) ", parse=TRUE, size=3.5) +
  geom_segment(aes(x=0, y=1.05, xend=1800, yend=1.05), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=800 , y=1.1, label="Transient", parse=TRUE, size=3.5) +
  geom_segment(aes(x=1800, y=1.05, xend=2000, yend=1.05), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=1900 , y=1.1, label="Periodic", parse=TRUE, size=3.5)
figure_25

## CREATING PLOT FOR X ACTIVITY 
fig_25_df$X_Values = as.numeric(unlist(x_activation_function(fig_25_df)))
end_t2=tail(fig_25_df$x, 1)
start_t1=(end_t2-period)
dataframe=fig_25_df$X_Values
average_x = calculate_average_function(start_t1,end_t2, dataframe)
fig_26_df = fig_25_df

# Plot changes in X activity.
figure_26 = graphing_function(fig_26_df, fig_26_df$x, fig_26_df$X_Values, "Target Trascription Factor",
                              "Time (s)", "TF") + geom_path(colour="blue4") + 
  geom_hline(yintercept=average_x ,color="gray0", linetype="dashed") +
  annotate('text', x=0, y =(average_x+0.01), 
           label="bar(TF) ", parse=TRUE, size=3.5)+
  geom_segment(aes(x=0, y=0.35, xend=1870, yend=0.35), colour="black",
               arrow=arrow(length = unit(0.1, "cm"), ends="both")) +
  annotate("text", x=1000 , y=0.36, label="Transient", parse=TRUE, size=3.3) +
  geom_segment(aes(x=1870, y=0.35, xend=2000, yend = 0.35), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=1950 , y=0.36, label="Periodic", parse=TRUE, size=3.3)
figure_26

## CALCULATING CHANGES IN [mRNA]
fig_24_mRNA_df = fig_26_df
fig_24_mRNA_df$X_concentration = (fig_24_mRNA_df$X_Values*1) #assume total (x) concentration is 1
#add mRNA concentration column 
X_conc_value_temp = fig_24_mRNA_df$X_concentration
fig_24_mRNA_df$mRNA_concentration = mRNA_concentration_function(X_conc_value = X_conc_value_temp)
#calculating and plotting fold change 
fig_24_mRNA_df$fold_change = fig_24_mRNA_df$mRNA_concentration/SS_mRNA_0.18

