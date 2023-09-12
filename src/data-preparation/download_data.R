# Download dataset 1
# dir.create('./data/dataset1')  # Uncomment if need to create directory with R
download.file('https://datasets.imdbws.com/title.basics.tsv.gz', destfile = filename)

# Download dataset 2
# dir.create('./data/dataset2')  # Uncomment if need to create directory with R
download.file('https://datasets.imdbws.com/title.ratings.tsv.gz', destfile = filename)

