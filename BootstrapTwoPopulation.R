sample1 <- rnorm(n=30, mean = rep(7, 30))
sample2 <- rnorm(n=20, mean = rep(0, 20))

resamples1 <- list()
resamples2 <- list()
means <- list()
for (i in 1:10000){
  resamples1[[i]] <- sample(sample1, replace=TRUE)
  resamples2[[i]] <- sample(sample2, replace=TRUE)
  means[[i]] <- mean(resamples1[[i]])-mean(resamples2[[i]])
}
means <- unlist(means)
hist(means, freq=FALSE)

sd(means)

quantile(means, probs =c(0.05, 0.95))

mean(sample1)-mean(sample2)
