# GitHub_SpatialAggregation


Project Title: 
Here we provide the R code for delineating FCover information using an evenly spread grid as on overlay that will be used to aggregation all fractions within the grid cell to one value, using the arithmetic mean. The code has been used for our paper with the title "Influence of Spatial Aggregation on Prediction Accuracy of Green Vegetation using Boosted Regression Trees". 

Getting Started:
Please use/download the 
- R (as the program/scripting language)
- RStudio as the IDE and GUI for R
- R gbm package on CRAN (https://cran.r-project.org/web/packages/gbm/index.html) 
- Guide to the gbm package by Greg Ridgeway, http://www.saedsayad.com/docs/gbm2.pdf
- Guide on Package ‘gbm’, March 21, 2017, https://cran.r-project.org/web/packages/gbm/gbm.pdf
- R file containing the extraction code (name: Mean_Extraction_Code.R)
- spatial grid in 1:3000 as a GIS shape file (name: 3k.shp)
- one FCover scene (name: Masked_l4tmre_p102r072_19881120_dilm3.img)

Extraction code:
Take the "Mean_Extraction_Code" and open it. Set absolute/relative path to your working environment (including working directiory). The extraction can take between 7 and 9 hours per scene. 

Versioning:
The computational environment was the R statistical modelling software version 3.3.3 running inside Windows 7 SP1 (64-bit) on a 2.60 GHz Intel i7 CPU with 16 GB of RAM. 

Authors:
Brigitte Colin








