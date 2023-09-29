## SETUP
library(dplyr)
library(car)
library(lmtest)

## INPUT
read_csv("../../gen/data-preparation/temp/data_cleaned.csv")

## TRANSFORMATION
## Linear regression
# Research question: What is the relationship between the runtime and average user rating for movies?
imdb_lm1 <- lm(averageRating ~ runtimeMinutes , data_cleaned)
summary(imdb_lm1)

# Assumption check: test for homoskedasticity
breuschpagan_test <- lm(averageRating ~ runtimeMinutes, data = data_cleaned) %>% bptest()
breuschpagan_test

# Assumption check: test for independence of observations
dwtest(imdb_lm1) # a value near 2 suggests independence

# Assumption check: test for normality
qqnorm(data_cleaned$averageRating) # relatively straight line indicates normality

# Assumption check: test for linearity
plot(lm1, which = 1)

## OUTPUT
# Save output
save(imdb_lm1,file="../../gen/analysis/output/model_results.R")