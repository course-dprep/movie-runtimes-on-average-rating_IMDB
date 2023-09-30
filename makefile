all: title_basics.tsv title_ratings.tsv

title_basics.tsv title_ratings.tsv: src/data-preparation/download_data.R
	Rscript src/data-preparation/download_data.R
	
data_merged.csv: src/data-preparation/merge_data.R
	Rscript src/data-preparation/merge_data.R
	
data_cleaned.csv: src/data-preparation/clean_data.R
	Rscript src/data-preparation/clean_data.R