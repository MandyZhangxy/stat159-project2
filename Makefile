# make variables:
rep = report/report.Rmd
RMD = report/sections/*.Rmd
images = images/*.png
credit = data/Credit.csv
scaled_credit = data/scaled_credit.csv


.PHONY: data tests eda regression report clean all

all: data eda training_testing regression report

#downlaod credit.csv
data:
	cd data; curl --remote-name http://www-bcf.usc.edu/~gareth/ISL/Credit.csv


#run eda.R to get summary/plot statistics & scaled_credit table
eda:
	cd code/scripts/ && Rscript eda.R

#set training/testing vectors and save in Rdata
training_testing:
	cd code/scripts/ && Rscript training_and_testing.R

test:

# perform ols and save in Rdata
ols:
	cd code/scripts/ && Rscript OLS.R

# perform ridge model and save in Rdata
ridge:

# perform lasso model and save in Rdata
lasso:
	cd code/scripts/ && Rscript lasso_regression_model.R

# perform pcr model and save in Rdata
pcr:

#perform plsr model and save in Rdata
plsr:
	cd code/scripts/ && Rscript plsr_model.R

# run all 5 regressions
regression:
	make ols
	make ridge
	make lasso
	make pcr
	make plsr

slides:

sesison:


clean:
	rm -f report/report.pdf

# accumulate all sections into one report.Rmd
$(rep): $(RMD)
	cat $(RMD) > $(rep)

# convert final report Rmd to pdf
report: report/report.Rmd
	Rscript -e 'library("rmarkdown");library("xtable");rmarkdown::render("$(rep)")'

