## SETUP 
library(dplyr)
library(tidyverse)

## INPUT
# Load merged data 
data_cleaned <- read_csv("gen/data-preparation/temp/data_merged.csv")

## TRANSFORMATION
# Filter title_basics by movie and create a new variable data_cleaned
data_cleaned <- data_cleaned %>% 
  filter(titleType == "movie")

#Rename tconst to title_id and startYear to year
data_cleaned <- data_cleaned %>% 
  rename(title_id = tconst) %>%
  rename(year = startYear)

# Remove endYear as there is no data in this column for movies
data_cleaned <- data_cleaned %>%
  select(-endYear)

# Fix the classes
data_cleaned <- data_cleaned %>%
  mutate(
    titleType = as.factor(titleType),
    isAdult = as.logical(isAdult),
    year = as.factor(year),
    runtimeMinutes = as.integer(runtimeMinutes),
    averageRating = as.numeric(averageRating),
    numVotes = as.integer(numVotes)
  )

#Remove missing observations from runtimeMinutes and averageRating
data_cleaned <- data_cleaned %>%
  filter(!is.na(runtimeMinutes) & !is.na(averageRating))

#Remove movies with a run time longer than 5 hours (300 minutes) to remove outliers
data_cleaned <- data_cleaned %>%
  filter(runtimeMinutes <= 300)

# Add new variable that shows whether a movie is classified as "short" or "long" based on average runtime
average_runtime <- mean(data_cleaned$runtimeMinutes, na.rm = TRUE)
data_cleaned <- data_cleaned %>%
  mutate(runtime_long_short = ifelse(runtimeMinutes > average_runtime, "long", "short"))

# Add new variable that shows a standardized version of the average ratings
mean_rating <- mean(data_cleaned$averageRating, na.rm = TRUE)
sd_rating <- sd(data_cleaned$averageRating, na.rm = TRUE)
rating_standardized <- (data_cleaned$averageRating - mean_rating) / sd_rating

data_cleaned <- data_cleaned %>%
  mutate(rating_standardized = round(rating_standardized, digits = 3))

## OUTPUT
# Save cleaned data
write_csv(data_cleaned,file="gen/data-preparation/temp/data_cleaned.csv")
