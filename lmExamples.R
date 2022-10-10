library(tidyverse)
library(usethis)
library(ggpubr)
library(car)

#generate data
set.seed(0)
data <- data.frame(x1 = factor(rep(0:1, 10)),x2 = rbinom(20,10,1/2),y = rnorm(20))
head(as.numeric(as.character(data$x1)))
data$x1 <- as.numeric(as.character(data$x1))
data$x2 <- as.numeric(as.character(data$x2))
data2 <- data.frame(w1=data$x1+data$x2, w2=data$x1-data$x2, z=data$y)
data2$w1
# model 1
m1 = lm(y ~ x1 + x2, data=data)
m1$coefficients
# model 2
m2 = lm(z ~ w1 + w2, data=data2)
m2$coefficients
#Sample prediction
new_df1 <- data.frame(x1 = c(1),x2 = c(2))
new_df2 <- data.frame(w1 = c(1),w2 = c(2))
predict(m1, newdata=new_df1)
predict(m2, newdata=new_df2)
new_df3 <- data.frame(w1 = c(3),w2 = c(-1))
predict(m2, newdata=new_df3)

# Plot one regressor at a time
avPlots(m1)
avPlots(m2)

# Make matrices for LASSO and RIDGE
y <- data$y
data_mat <- data.matrix(data)
data_mat2 <- data.matrix(data2)
y
data_mat <- data_mat[,colnames(data_mat) != "y"]
data_mat2 <- data_mat2[, colnames(data_mat2) != "z"]

library(glmnet)

# LASSO
# model 1
mlasso <- cv.glmnet(data_mat, y, alpha=1)
best_lambda_mlasso <- mlasso$lambda.min
plot(mlasso)
best_mlasso <- glmnet(data_mat, y, alpha=1, lambda=best_lambda_mlasso)
coef(best_mlasso)
best_lambda_mlasso
# model 2
mlasso2 <- cv.glmnet(data_mat2, y, alpha=1)
best_lambda_mlasso2 <- mlasso2$lambda.min
plot(mlasso2)
best_mlasso2 <- glmnet(data_mat2, y, alpha=1, lambda=best_lambda_mlasso2)
coef(best_mlasso2)
best_lambda_mlasso2

# RIDGE
# model 1
mridge <- cv.glmnet(data_mat, y, alpha=0)
best_lambda_mridge <- mridge$lambda.min
plot(mridge)
best_mridge <- glmnet(data_mat, y, alpha=0, lambda=best_lambda_mridge)
coef(best_mridge)
best_lambda_mridge
# model 2
mridge2 <- cv.glmnet(data_mat2, y, alpha=0)
best_lambda_mridge2 <- mridge2$lambda.min
plot(mridge2)
best_mridge2 <- glmnet(data_mat2, y, alpha=0, lambda=best_lambda_mridge2)
coef(best_mridge2)
best_lambda_mridge2


