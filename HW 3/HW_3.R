## 1A
  
library(foreign)
library(stats)
bwght.df <- read.dta(file.choose())
bwght <- lm(bwght.df$bwght ~ bwght.df$cigs + bwght.df$motheduc + bwght.df$parity + bwght.df$male) # Standard linear regression.
summary(bwght) # Table of coefficients.

## B_0 indicates that the birth weight is 110.490 oz if the mother has 0 cig consumption and education and the child is female and first-born.

## B_1 indicates that the birth weight decreases by 0.497 oz per cig smoked per day.

## B_2 indicates that the birth weight increases by 0.394 oz per year of the mother's education.

## B_3 indicates that the birth weight increases by 1.605 per birth order increase.

## B_4 indcates that the birth weight increases by 2.960 for being male.

## 1B

library(MASS)
bwght_robust <- rlm(bwght.df$bwght ~ bwght.df$cigs + bwght.df$motheduc + bwght.df$parity + bwght.df$male) # Robust linear regression.
summary(bwght_robust) # Table of coefficients.

## For B_1, the homoskedastic error is 0.0923 and the heteroskedastic error is 0.0869.

## 1C
confint(bwght, "bwght.df$motheduc") # Confidence interval for motheduc.

## The 95% confidence interval for B_2 is (-0.0635, 0.8508).

## 1D

## Because the p-value for B_1 is 8.53*(10^-8), which is less than 0.01, we can reject the null hypothesis that B_1 = 0.
