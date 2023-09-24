## Linear regression
# Research question: What is the relationship between the runtime and average user rating for movies?
lm1 <- lm(averageRating ~ runtimeMinutes , mergeddata)
# Correct data file name needed in lm function!

# Save data
save(lm1,file="./gen/analysis/output/model_results.R")