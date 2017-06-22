d <- read.csv("/Users/zhong/signature_quality/report/sig-without-wildcard.csv", header = TRUE)
cold <- d$Removed.Sigs.Pct[!is.na(d$Removed.Sigs.Pct)]
par(mfrow=c(1,1))
hist(cold, 
     main="Histogram for percentage of signatures without wildcard for all customers", 
     xlab="Percentage", 
     border="blue", 
     col="green",
     xlim=c(0, 1),
     las=1, 
     breaks=10)