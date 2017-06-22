m <- 0
s <- 1
set.seed(1)
numSample <- 10000
samples <- rnorm(numSample, m, s)
mean(samples)
rep <- 1000
summary(replicate(rep), mean(rnorm(numSample, m, s)))

cummean <- function(x)
  cumsum(x) / seq_along(x)