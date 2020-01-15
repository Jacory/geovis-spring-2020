# fread can specify na values
npnDT <- fread("NPN_obs.dat", stringsAsFactors=F, na.strings=c("-9999", "'-9999", "<NA>","NA"))

# convert date to DOY
as.integer(strftime(as.Date(observation_date), format="%Y"))

# specify raster NA value
NAvalue(img) <- 32767

# can do stack
mcd12q2_stack <- stack(GetSDS(mcd12q2_file, c("Greenup", "MidGreenup", "Maturity", "Peak", "Senescence", "MidGreendown", "Dormancy")))