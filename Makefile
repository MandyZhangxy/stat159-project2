# make variables:
rep = report/report.Rmd
RMD = report/sections/*.Rmd
images = images/*.png
lasso_r = data/lasso_model.RData
ols_r = data/OLS.RData
ridge_r = data/all_ridge_mods.RData
pcr_r = data/pcr_fit.RData
plsr_r = data/plsr_model.RData

.PHONY: data tests eda ols ridge pcr plsr regressions report clean all slides session

all: data eda training_testing regressions report slides

#downlaod credit.csv
data:
	cd data; curl --remote-name http://www-bcf.usc.edu/~gareth/ISL/Credit.csv


#run eda.R to get summary/plot statistics & scaled_credit table
eda:
	cd code/scripts/ && Rscript eda.R

#set training/testing vectors and save in Rdata
training_testing:
	cd code/scripts/ && Rscript training_and_testing.R

# run the unit tests of functions
test:
	cd code/ && Rscript "test-that.R"

# perform ols and save in Rdata
ols:
	cd code/scripts/ && Rscript OLS.R

# perform ridge model and save in Rdata
ridge:
	cd code/scripts/ && Rscript ridge.R

# perform lasso model and save in Rdata
lasso:
	cd code/scripts/ && Rscript lasso_regression_model.R

# perform pcr model and save in Rdata
pcr:
	cd code/scripts/ && Rscript PCR.R

#perform plsr model and save in Rdata
plsr:
	cd code/scripts/ && Rscript plsr_model.R

# run all 5 regressions
regressions:
	make ols
	make ridge
	make lasso
	make pcr
	make plsr
# Generate slides:
slides:
	Rscript -e "library(rmarkdown);library("Matrix"); library("xtable"); render('slides/report.Rmd', 'ioslides_presentation')"

# Generate `session-info.txt`
session:
	bash session.sh

clean:
	rm -f report/report.pdf

# accumulate all sections into one report.Rmd
$(rep): $(RMD)
	cat $(RMD) > $(rep)

# convert final report Rmd to pdf
report: report/report.Rmd $(lasso_r) $(ols_r) $(pcr_r) $(plsr_r) $(ridge_r)
	Rscript -e 'library("rmarkdown");library("Matrix");library("xtable");rmarkdown::render("$(rep)")'

