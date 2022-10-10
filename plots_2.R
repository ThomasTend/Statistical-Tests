# plot lognormal sample

sample <- rlnorm(n=1000, meanlog=0, sdlog=0.5)
hist(sample, freq=FALSE)

# Plot log transformed data

sample_log <- log(sample) 
hist(sample_log, freq=FALSE)

# plot lognormal density

x <- c(seq(0,20,0.01)) # standard
plot(x, dlnorm(x, meanlog = 0, sdlog = 2), type='l', xlab="x", ylab="density", col='red')
title("lognormal(0,2)", line=0.3)

