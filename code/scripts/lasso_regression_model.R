library(glmnet)
set.seed(200)


lasso_cv = cv.glmnet(x_training, y_training, alpha=1, intercept = FALSE,
                          standardize = FALSE)
best_lambda = lasso_cv$lambda.min

png(file = "../../images/lasso-images/lasso-cv-errors.png")
plot(lasso_cv)
dev.off()


y_hat = predict(lasso_cv, s = best_lambda, newx = x_testing)
r_squared = (y_testing - y_hat)^2
lasso_mse = sum(r_squared)/length(r_squared)


x = scaled_credit[ ,-12]
y = scaled_credit[ ,12]


lasso_output = glmnet(x, y, alpha = 1, intercept = FALSE)
lasso_coef = predict(lasso_output, s = best_lambda, type = "coefficients")[1:12, ]


save(lasso_cv, best_lambda, lasso_mse, lasso_coef, file = "../../data/lasso_model.RData")

sink(file = "../../data/lasso-output.txt")
cat("\nLasso Regression Model \n")
cat("Best Lambda")
best_lambda
cat("\nOfficial coefficients\n")
lasso_coef
cat("\ntest MSE\n")
lasso_mse
sink()


