all: ../../gen/analysis/output/model_results.R data_exploration.html

data_exploration.html: data_exploration.Rmd
	Rscript data_exploration.Rmd
	
../../gen/analysis/output/model_results.R: model_results.R ../../gen/data-preparation/temp/data_cleaned.csv
	Rscript model_results.R