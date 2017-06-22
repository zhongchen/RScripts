totalNum = 200
trainNum = 150
testNum = totalNum - trainNum
t=seq(1, totalNum, 1)
tTrain = t[1:trainNum]
tTest = t[(trainNum + 1) : totalNum]
sinY=100 * sin(tTrain)
a = 0.0 
b = 2.1
linearY = a * tTrain + b 
combineY = sinY + linearY

attach(mtcars)
par(mfrow=c(3,1))
plot(t, 100 * sin(t) + a* t + b, type = "l", xlab = "time", ylab = "value")
title(main = "Original")

combineY.ar = ar.ols(combineY)
predictedCombineY = predict(combineY.ar, n.ahead = testNum)
plot(t, c(combineY, predictedCombineY$pred), type = "l", xlab = "time", ylab = "value")
lines(t[(trainNum + 1): totalNum], predictedCombineY$pred, col = "red")
title(main = "Burg AR on Original")


inferredLinearModel = lm(combineY ~ tTrain)
inferredLinearY = inferredLinearModel$coefficients[2] *t + inferredLinearModel$coefficients[1]

inferredSinY = combineY - inferredLinearY[1:trainNum]
inferredSinY.ar = ar.ols(inferredSinY)
predictedInferredSinY = predict(inferredSinY.ar, n.ahead = testNum)
predictedInferredSinYLinear = predictedInferredSinY$pred + inferredLinearY[(1 + trainNum) : totalNum]
plot(t, c(combineY, predictedInferredSinYLinear), type = "l", xlab = "time", ylab = "value")
lines(t[(trainNum + 1): totalNum], predictedInferredSinYLinear, col = "red")
title(main = "Burg AR on Orignal Detrend")

predictedCombineY$pred
predictedInferredSinYLinear$


#plot(t, combineY, type = "l", xlab = "time", ylab = "combine")
#plot(t,sinY,type="l", xlab="time", ylab="Sine wave")
#plot(t, inferredSinY,type="l", xlab="time", ylab="inferred Sine wave")
#plot(t, linearY, type = "l", xlab = "time", ylab = "linear")
#plot(t, inferredLinearY, type = "l", xlab = "time", ylab = "inferred linear")
