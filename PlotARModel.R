setwd("/Users/zhong/R/")
#fileName <- "search-results-2016-06-21T14-15-58.793-0700.csv"
fileName <- "very_divergent_prediction_example.csv"
numTraining <- 180
numPrediction <- 100
ts <- read.csv(fileName)
trainingData <- ts$X_avg_predicted[1:numTraining]
m <- ar(x = trainingData, FALSE, order.max = 40, method = "burg")
predicted = predict(m, n.ahead = numPrediction)
result = c(trainingData, predicted$pred)
totalPoints <- numPrediction + numTraining
plot(1: totalPoints, result)
lines(1: totalPoints, result)
print(m$ar)
print(predicted)

