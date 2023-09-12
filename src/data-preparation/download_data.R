# Download dataset 1
# dir.create('./data/dataset1')  # Uncomment if need to create directory with R
download.file('https://datasets.imdbws.com/title.basics.tsv.gz', "title_basics.tsv")
library(tidyverse)
title_basics <- read_tsv("title_basics.tsv", n_max = 100)
View(title_basics)

# Download dataset 2
# dir.create('./data/dataset2')  # Uncomment if need to create directory with R
download.file('https://datasets.imdbws.com/title.ratings.tsv.gz', "title_ratings.tsv")
title_ratings <- read_tsv("title_ratings.tsv", n_max = 100)
