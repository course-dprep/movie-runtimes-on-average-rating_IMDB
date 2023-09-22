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

# Save cleaned data
save(data_cleaned,file="../../gen/data-preparation/output/data_cleaned.RData")
