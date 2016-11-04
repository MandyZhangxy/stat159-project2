library(glmnet)
# setwd("/Users/MandyZhang/Desktop/stat_159/project2/")
scaled_credit <- read.csv("../../data/scaled_credit.csv", stringsAsFactors=FALSE)
load("../../data/training_and_testing.RData")

grid = 10^seq(10, -2, length = 100)
lasso_cv = cv.glmnet(as.matrix(x_training), as.matrix(y_training), alpha=1, intercept = FALSE, lambda = grid,
                     standardize = FALSE)
best_lambda = lasso_cv$lambda.min

png(file = "../../images/lasso-cv-errors.png")
plot(lasso_cv)
dev.off()

y_hat = predict(lasso_cv, s = best_lambda, newx = data.matrix(x_testing))
r_squared = (y_testing - y_hat)^2
lasso_mse = sum(r_squared)/length(r_squared)

x = data.matrix(scaled_credit[ ,-12])
y = data.matrix(scaled_credit[ ,12])


lasso_refit = glmnet(x, y, alpha = 1, lambda = grid, intercept = FALSE,standardize = FALSE)
lasso_coef = predict(lasso_refit, s = best_lambda, type = "coefficients")[1:12, ]


save(lasso_cv, best_lambda, lasso_mse, lasso_refit, lasso_coef, file = "../../data/lasso_model.RData")

sink(file = "../../data/lasso-output.txt")
cat("\nLasso Regression Model \n")
cat("Best Lambda")
best_lambda
cat("\nOfficial coefficients\n")
lasso_coef
cat("\ntest MSE\n")
lasso_mse
sink()


