#homework due for tomorrow
library(ggplot2)
x <- 1:10
qplot(x)


qplot(treatment, geom = "bar", data = BtheB, fill= drug)

table1 <- with(BtheB, table(treatment, drug))
table1


#there are more patients in BtheB group taking drugs at the begining , which might has impact on the results.



BtheB$diff_2m <- (BtheB$bdi.pre-BtheB$bdi.2m)
summary (BtheB)
# There is a negative value is the new variable, which is unnormal.

BtheBnew <- subset(BtheB, BtheB$diff_2m<0)  
BtheBnew
with(BtheBnew, table(treatment))

with(BtheB,t.test(diff_2m~treatment, alternative="less")) 
# p value is 0.03743, so the null hypothesis is accepted thus BtheB treatment is no different than TAU group from 2 month data.




cor.test (BtheB$bdi.2m, BtheB$bdi.pre)
# correlation test indicated that there is a realtion between bdi.pre and bdi.2m


qplot(bdi.pre, bdi.2m, data=BtheB, geom=c("point", "smooth"),facets= . ~ treatment, method="lm")
qplot(bdi.pre, bdi.2m, data=BtheB, geom=c("point", "smooth"))
abline(BtheB, bdi.pre~bdi.2m)



ft3 <- with (BtheB, lm(bdi.2m~bdi.pre+treatment+drug+length))
summary (ft3)
# This model is better than other with the consideration of more variables.

install.packages("visreg")
library(visreg)
layout(matrix(1:4, nrow = 2))
visreg(ft3)
visreg (ft3,"bdi.pre", by="treatment", line=list(col="blue"), points=list(cex=1, pch=20))
