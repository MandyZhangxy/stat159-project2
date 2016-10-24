#perform ordinary linear regression
scaled_credit <- read.csv("../../data/scaled_credit.csv", stringsAsFactors=FALSE)
model <- lm(Balance ~ .,data = scaled_credit)
OLS_summary <-summary(model)
sink('../../data/regression_models_output.txt')
cat('\n')
cat('OLS model summary \n')
print(OLS_summary)
cat('\n')
sink()

save(OLS_summary, file='../../data/OLS.RData')
