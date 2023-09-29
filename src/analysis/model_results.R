# Load merged data 
load()

# Assumption check: test for homoskedasticity
library(car)
leveneTest(averageRating ~ runtimeMinutes, mergeddata, center=mean) # significant p-value means violated assumption of homoskedasticity

## Linear regression
# Research question: What is the relationship between the runtime and average user rating for movies?
lm1 <- lm(averageRating ~ runtimeMinutes , mergeddata)
# Correct data file name needed in lm function!

# Assumption check: test for independence of observations
dwtest(lm1) # a value near 2 suggests independence

# Assumption check: test for normality
shapiro.test(lm1$residuals) # assumption of normality is violated if p-value is significant

# Assumption check: test for linearity
plot(lm1, which = 1)

# Save data
save(lm1,file="./gen/analysis/output/model_results.R")