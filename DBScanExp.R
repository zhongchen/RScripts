library("dbscan")
#tsData <- read.csv("/Users/zhong/Downloads/search-results-2016-09-01T15-11-20.092-0700.csv")
tsData <- read.csv("/Users/zhong/Analytics/PythonUtils/output.csv")

num <- 7
x <- as.matrix(tsData[, 1: num + 1])
x[is.na(x)] <- 0
distance = median(dist(t(x)))
minPoints = floor(num / 2 + 1)
db <-dbscan(t(x), eps = distance, minPts = minPoints)