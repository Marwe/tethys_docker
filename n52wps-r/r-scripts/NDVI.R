# wps.des: NDVI, title = NDVI-calculator, abstract = Calculates NDVI from two channels in raster image bd_RED and bd_IR are the band numbers;
# wps.in: image, geotiff_image, input geotiff image;
# wps.in: bd_RED, integer, value = 1, red band channel number;
# wps.in: bd_IR, integer, value = 4, ir band channel number;

require("raster")

rc<-raster(image,band=bd_RED)

# TODO how to check?
# if (nbands(rc) < max(bd_RED,bd_IR)){
#         stop("Number of bands to low!") 
#         }

irc<-raster(image,band=bd_IR)
NDVI <- overlay(
                rc,
                irc,
                fun=function(x,y){(y-x)/(y+x)}
                )

# wps.out: NDVI, geotiff_image, output geotiff;
