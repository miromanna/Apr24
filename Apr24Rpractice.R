library(tidyverse)
library(dplyr)
iris
iris%>%count(Species)

# Flights thing
install.packages("nycflights13")
library(nycflights13)
flights %>% left_join(weather)

#left_join priveleges the left columns; match on variables with the same name
planes
left_join(flights %>% rename(tn = tailnum), planes, by = c("tn"="tailnum"))

starwars %>%
# gatheer command  heigth/mass and the other for values; -name: pull everything but the name
  select(name:mass) %>%
  gather (key, value, height:mass) %>%
  arrange(desc(name))


#spread
# Spread and gather are complements
library(dplyr)
stocks <- data.frame(
  time = as.Date('2009-01-01') + 0:9,
  X = rnorm(10, 0, 1),
  Y = rnorm(10, 0, 2),
  Z = rnorm(10, 0, 4)
)
stocksm <- stocks %>% gather(stock, price, -time)
stocksm %>% spread(stock, price)
stocksm %>% spread(time, price)

df <- data.frame(x = c(NA, "a.b", "a.d", "b.c"))
df %>% separate(x, c("A", "B"))

df <- data.frame(x = c("a", "b"), y = c(3, 4), z = c(5, 6))
df %>% spread(x, y) %>% gather(x, y, a:b, na.rm = TRUE)

a<-c(1,2,NA)
# so R doesn't give me NA, I will use na.rm = T to get rid of it. 
mean(a, na.rm=T)

stocksm %>%
  group_by(stock)%>%
  summarise(price_mean = mean(price, na.rm = T))

stocksm %>%
  filter(is.na(price))

#or operator |
stocksm %>%
  filter(stock == "X" |stock =="Y")

stocksm %>%
  filter(stock %in% c("X"))

#create a function "not in"
`%ni%` <- Negate(`%in%`)

stocksm %>%
  filter(stock %ni% c("X", "Y"))

# regressions!!!!!!!! LM - linear models; GLM : generalized LM (probit, logit, etc)
library(tidyverse)
starwars

# Ols regression: mass is dep var, height is indep var. or i can do starwars$mass ~ starwars$height)
ols1 <- lm(mass ~ height, data = starwars)
summary(ols1)
summary(ols1)$coefficients
structure(ols1)

#broom creates dataframes from regression tables
install.packages(broom)
library(broom)

coefs1 <- tidy(ols1, conf.int = T)
coefs1

starwars%>%
  ggplot(aes())
