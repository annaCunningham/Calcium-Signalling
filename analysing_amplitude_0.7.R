# Examining changing amplitude 
# Amplitude of 0.7 micro-M.  

## CREATING THE PIECEWISE OSCILLATION.
oscillation_number = 50
period = 40          
time = c(0:(period-1))
spike_width = 5
max = 0.7
min = 0.1
fig_27_df = data.frame(x = c(0,c(1:(oscillation_number*period))), 
                       S =  c(min,oscillation_function(time, oscillation_number, period, spike_width, max, min)))
# Plot piece-wise oscillation
figure_27 = graphing_function(fig_27_df, fig_27_df$x, fig_27_df$S, "Calcium Oscillation", "Time (s)",expression(paste("[Ca"^"2+"*"]", mu, "M"))) +
  geom_step(colour="black") + geom_hline(yintercept=mean(fig_27_df$S), color="gray0", 
                                         linetype="dashed") +
  annotate('text', x=(oscillation_number*(period)+50), y=(mean(fig_24_df$S)+0.03), label = "bar(S) ", parse=TRUE, size=4) 
figure_27

## CREATING PLOT FOR Y ACTIVITY.
fig_28_df = fig_27_df 
fig_28_df$Y_Values = as.numeric(unlist(y_activation_function(fig_28_df)))
end_t2 = tail(fig_28_df$x, 1)
start_t1 = (end_t2-period)
average_y = calculate_average_function(start_t1, end_t2, fig_28_df$Y_Values)

# Plot changes in Y activity.
figure_28 = graphing_function(fig_28_df, fig_28_df$x, fig_28_df$Y_Values, "Calcium-dependent kinase",
                              "Time (s)","CDPK") + geom_line(colour="blue4") + 
  geom_hline(yintercept=average_y ,color="gray0", linetype="dashed") +
  annotate('text', x=50, y=(average_y+0.03), label="bar(CDPK) ", parse=TRUE, size=3.5)+
  geom_segment(aes(x=0,y=1.05, xend = 850,yend = 1.05), colour = "black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=500 , y=1.1, label="Transient", parse=TRUE, size=3.5)+
  geom_segment(aes(x=850, y=1.05, xend=2000, yend=1.05), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=1500 , y=1.1, label="Periodic", parse=TRUE, size=3.5)
figure_28

## CREATING PLOT FOR X ACTIVITY 
fig_28_df$X_Values = as.numeric(unlist(x_activation_function(fig_28_df)))
end_t2=tail(fig_28_df$x, 1)
start_t1=(end_t2-period)
dataframe=fig_28_df$X_Values
average_x = calculate_average_function(start_t1, end_t2, dataframe)
fig_29_df = fig_28_df[-1,]

# Plot changes in X activity.
figure_29 = graphing_function(fig_29_df, fig_29_df$x, fig_29_df$X_Values, "Target Transcription Factor",
                              "Time (s)", "TF") + geom_path(colour="blue4") + 
  geom_hline(yintercept=average_x ,color="gray0", linetype="dashed") +
  annotate('text', x=50, y=(average_x+0.01), label="bar(TF) ", parse=TRUE, size=3.5)+
  geom_segment(aes(x=0, y=0.355, xend=850, yend=0.355), colour="black",
               arrow = arrow(length = unit(0.1, "cm"),ends = "both")) +
  annotate("text", x=500 , y=0.365, label="Transient", parse=TRUE, size=3.3)+
  geom_segment(aes(x=850, y=0.355, xend=2000, yend=0.355), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=1500 , y=0.365, label="Periodic", parse=TRUE, size=3.3)
figure_29

## CALCULATING CHANGES IN [mRNA]
fig_27_mRNA_df = fig_29_df
fig_27_mRNA_df$X_concentration = (fig_27_mRNA_df$X_Values*1) #assume total (x) concentration is 1
#add mRNA concentration column 
X_conc_value_temp = fig_27_mRNA_df$X_concentration
fig_27_mRNA_df$mRNA_concentration  = mRNA_concentration_function(X_conc_value = X_conc_value_temp)
#calculating and plotting fold change 
fig_27_mRNA_df$fold_change = fig_27_mRNA_df$mRNA_concentration/SS_mRNA_0.18



