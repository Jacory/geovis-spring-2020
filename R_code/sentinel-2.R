library(raster)
library(rgdal)
library(data.table)
library(sp)

source("CommonFunctions.R")

# ==================== Pre-defined functions ====================


# ==================== here program goes ====================

# read flux tower metadata
fluxMetaFilename <- "/Volumes/SEAL/Fluxnet/metadata_fluxnet2015/sites_fluxnet2015.csv"
fluxMeta <- fread(fluxMetaFilename)
coordinates(fluxMeta) <- ~ lat + lon

# read modis data
imgDir <- "/Volumes/SEAL/MCD12Q2C6/"


comd <- paste("curl -O", "http://storage.googleapis.com/gcp-public-data-sentinel-2/tiles/17/S/NA/S2A_MSIL1C_20151020T162042_N0204_R140_T17SNA_20151020T162040.SAFE", sep = " ")
system(comd)