README file for Getting and Cleaning Data ([https://class.coursera.org/getdata-002/]) course project
=============

The project includes:
* UCI_HAR_Dataset.zip -- initial dataset
* run_analysis.R -- cleaning script written in R language
* tidy.txt -- clean dataset, result of `run_analysis` execution
* CodeBook.md -- codebook for `tidy.txt`
* README.md -- this file


`run_analysis.R` script consists of the following methods (functions):
* `prepareDataSets()` -- preparation work, unzips (and downloads zip if not present) file with dataset, set working directory; used in `run_analysis()`
* `combineDataSets()` -- make one dataset from both training and test datasets; used in `tideDataSet()`
* `tideDataSet()` -- creates tidy set: groups the data by activity and subject, calculates average by those groups; used in `run_analysis()`
* `run_analysis()` -- do the job

Sample usage:

```R
setwd("getdata-pa-01")
source("run_analysis.R")
run_analysis("output-new-dataset.txt")
```
