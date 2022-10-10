require(stats)

# normality test
hist(rnorm(10000), main="Histogram of our data", xlab="Data points")

# KS test
data <- rnorm(n=100)
ks.test(data, "pnorm")
plot(pnorm, xlim = range(c(data)), xlab="x", ylab="CDF and ECDF",col = "blue")
plot(ecdf(data), xlab="x", ylab="CDF and ECDF", add = TRUE, lty = "dashed",col = "red")
title("KS test: Sample ECDF vs Normal CDF", line=0.3)

# Chi-squared for fair die
x_die <- c(30,30,10,10,10,10) 
chisq.test(x_die)

# Chi-squared for relationship of two groups on indep var
x <- matrix(c(20,100,70,200,140,100,80,210,130), nrow=3)
chisq.test(x)
x

# one way ANOVA
x <- rnorm(n=5)
y <- rnorm(n=5, mean=c(5,5,5,5,5))
z <- rnorm(n=5, mean=c(2,2,2,2,3))
x
y
z
d_combined <- data.frame(cbind(x,y,z))
d_stacked <- stack(d_combined)
anova_results <- aov(values ~ ind, data = d_stacked)
summary(anova_results)



