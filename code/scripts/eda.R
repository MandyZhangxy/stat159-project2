# loads dataset

Credit <- read.csv("../../data/Credit.csv", stringsAsFactors=FALSE)
str(Credit)

#deal with quantitative variables
col_name <- c('Income', 'Limit', 'Rating', 'Cards', 'Age', 'Education', 'Balance')
#create summary table and save
sink("../../data/eda-output.txt")
for (i in col_name){
  cat('summary table of', i)
  print(summary(Credit[i]))
  cat("\n")
}
sink()
# plot histograms
path = '../../images/'
par(mfrow = c(1,1))
for (i in col_name){
  png(paste(path, i, '_histogram.png', sep = ''))
  hist(Credit[,i], main = paste(i, 'histogram'), xlab = i)
  dev.off()
}
#plot boxplots
for (j in col_name){
  png(paste(path, j, '_boxplot.png', sep = ''))
  boxplot(Credit[,j], horizontal = TRUE, main = paste(j, 'boxplot'))
  dev.off()
}



