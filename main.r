library(mgcv)
library(splines)
data = data.frame(ds1 = rnorm(100),
                   ds2 = rnorm(100))
mod = lm(ds1 ~ ds2, data=data)
summary(mod)
plot(ds1 ~ ds2, data = data, cex = .9)
abline(mod, col="red")

mod <- lm(ds1 ~ bs(ds2, knots = 2), data=data)
summary(mod)
plot(ds1 ~ ds2, data = data, cex = .8)
lines(data$ds2, predict(mod), lwd=2, col='red')

mod <- gam(ds1 ~ s(ds2, bs = "cr", k = 2),
           data = data,
           family = gaussian)
summary(mod)
plot(mod)
