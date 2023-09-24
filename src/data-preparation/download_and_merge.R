library(dplyr)
library(tidyverse)

#Create a function download_data which downloads files from URLs. 
#Downloaded data assigned filename, storage path, and URL. 
download_data <- function(url, filename, filepath) {
  # Create directory if it doesn't exist
  if (!dir.exists(filepath)) {
    dir.create(filepath)
  }
  
# Download file
  download.file(url = url, destfile = paste0(filepath, "/", filename))
}

#Use the function to download the datasets from IMDB
download_data(url = "https://datasets.imdbws.com/title.basics.tsv.gz", filename = "title_basics.tsv", filepath = "./src")
download_data(url = "https://datasets.imdbws.com/title.ratings.tsv.gz", filename = "title_ratings.tsv", filepath = "./src")

#Load the data
title_basics <- read_tsv("./src/title_basics.tsv")
title_ratings <- read_tsv("./src/title_ratings.tsv")

#Filter title_basics by movie and create a new variable movie_basics
movies_basics <- title_basics %>% filter(titleType == "movie")

# Inspect data
head(title_basics)
head(title_ratings)

# Remove endYear as there is no data in this column
title_basics <- title_basics %>%
  select(-endYear)

# Combine data by tconst and rename tconst into title_id
combined_data <- left_join(movies_basics, title_ratings, by = "tconst")
combined_data <- combined_data %>%
  rename(title_id = tconst)


# Fix the classes
combined_data <- combined_data %>%
  mutate(
    startYear = as.integer(startYear),
    endYear = as.integer(endYear),
    runtimeMinutes = as.integer(runtimeMinutes),
    averageRating = as.numeric(averageRating),
    numVotes = as.integer(numVotes)
  )

# Add new variable, whether a movie is classified as "short" or "long"
average_runtime <- mean(combined_data$runtimeMinutes, na.rm = TRUE)

combined_data <- combined_data %>%
  mutate(
    runtime_long_short = ifelse(runtimeMinutes > average_runtime, "long", "short")
  )

# Add a new variable, to standardize the ratings
mean_rating <- mean(combined_data$averageRating, na.rm = TRUE)
sd_rating <- sd(combined_data$averageRating, na.rm = TRUE)

rating_standardized <- (combined_data$averageRating - mean_rating) / sd_rating

combined_data <- combined_data %>%
  mutate(
    rating_standardized = round(rating_standardized, digits = 3)
  )






