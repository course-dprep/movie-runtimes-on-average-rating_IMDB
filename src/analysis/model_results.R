## SETUP
library(dplyr)
library(car)
library(lmtest)

## INPUT
data_cleaned <- read_csv("../../gen/data-preparation/temp/data_cleaned.csv")

## TRANSFORMATION
## Simple binary linear regression
# Research question: What is the relationship between the runtime and average user rating for movies?
imdb_lm1 <- lm(averageRating ~ runtimeMinutes , data_cleaned)
summary(imdb_lm1)

## Multiple linear regression including potential confounders
# Confounder: number of votes (numVotes)
imdb_lm2 <- lm(averageRating ~ runtimeMinutes + numVotes + year + isAdult, data_cleaned)
summary(imdb_lm2)

# Assumption check: test for homoskedasticity
breuschpagan_test <- imdb_lm2 %>% bptest()
breuschpagan_test


# Assumption check: test for independence of observations
dwtest(imdb_lm2) # a value near 2 suggests independence

# Assumption check: test for normality in dependent variable
qqnorm(data_cleaned$averageRating) # relatively straight line indicates normality

# Assumption check: test for linearity between dependent variable and main independet variable
plot(data_cleaned$runtimeMinutes, data_cleaned$averageRating, xlab = "Runtime Minutes", ylab = "Average Rating", main = "Scatterplot of Average Rating vs. Runtime Minutes")

## OUTPUT
# Save output
save(imdb_lm1,file="../../gen/analysis/output/model_results.R")
