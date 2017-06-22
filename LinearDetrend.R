plot.new()
frame()
attach(mtcars)
par(mfrow=c(3,1))
ts <- read.csv("/Users/zhong/R/search-results-2016-08-30T12-42-07.595-0700.csv")
tsLen = length(ts$X_timeslice)
pLen = 200
tsar = ar.burg(ts$X_avg, order.max = 100)
pred = predict(tsar, n.ahead = pLen)
x = seq(1472582490000, 1472586030000, 10000)
plot(seq(1472582490000, 1472586030000 + 10000 * pLen, 10000), c(ts$X_avg, pred$pred), type = "l", col = "red")

linearModel = lm(ts$X_avg ~ x)
linearY = x * linearModel$coefficients[2] + linearModel$coefficients[1]
plot(x, linearY, type = "l")

detrend = ts$X_avg - linearY
detrendar = ar.burg(detrend, order.max = 100)
detrendpred = predict(detrendar, n.ahead = pLen)
plot(seq(1472582490000, 1472586030000 + 10000 * pLen, 10000), c(detrend, detrendpred$pred), type = "l", col = "blue")
