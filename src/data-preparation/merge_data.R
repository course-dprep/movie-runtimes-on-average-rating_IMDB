## SETUP
library(tidyverse)

## INPUT
#Load the data into R
title_basics <- read_tsv("../../data/datasets/title_basics.tsv")
title_ratings <- read_tsv("../../data/datasets/title_ratings.tsv")

## TRANSFORMATION
# Combine data by tconst 
data_merged <- left_join(title_basics, title_ratings, by = "tconst")

## OUTPUT
# Save merged data
write_csv(data_merged,file="../../gen/data-preparation/temp/data_merged.csv")