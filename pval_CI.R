require(BSDA)

x <- rnorm(n=40, mean = rep(3, 40))
test = z.test(x, mu=3, sigma.x=1, conf.level=0.99, alternative="two.sided")
test

library(HH)

norm.setup(xlim = c(-4,4), mean=0, main="Test Statistic Density and Rejection Rule")
norm.curve(critical.values= c(-2.58, 2.58), col='blue')
norm.observed(xbar=-0.84584) # change by statistic from z-test above 
