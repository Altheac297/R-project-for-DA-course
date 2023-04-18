library(AmesHousing)
ames <- AmesHousing::make_ames()

lm(Sale_Price ~ Gr_Liv_Area, ames)
## sale_price = 13289.6 + 111.7 * Gr_Liv_Area

library(ggplot2)
ggplot(data = ames,
       aes(x = Gr_Liv_Area, y = Sale_Price)) +
  geom_point(alpha = 0.3) + 
  stat_smooth(color="steelblue2",method="lm",se=FALSE) +
  labs(x = "Gr_Liv_Area", y = "Sale_Price", title = "The Relationship Between Gr_Liv_Area and Sale_Price") +
  theme_bw() +
  theme(plot.title = element_text(hjust=0.5, size=12), axis.title = element_text(size=12))

lm(Sale_Price ~ Lot_Area + Total_Bsmt_SF, ames)
## 选择依据：尽量正交，均为数值型变量
## sale_price = 54150.094 + 1.149 * lot_area + 109.380 * total_ bsmt_sf

## 残差平方和的平均值（称为均方根误差）来表现模型拟合的好坏。RMSE越低，模型的拟合效果越好。
fit <- lm(Sale_Price ~ Lot_Area + Total_Bsmt_SF, ames)
predicted = c(predict(fit, data.frame(Lot_Area = ames$Lot_Area, Total_Bsmt_SF = ames$Total_Bsmt_SF)))    
library(Metrics)
rmse(ames$Sale_Price, predict(fit, data.frame(Lot_Area = ames$Lot_Area, Total_Bsmt_SF = ames$Total_Bsmt_SF)))
## rmse = 61241.85，拟合效果欠佳

library(modeldata)
library(dplyr)
attrition <- modeldata::attrition
attrition <- attrition %>% mutate_if(is.ordered, factor, ordered = FALSE)
attrition$Attrition <- ifelse(attrition$Attrition=="Yes",1,0)
glm(Attrition ~ MonthlyIncome, attrition, family = binomial)
## attrition = -0.9291087 - 0.0001271 * monthlyincome

ggplot(data = attrition,
       aes(x = MonthlyIncome, y = Attrition)) +
  geom_point(alpha = 0.3) + 
  stat_smooth(color="steelblue2",method="glm",se=FALSE) +
  labs(x = "MonthlyIncome", y = "Attrition", title = "The Relationship Between MonthlyIncome and Attrition") +
  theme_bw() +
  theme(plot.title = element_text(hjust=0.5, size=12), axis.title = element_text(size=12))

glm(Attrition ~ MonthlyIncome + DistanceFromHome, attrition, family = binomial)
## attrition = -1.1707462 - 0.0001291 * monthlyincome + 0.0258279 * distancefromhome






