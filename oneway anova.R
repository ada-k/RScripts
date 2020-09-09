my_data<-PlantGrowth
View(my_data)
levels(my_data$group)

install.packages("dplyr")
library(dplyr)
group_by(my_data, group) %>%
  summarise(count=n(),
  mean=mean(weight, na.rm=TRUE),
  sd=sd(weight, na.rm=TRUE)
)

install.packages("ggpubr")
library(ggpubr)
ggboxplot(my_data, x="group", y="weight",
          color = "group", palette=c("#00AFBB", "#E7B800", "#FC4E07"),
          order = c("ctrl", "trt1", "trt2"),
          ylab= "weight", xlab = "treatment")

library("ggpubr")
ggline(my_data, x = "group", y = "weight", 
       add = c("mean_se", "jitter"), 
       order = c("ctrl", "trt1", "trt2"),
       ylab = "Weight", xlab = "Treatment")

anova<-aov(weight~group, data=my_data)
summary(anova)

#multiple comparison of means (fail to reject if p > 0.05)(trt1 = ctr, trt2 = ctrl, trt1 != trt2, thus ctrl is different.)
TukeyHSD(anova)

#Homogeneity of Variances
plot(anova, 1)
bartlett.test(weight ~ group, data = my_data)
# levene's Test (preferred over bartlett. The latter is more rigid.)
#install.packages("car")
#library(car)
#leveneTest(weight ~ group, data = my_data)


#test for normality(H0: the residual terms follows a normal distribution)
plot(anova, 2)
#Shapiro wilk test, (reject if p<alpha)
anova_residuals <- residuals(object = anova)
shapiro.test(x = anova_residuals )

#third assumption, independence. not tested cause we have 3 groups thus if they weren't
#independent the tests wouldn't even be carried out(they'd be one group)

#non-parametric test alternative to ANOVA(kruskal-wallis test)
kruskal.test(weight ~ group, data = my_data)


#
