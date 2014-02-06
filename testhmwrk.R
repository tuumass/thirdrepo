#homework due for tomorrow
library(ggplot2)
x <- 1:10
qplot(x)


cor.test (BtheB$bdi.2m, BtheB$bdi.pre)
# correlation test indicated that there is a realtion between bdi.pre and bdi.2m

BtheB$diff_2m <- (BtheB$bdi.pre-BtheB$bdi.2m)
summary (BtheB)
# There are  negative values in the new variable, which is unnormal.

BtheBneg <- subset(BtheB, BtheB$diff_2m<0)  
BtheBneg
with(BtheBnew, table(treatment))

with(BtheB,t.test(diff_2m~treatment, alternative="less")) 
# A t test was run between the difference  for two treatment, the p value is 0.03743, so the null hypothesis is accepted thus BtheB treatment is no different than TAU group from 2 month data.

ft3 <- with (BtheB, lm(bdi.2m~bdi.pre+treatment+drug+length))
summary (ft3)
# This model is better than other with the consideration of more variables.

install.packages("visreg")
library(visreg)
visreg (ft3,"bdi.pre", by="treatment", line=list(col="blue"), points=list(cex=1, pch=20))

#  I found this package can draw the ablines without subsetting the two treatment groups,  but have not how to summary the data.
