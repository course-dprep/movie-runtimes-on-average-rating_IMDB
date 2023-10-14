# OVERALL BUILD RULES

all: paper 

paper: ../../gen/paper/output/data_analysis.pdf

# INDIVIDUAL RECIPES

../../gen/paper/output/data_analysis.pdf: data_analysis.Rmd
	R -e "rmarkdown:: render('data_analysis.Rmd', output_dir= '../../gen/paper/output/')"