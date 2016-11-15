library(arules)

rm(list=ls()) 
setwd("C:\\CMS\\RPI\\2016_Fall_Semester\\OpenSource\\slegec\\IntroOpenSource_Labs\\Lab08")
getwd()
admissions <- read.table("binary.csv", header = TRUE, sep = "," )
col_names <- names(admissions)
admissions[,col_names] <- lapply(admissions[,col_names] , factor)
str(admissions)
summary(admissions)
head(admissions)


rules <- apriori(admissions,  parameter = list(minlen=2, supp=0.01, conf=0.02),
                 appearance = list(rhs=c("admit=1"), 
                                   default="lhs"),
                 control = list(verbose=F))
rules.sorted <- sort(rules, by="confidence")
inspect(rules.sorted)

library(arulesViz)
plot(rules.sorted)
plot(rules.sorted, method="grouped")
plot(rules.sorted, method="graph")
plot(rules.sorted, method="graph", control=list(type="items"))