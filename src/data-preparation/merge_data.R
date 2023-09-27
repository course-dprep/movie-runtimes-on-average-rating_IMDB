library(dplyr)
library(tidyverse)

#Load the data into R
title_basics <- read_tsv("../../data/dataset1/title_basics.tsv")
title_ratings <- read_tsv("../../data/dataset2/title_ratings.tsv")

# Combine data by tconst 
combined_data <- left_join(title_basics, title_ratings, by = "tconst")

# Save merged data
save(combined_data,file="../../gen/data-preparation/temp/data_merged.csv")
