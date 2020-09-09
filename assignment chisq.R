library(MASS)
my_data<-Cars93

#subsetting to use only variables Manufacturer and airbags
my_car = data.frame(Cars93$Manufacturer, Cars93$Origin)
#contigency table
my_car2 <- table(my_car)
my_car2

#visual representation of contingency table
library("graphics")
mosaicplot(my_car2, shade=TRUE, las=2,
           main="mosaic plot")


library(vcd)
assoc(head(my_car2, 5), shade=TRUE, las=3)

#h0: the 2 variables are independent
chi_test <- chisq.test(my_car2)
chi_test


#how we can explain the X-squared value(33.001)
#continue to level up with previous chi-sq class

