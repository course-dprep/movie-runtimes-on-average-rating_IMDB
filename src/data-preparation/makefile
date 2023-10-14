# OVERALL BUILD RULES

all: download data_exploration merge cleandata
cleandata: ../../gen/data-preparation/temp/data_cleaned.csv
merge: ../../gen/data-preparation/temp/data_merged.csv
data_exploration: ../../gen/data-preparation/output/data_exploration.html
download: ../../data/datasets/title_basics.tsv ../../data/datasets/title_ratings.tsv

# INDIVIDUAL RECIPES

# Clean data
../../gen/data-preparation/temp/data_cleaned.csv: clean_data.R ../../gen/data-preparation/temp/data_merged.csv
	Rscript clean_data.R

# Merge data
../../gen/data-preparation/temp/data_merged.csv: merge_data.R ../../data/datasets/title_basics.tsv ../../data/datasets/title_ratings.tsv
	Rscript merge_data.R
	
# Explore raw dataset
../../gen/data-preparation/output/data_exploration.html: data_exploration.Rmd
	R -e "rmarkdown:: render('data_exploration.Rmd', output_dir= '../../gen/data-preparation/output/')"
	
# Download data	
../../data/datasets/title_basics.tsv ../../data/datasets/title_ratings.tsv: download_data.R 
	Rscript download_data.R 

