all: derived

.PHONY: all derived

derived:
	$(MAKE) -C src/data-preparation
	$(MAKE) -C src/analysis
	$(MAKE) -C src/paper
	
# Clean-up: Deletes temporary files
clean: 
	Rscript --vanilla src/clean-up.R