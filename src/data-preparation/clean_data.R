library(dplyr)
library(tidyverse)

# Load merged data 
load("../../gen/data-preparation/temp/data_merged.RData")

# Filter title_basics by movie and create a new variable movie_basics
data_cleaned <- combined_data %>% 
  filter(titleType == "movie")

#Rename tconst to title_id
data_cleaned <- data_cleaned %>% 
  rename(title_id = tconst)

# Remove endYear as there is no data in this column for movies
data_cleaned <- data_cleaned %>%
  select(-endYear)

# Fix the classes
data_cleaned <- data_cleaned %>%
  mutate(
    titleType = as.factor(titleType),
    isAdult = as.logical(isAdult),
    startYear = as.factor(startYear),
    runtimeMinutes = as.integer(runtimeMinutes),
    averageRating = as.numeric(averageRating),
    numVotes = as.integer(numVotes)
  )

#Remove NAs
data_cleaned <- data_cleaned %>%
  drop_na()

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

# Save cleaned data
save(data_cleaned,file="../../gen/data-preparation/output/data_cleaned.RData")
