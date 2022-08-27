# Oscillation or prolonged. 
# Prolonged plot for: average calcium concentration 0.15 micro-M. 

## CREATING THE PIECEWISE OSCILLATION.
oscillation_number = 1
period = 2000    
time = c(0:(period-1))
spike_width = 166.7
max = 0.7
min = 0.1
df_prolonged_0.15 = data.frame(x = c(0,c(1:(oscillation_number*period))), 
                               S = c(min, oscillation_function(time, oscillation_number, period, spike_width, max, min)))
# Plot piece-wise oscillation.
fig_prolonged_0.15 = graphing_function(df_prolonged_0.15, df_prolonged_0.15$x, df_prolonged_0.15$S, "Calcium Oscillation", "Time", expression(paste("[Ca"^"2+"*"]", mu, "M")))+
  geom_step(colour="black") + geom_hline(yintercept=mean(df_prolonged_0.15$S),color="gray0", 
                                         linetype="dashed") +
  annotate('text', x=(oscillation_number*(period+0.2)), y=mean(df_prolonged_0.15$S)+0.02, label="bar(S) ", parse=TRUE, size=4) 
fig_prolonged_0.15

## CREATING PLOT FOR Y ACTIVITY.
df_prolonged_0.15_y = df_prolonged_0.15 
df_prolonged_0.15_y$Y_Values = as.numeric(unlist(y_activation_function(df_prolonged_0.15_y)))
end_t2 = tail(df_prolonged_0.15_y$x, 1)
start_t1 = (end_t2-period)
average_y = calculate_average_function(start_t1, end_t2, df_prolonged_0.15_y$Y_Values)

# Plot changes in Y activity.
fig_prolonged_0.15_y = graphing_function(df_prolonged_0.15_y, df_prolonged_0.15_y$x, df_prolonged_0.15_y$Y_Values, "Calcium-dependent kinase",
                                          "Time (s)","CDPK") + geom_line(colour="blue4") + 
  geom_segment(aes(x=0, y=1.03, xend=150, yend=1.03), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=80 , y=1.06, label="T", parse=TRUE, size=3.5) +
  geom_segment(aes(x=164, y=1.03, xend=170, yend=1.03), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=169 , y=1.06, label="P", parse=TRUE, size=3.5) +
  geom_segment(aes(x=180, y=1.03, xend=2000, yend=1.03), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=1100 , y=1.06, label="Decline", parse=TRUE, size=3.5)
fig_prolonged_0.15_y

## CREATING PLOT FOR X ACTIVITY.
df_prolonged_0.15_y$X_Values = as.numeric(unlist(x_activation_function(df_prolonged_0.15_y)))
end_t2=tail(df_prolonged_0.15_y$x, 1)
start_t1=(end_t2-period)
dataframe=df_prolonged_0.15_y$X_Values
average_x = calculate_average_function(start_t1, end_t2, dataframe)
df_prolonged_0.15_x = df_prolonged_0.15_y[-1,] 

# Plot changes in X activity.
fig_prolonged_0.15_x = graphing_function(df_prolonged_0.15_x, df_prolonged_0.15_x$x, df_prolonged_0.15_x$X_Values, "Target Transcription Factor ",
                                          "Time (s)", "TF") + geom_path(colour="blue4") + 
  geom_segment(aes(x=0, y=0.34, xend=150, yend=0.34), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=80 , y=0.35, label="T", parse=TRUE, size=3.3) +
  geom_segment(aes(x=165, y=0.34, xend=171, yend=0.34), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=169 , y=0.35, label="P", parse=TRUE, size=3.3) +
  geom_segment(aes(x=180, y=0.34, xend=2000, yend=0.34), colour="black",
               arrow=arrow(length=unit(0.1, "cm"), ends="both")) +
  annotate("text", x=1100 , y=0.35, label="Decline", parse=TRUE, size=3.5)
fig_prolonged_0.15_x

## CALCULATING CHANGES IN [mRNA]
mRNA_prolonged_0.15_x = df_prolonged_0.15_x
mRNA_prolonged_0.15_x$X_concentration = (mRNA_prolonged_0.15_x$X_Values *1) #assume total (x) concentration is 1
#add mRNA concentration column 
X_conc_value_temp = mRNA_prolonged_0.15_x$X_concentration
mRNA_prolonged_0.15_x$mRNA_concentration  = mRNA_concentration_function(X_conc_value = X_conc_value_temp)
#calculating and plotting fold change 
mRNA_prolonged_0.15_x$fold_change = mRNA_prolonged_0.15_x$mRNA_concentration/SS_mRNA_0.15

