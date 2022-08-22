install.packages("ggplot2")
library(ggplot2)

# FUNCTION FOR CREATION OF GRAPHS
graphing_function <- function(dataFrame, X, Y, Title, X_label, Y_label){
  ggplot(data = dataFrame, aes(X,Y)) + ggtitle(Title) + labs(x=X_label, y=Y_label) +
    theme(plot.title=element_text(size=10, face="bold"),axis.title.x=element_text(size=9.5),
          axis.title.y=element_text(size=9.5))
}

