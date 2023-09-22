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

#Use the function to download the datasets from IMDB and put into correct location
download_data(url = "https://datasets.imdbws.com/title.basics.tsv.gz", filename = "title_basics.tsv", filepath = "../../data/dataset1")
download_data(url = "https://datasets.imdbws.com/title.ratings.tsv.gz", filename = "title_ratings.tsv", filepath = "../../data/dataset2")
