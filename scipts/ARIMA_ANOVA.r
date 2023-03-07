require(rpart)
require(ggplot2)
require(forecast)
library(quantmod)

setwd("/Users/orhankoc/Documents/uw/Q2/INDE-316/project")

# independent variable 1: Apple
APPL = read.csv("AAPL.csv")

head(APPL)
APPL_ts <- ts(APPL[, c("close")], start = c(1, 1), end=c(730,1), frequency = 365)
head(APPL_ts)

autoplot(APPL_ts)
autoplot(diff(APPL_ts))
ggAcf(diff(APPL_ts))
BoxCox.lambda(APPL_ts)

fit1 <- auto.arima(UR_ts, stepwise = FALSE) 
summary(fit1)
residuals(fit1)[1:3]
checkresiduals(fit1)
autoplot(fit1, which = 1:6, ncol = 3, label.size = 3)
fit1 %>% forecast(h = 45)
fit1 %>% forecast(h = 42) %>% autoplot()
