# OVERALL BUILD RULES

all: download merge clean_data
clean_data: ../../gen/data-preparation/temp/data_cleaned.csv
merge: ../../gen/data-preparation/temp/data_merged.csv
download: ../../data/datasets/title_basics.tsv ../../data/datasets/title_ratings.tsv

# INDIVIDUAL RECIPES

# Clean data
../../gen/data-preparation/temp/data_cleaned.csv: clean_data.R ../../gen/data-preparation/temp/data_merged.csv
	Rscript clean_data.R

# Merge data
../../gen/data-preparation/temp/data_merged.csv: merge_data.R ../../data/datasets/title_basics.tsv ../../data/datasets/title_ratings.tsv
	Rscript merge_data.R
	
# Download data	
../../data/datasets/title_basics.tsv ../../data/datasets/title_ratings.tsv: download_data.R 
	Rscript download_data.R 

# Clean-up: Deletes temporary files
clean: 
	Rscript --vanilla ../clean-up.R