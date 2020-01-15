# install.packages("ggplot2")

# install.packages("ggspatial")
# install.packages("rgeos")
# install.packages("rosm")


library(ggplot2)
library(sp)
library(rgdal)
library(rgeos)
library(ggspatial)

ggplot(diamonds)
ggplot(diamonds, aes(x=carat, y=price, color=cut, shape=color)) +
    geom_point() + labs(title="this is the title", x="Carat", y="ccc")

plot(diamonds$carat, diamonds$price, col=diamonds$cut)

ggplot(data=world)
rm(shp)
shp <- readOGR("/Volumes/GoogleDrive/My Drive/Course Work/GIS 713/homework_4/cb_2015_us_county_20m/cb_2015_us_county_20m.shp")
plot(shp)
class(shp)
shp <- subset(shp, STATEFP != "02")
shp <- subset(shp, STATEFP != "15")
shp <- subset(shp, STATEFP != "72")


shpDf <- as.data.frame(shp)
ggplot() + 
    annotation_spatial(shp) +
    annotation_map_tile(type="osm") +
    layer_spatial(shp) +
    annotation_scale(location="tl") +
    annotation_north_arrow(location="br", which_north="true")




data(mtcars)

x <- mtcars$mpg
y <- mtcars$disp

smoothScatter_J <- function(x, y) {
    require(RColorBrewer)
    smoothScatter(x, y, colramp = colorRampPalette(brewer.pal(5, "Spectral")))
    fit <- lm(y~x)
    abline(fit, col="red")
    cf <- round(coef(fit), 2)
    eq <- paste("y=", ifelse(sign(cf[2]) == 1, "", "-"), abs(cf[2]), "x", 
                ifelse(sign(cf[1]) == 1, "+", "-"), abs(cf[1]), "," , sep="")
    val <- round(summary(fit)$r.squared, 2)
    legendLabel <- bquote(.(eq) ~ R^2 == .(val))
    legend("bottomright", legend=legendLabel)
}

smoothScatter_J(x, y)



data(cars)
summary(cars)

cars$qspeed <- cut(cars$speed, breaks=quantile(cars$speed), include.lowest=TRUE)
layout(matrix(1:2, nrow = 1))
plot(dist ~ qspeed, data=cars)
boxplot(dist ~ qspeed, data=cars)

fit <- lm(dist~qspeed, data=cars)
summary(fit)
abline(fit)
plot(dist ~ speed, data=cars)


abline(h=2)

library(sp)

getClass("CRS")

library(sp)
data(meuse)

coordinates(meuse) <- c("x", "y")
class(meuse)

plot(meuse)
cc <- coordinates(meuse)
m.sl <- SpatialLines(list(Lines(list(Line(cc)), "line1")))
plot(m.sl)
data(meuse.riv)
meuse.lst <- list(Polygons(list(Polygon(meuse.riv)), "meuse.riv"))
meuse.pol <- SpatialPolygons(meuse.lst)
plot(meuse.pol, col="grey")


data(meuse.grid)
plot(meuse.grid)
coordinates(meuse.grid) <- c("x", "y")
meuse.grid <- as(meuse.grid, "SpatialPixels")
image(meuse.grid, col="grey")

SpatialPolygonsRescale(layout.scale.bar(), offset=locator(1), scale=1000, fill=c("transparent", "black"), plot.grid=FALSE)
text(locator(1), "0")
text(locator(1), "1 km")

SpatialPolygonsRescale(layout.north.arrow(), offset=locator(1), scale=400, plot.grid=FALSE)


sp.theme