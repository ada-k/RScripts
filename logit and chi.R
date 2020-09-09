install.packages("gplots")
library(gplots)

#chi sq test
library(data.table)
file_path<-"http://www.sthda.com/RDoc/data/housetasks.txt"
#housetasks <- fread('http://www.sthda.com/
housetasks <- read.delim(file_path, rownames=1)


#shade=colors, las=bars
library("graphics")
mosaicplot(housetasks, shade=TRUE, las=2,
           main="housetasks' mosaic plot")


install.packages("libgfortran")
install.packages("libquadmath")
install.packages("car")
install.packages("lmtest")
install.packages("vcd")
library(vcd)
assoc(head(housetasks, 5), shade=TRUE, las=3)


#chi sq test (ho:row and column values of contigency table are independent---conc. statiscally significantly associated)
#done on a categorical data set
#if there's no p value, the x-squared value will be weighed against table's critical value to come up with a decision.
chi_test <- chisq.test(housetasks)
chi_test

#observed and expected values(the 2 rounds of to 2dp)
chi_test$observed
round(chi_test$expected, 2)

#pearson residual(r = (O-E)1/root 2) Run and get absolute values to get the most significant.
round(chi_test$residuals)

#X-squared = 1944.5(explain it)
#find a code that produces the results as a dataset instead of ouputting in the console
