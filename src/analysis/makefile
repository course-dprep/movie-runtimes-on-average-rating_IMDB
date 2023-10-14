# OVERALL BUILD RULES
all: paper model
model: ../../gen/analysis/output/model_results.R 
paper: ../../gen/paper/output/data_analysis.pdf

../../gen/analysis/output/model_results.R: model_results.R ../../gen/data-preparation/temp/data_cleaned.csv
	Rscript model_results.R
	
../../gen/paper/output/data_analysis.pdf: data_analysis.Rmd
	R -e "rmarkdown:: render('data_analysis.Rmd', output_dir= '../../gen/paper/output/')"
