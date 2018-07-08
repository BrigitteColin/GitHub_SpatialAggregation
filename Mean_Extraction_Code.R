# combined script for fc raster analysis - paper 2 #################

# libraries ####
library(ggplot2)
library(gbm)
library(caret)
library(tidyverse)
library(dplyr)
library(rpart)

library(gbm)
library(dismo)
library(sp)
library(dplyr)
library(plyr)

library(raster)
library(tidyverse)

library(GISTools)

library(rgdal)
library(rgeos)
library(tictoc)
require(rgdal)




#############################################################################
#---------------------------------------------------------------------------
#           extracting means from grids write -> csv file
#
#---------------------------------------------------------------------------
#############################################################################

setwd('Y:/Landsat_DSITI/102_072')
#myShapefile<-readOGR(dsn="C:/Maps", layer="bounds")
shape_12k <- readOGR(dsn="Y:/Landsat_DSITI/102_072/grid", layer="12k") # 360 features, 8 fields
shape_6k <- readOGR(dsn="Y:/Landsat_DSITI/102_072/grid", layer="6k") #  1400features, 8 fields
shape_3k <- readOGR(dsn="Y:/Landsat_DSITI/102_072/grid", layer="3k") #  5530 features, 8 fields, 3 min
shape_1500k <- readOGR(dsn="Y:/Landsat_DSITI/102_072/grid", layer="1500k") #  49115 features, 8 fields, 3 min

plot(shape_3k)

#check path and permissions, list files when ok 
all_masked <-list.files("Y:/Landsat_DSITI/102_072/Masked/FCover_scenes") #character vector
years<- all_masked[grepl("_201612", all_masked)] 
years

#dec<- all_masked[grepl("12_\\.*", years)] 


#all 4 bands, read in with brick to keep layers 
testfile<-brick('Masked/FCover_scenes/Masked_l7tmre_p102r072_20161219_dilm3.img') #takes 2 sec
testfile@file@nbands # bands as 4 covariates
testfile@data@nlayers# 4 bands
testfile@data@names #list "names"

x <- testfile[[2]] #list "name"
x@data #singel data layer


#extract raster values from grid cell ####
tic("data generation")
rastervalues_gridcell <- raster::extract(x=x, y=shape_3k, fun=mean, na.rm=TRUE) #NA removed before fun is applied. 
fcmeans <- as.data.frame(rastervalues_gridcell)
toc()

tic("write a csv file")
write.csv(fcmeans, file = "Masked/means/Masked_test_3k2016.csv")
toc()

rm(fcmeans, rastervalues_gridcell,testfile,x)



