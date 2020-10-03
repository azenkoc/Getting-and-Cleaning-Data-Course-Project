# Getting-and-Cleaning-Data-Course-Project

---
title: "Untitled"
author: "Azen Koc"
date: "04 10 2020"
---

README.md

Getting and Cleaning Data Course Project

This project uses data from [link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones). which contains Activities of 30 human within an age bracket of 19-48 years. run_analysis.R script is the main code utilizes these data and does the following.

1- Get merge 2 data set, test and training, together and label them according to the data supplied together in the previous study.

2-Acitivities initially labeled numeric 1-6 changed by corresponding activity name.(check Code Book). Also features vectors labeled according to feature info file supplied with the previous study.

3-Tidied merged data set refined by extractinge measurements on the mean and standard deviation for each measurement.

4-Independent data set, containing average of each variable for each activity and each subject. Data melted and casted according to Subject and Activity columns.

5- Resulting tidy data set written as tidyDataSet.csv. 
