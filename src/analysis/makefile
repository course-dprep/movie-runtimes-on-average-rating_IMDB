all: model_results.R

clean:
	R -e "unlink('*.html')"

data_exploration.html: data_exploration.Rmd
	Rscript data_exploration.Rmd
	
model_results.R: model_results.R
	Rscript model_results.R