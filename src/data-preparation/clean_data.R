## SETUP 
library(dplyr)
library(tidyverse)

## INPUT
# Load merged data 
read_csv("../../gen/data-preparation/temp/data_merged.csv")

## TRANSFORMATION
# Filter title_basics by movie and create a new variable data_cleaned
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

# Recode missing values '\N' to 'NA' and remove missing values of primaryTitle, originalTitle and runtimeMinutes in title_basics
title_basics <- title_basics %>% mutate_all(~ifelse(. == "\\N", NA, .)) %>% drop_na(c("primaryTitle", "originalTitle", "runtimeMinutes"))

# Search for missing values for averageRating in title_ratings and remove them if that is the case
if (any(is.na(title_ratings$averageRating))){
  # If missing values for averageRating are found, remove them
  title_ratings <- title_ratings %>% drop_na("averageRating")
} else {
  # If no missing values for averageRating are found, do nothing
}

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

#Remove duplicates 
data_cleaned <- data_cleaned %>% filter(!duplicated(data_cleaned))

## OUTPUT
# Save cleaned data
write_csv(data_cleaned,file="../../gen/data-preparation/temp/data_cleaned.csv")
