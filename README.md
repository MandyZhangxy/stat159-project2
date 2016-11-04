#STAT 159 - fall-2016 project 2

This repository holds the second project for the fall 2016 Statistics 159 at UC Berkeley.

This assignment is about applying the computational toolkit (plus R) to reproduce regression analysis collaboratively in teams of two members. More specifically, the idea is to reproduce the analysis from sections 6.2, 6.3, 6.6 and 6.7 in Chapter 6:*Linear Model Selection and Regularization*, from the book "An introduction to Statistical Learning" (by James et at) at http://www-bcf.usc.edu/~gareth/ISL/.

The purpose of this assignment is to extend the scope of the previous HW2. In addition to keep applying regression analysis in R -- using `lm()`-- I will also write some functions as well as their unit tests. 

In this repository 
```
stat159-project2/
	.gitignore
	README.md
	LICENSE
	Makefile
	session-info.txt                    
	code/
		README.md
	  	...
	  	functions/
	  		...
	  	scripts/
	  		...
	  	tests/
	  		...
	data/
		...
	images/
		...
	report/
		report.Rmd
		report.pdf
		sections/
			...
```

###For a "competent" user: if you want to recreate our analysis and report, you can:
1. git clone the repository or download it.
2. In your terminal,`cd` into directory
3. run the Makefile by command `make` and then it will execute all scripts and get all output such as `report.pdf`.


Author: Xinyu Zhang Zhongling Jiang

<a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc/4.0/">Creative Commons Attribution-NonCommercial 4.0 International License</a>. 

All source code (i.e. code in R script files) is licensed under GNU General Public License, version 3. See the LICENSE file for more information




