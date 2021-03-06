# wps.des: NDVI, title = NDVI-calculator, abstract = Calculates NDVI from two channels in raster image bd_RED and bd_IR are the band numbers;
# wps.in: image, geotiff_image, inputgeotiffimage;

# wps.in: bd_RED, integer, abstract =red band channel number, value =1;
# wps.in: bd_IR, integer, abstract =ir band channel number, value =4;

require("raster")

# TODO how to check bands?
rc<-raster(image,band=bd_RED)
irc<-raster(image,band=bd_IR)

NDVI <- overlay(
                rc,
                irc,
                fun=function(x,y){(y-x)/(y+x)}
                )

NDVIfile=tempfile(pattern = "NDVI_r_wps", tmpdir = tempdir(), fileext = ".tiff")
writeRaster(NDVI, output=NDVIfile,"GTiff",overwrite=TRUE)

# wps.out: NDVIfile, geotiff_image, outputgeotiff;
