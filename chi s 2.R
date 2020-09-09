library(MASS)
?MASS
my_data<-Cars93
my_data
data("Cars93")
head(Cars93)
?Cars93
#structure
str(Cars93)


#subsetting to use only variables type and airbags
my_car = data.frame(Cars93$AirBags, Cars93$Type)
#contigency table
my_car1 = table(Cars93$AirBags, Cars93$Type)
my_car1
#alt
my_car2 <- table(my_car)

my_car2


#visual representation of contingency table
library("graphics")
mosaicplot(my_car2, shade=TRUE, las=2,
           main="housetasks' mosaic plot")


install.packages("vcd")

library(vcd)
assoc(head(my_car2, 5), shade=TRUE, las=3)

#h0: the 2 variables are independent
chi_test <- chisq.test(my_car2)
chi_test


#how we can explain the X-squared value(33.001)
#continue to level up with previous chi-sq class


#observed and expected values(the 2 rounds of to 2dp)
chi_test$observed
round(chi_test$expected, 2)

#pearson residual(r = (O-E)1/root 2) Run and get absolute values to get the most significant.
round(chi_test$residuals)
