my_data <- iris
my-data
levels(my_data$Species)

#the manova test(hypothesis same as for anova)
mult_anova<-manova(cbind(Sepal.Length, Petal.Length)~Species, data=my_data)
summary(mult_anova)

#anova test on the manova to test which variable is more significant.(both aresignificant in our case.They give same p values)
summary.aov(mult_anova)

#likelihood ratio test is used to check the level of significance of individual variables in a model.