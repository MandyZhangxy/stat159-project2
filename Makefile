rep = report/report.Rmd
RMD = report/sections/*.Rmd
images = images/*.png


.PHONY: data tests eda regression report clean all

all: eda regression report
data:
	cd data; curl --remote-name http://www-bcf.usc.edu/~gareth/ISL/Credit.csv

tests:


eda:

ols:


ridge:


lasso:


pcr:


plsr:

regression:

slides:

sesison:


clean:
	rm -f report/report.pdf

$(rep): $(RMD)
	cat $(RMD) > $(rep)
		
report: report/report.Rmd


