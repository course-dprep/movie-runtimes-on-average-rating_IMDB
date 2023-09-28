## SETUP
library(dplyr)

## INPUT
read_csv("../../gen/data-preparation/temp/data_cleaned.csv")

## TRANSFORMATION
## Linear regression
# Research question: What is the relationship between the runtime and average user rating for movies?
imdb_lm1 <- lm(averageRating ~ runtimeMinutes , data_cleaned)

## OUTPUT
# Save output
save(imdb_lm1,file="../../gen/analysis/output/model_results.R")
