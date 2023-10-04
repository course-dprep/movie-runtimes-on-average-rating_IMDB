#gen/analysis/output/model_results.R: src/analysis/model_results.R gen/data-preparation/temp/data_cleaned.csv
#	Rscript src/analysis/model_results.R

gen/data-preparation/temp/data_cleaned.csv: src/data-preparation/clean_data.R gen/data-preparation/temp/data_merged.csv
	Rscript src/data-preparation/clean_data.R

gen/data-preparation/temp/data_merged.csv: src/data-preparation/merge_data.R data/dataset/title_basics.tsv data/dataset/title_ratings.tsv
	Rscript src/data-preparation/merge_data.R
	
data/dataset/title_basics.tsv data/dataset/title_ratings.tsv: src/data-preparation/download_data.R 
	Rscript src/data-preparation/download_data.R 
	
clean: 
	Rscript --vanilla src/clean-up.R

