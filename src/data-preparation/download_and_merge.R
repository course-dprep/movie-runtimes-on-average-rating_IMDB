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
download_data(url = "https://datasets.imdbws.com/title.basics.tsv.gz", filename = "title_basics.tsv", filepath = "./data")
download_data(url = "https://datasets.imdbws.com/title.ratings.tsv.gz", filename = "title_ratings.tsv", filepath = "./data")

#Load the data
title_basics <- read_tsv("./data/title_basics.tsv")
title_ratings <- read_tsv("./data/title_ratings.tsv")

#Filter title_basics by movie and create a new variable movie_basics
movies_basics <- title_basics %>% filter(titleType == "movie")

# Inspect data
head(movies_basics)
head(title_ratings)

# Remove endYear as there is no data in this column
movies_basics <- movies_basics %>%
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
