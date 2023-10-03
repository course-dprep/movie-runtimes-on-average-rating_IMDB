
## SETUP
library(dplyr)
library(car)

## INPUT
data_cleaned <- read_csv("../../gen/data-preparation/temp/data_cleaned.csv")

## TRANSFORMATION
## Linear regression
# Research question: What is the relationship between the runtime and average user rating for movies?
imdb_lm1 <- lm(averageRating ~ runtimeMinutes , data_cleaned)

# Assumption check: test for homoskedasticity
leveneTest(averageRating ~ runtimeMinutes, data_cleaned, center=mean) # significant p-value means violated assumption of homoskedasticity

# Assumption check: test for independence of observations
dwtest(lm1) # a value near 2 suggests independence

# Assumption check: test for normality
shapiro.test(lm1$residuals) # assumption of normality is violated if p-value is significant

# Assumption check: test for linearity
plot(lm1, which = 1)

## OUTPUT
# Save output
save(imdb_lm1,file="../../gen/analysis/output/model_results.R")