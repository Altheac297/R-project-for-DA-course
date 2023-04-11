googleplaystore <- read.csv("C:/Users/17293/Desktop/大二下/R-数据科学/上机/20230411/googleplaystore.csv")
View(googleplaystore)
#单样本t检验
t.test(googleplaystore$Rating, mu=4.5)
#样本均值与总体均值不同，拒绝该假设，p-value < 0.05

#独立样本t检验
education <- googleplaystore[which(googleplaystore$Category == 'EDUCATION'), ]
game <- googleplaystore[which(googleplaystore$Category == 'GAME'), ]
t.test(education$Rating, game$Rating)
#拒绝该假设，p-value < 0.05

#单因素方差分析
family <- googleplaystore[which(googleplaystore$Category == 'FAMILY'), ]
new <- rbind(family, education, game)
aov <- aov(new$Rating ~ new$Category)
summary(aov)
#拒绝该假设，p-value < 0.05，认为三者评分差异显著

#卡方检验
medical <- googleplaystore[which(googleplaystore$Category == 'MEDICAL'), ]
chisq <- rbind(game, medical)
chisq.test(chisq$Category, chisq$Type)
#拒接该假设，p-value < 0.05，认为两者相关

#配对t检验
x <- c(2.41,2.90,2.75,2.23,3.67,4.49,5.16,5.45,2.06,1.64,1.06,0.77)
y <- c(2.80,3.04,1.88,3.43,3.81,4.00,4.44,5.41,1.24,1.83,1.45,0.92)
t.test(x, y, paired = TRUE)
#p-value > 0.05，接受原假设，两种方法检验结果没有差别