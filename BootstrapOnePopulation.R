sample <- rnorm(n=40, mean = rep(3, 4))

resamples <- list()
means <- list()
for (i in 1:10000){
  resamples[[i]] <- sample(sample, replace=TRUE)
  means[[i]] <- mean(resamples[[i]])
  print(means[[i]])
}
means <- unlist(means)
hist(means, freq=FALSE)

sd(means)

quantile(means, probs =c(0.025, 0.975))
