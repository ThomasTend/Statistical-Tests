algo1 <- rnorm(100, mean=rep(50,100))
algo2 <- rnorm(100, mean=rep(110,100))
algo3 <- rnorm(100, mean=rep(110,100))

alg <- c(rep(1,98),rep(2,101),rep(3,101))
is_Canada <- c(rep(0,80),rep(1,220))

durations = c(algo1, algo2, algo3)

data <- data.frame(cbind(durations, alg, is_Canada))

anova_results <- aov(durations ~ alg + is_Canada, data = data)
summary(anova_results)

t.test(algo1, algo2)
t.test(algo2, algo3)
t.test(algo1, algo3)

alg1 <- rnorm(80, mean = 50, sd = 3)
alg2 <- rnorm(50, mean = 110, sd = 4)
var.test(alg1, alg2)

