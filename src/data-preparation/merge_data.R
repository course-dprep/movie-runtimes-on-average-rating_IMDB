## SETUP
library(dplyr)
library(tidyverse)

## INPUT
#Load the data into R
title_basics <- read_tsv("../../data/dataset/title_basics.tsv")
title_ratings <- read_tsv("../../data/dataset/title_ratings.tsv")

## TRANSFORMATION
# Combine data by tconst 
combined_data <- left_join(title_basics, title_ratings, by = "tconst")

## OUTPUT
# Save merged data
write_csv(combined_data,file="../../gen/data-preparation/temp/data_merged.csv")
