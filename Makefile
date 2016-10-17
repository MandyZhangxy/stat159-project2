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


report:

slides:

sesison:


clean:
	rm -f report/report.pdf




