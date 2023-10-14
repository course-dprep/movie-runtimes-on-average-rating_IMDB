# OVERALL BUILD RULES
all: model

model: ../../gen/analysis/output/model_results.R 

# INDIVIDUAL RECIPES

../../gen/analysis/output/model_results.R: model_results.R ../../gen/data-preparation/temp/data_cleaned.csv
	Rscript model_results.R
	

