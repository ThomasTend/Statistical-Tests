sample1 <- rnorm(n=30, mean = rep(7, 30))
sample2 <- rnorm(n=20, mean = rep(0, 20))
sample_pooled <- c(sample1, sample2)

resamples <- list()
means <- list()
for (i in 1:10000){
  resamples[[i]] <- sample(sample_pooled, replace=FALSE)
  means[[i]] <- mean(resamples[[i]][1:30])-mean(resamples[[i]][31:50])
}

means <- unlist(means)
hist(means, freq=FALSE)

sd(means)

quantile(means, probs =c(0.005, 0.995))

mean(sample1)-mean(sample2)
