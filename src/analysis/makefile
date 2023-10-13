all: data_exploration.html ../../gen/analysis/output/model_results.R

data_exploration.html: data_exploration.Rmd
	R -e “rmarkdown::render(‘data_exploration.Rmd’)"

../../gen/analysis/output/model_results.R: model_results.R ../../gen/data-preparation/temp/data_cleaned.csv
	Rscript model_results.R