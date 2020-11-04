

library(rgdal)
library(leaflet)


categ<- readOGR("D:/OCDE results/All/Post_Relleno_filtro.shp",
                  layer = "Post_Relleno_filtro", GDAL1_integer64_policy = FALSE)

pal <- colorBin("YlOrRd", domain = categ$categoria_, bins = 2)


cat <- leaflet(categ) %>%
  addTiles() %>%
  addPolygons( weight = 1, smoothFactor = 0.5,
              opacity = 1.0, fillOpacity = 0.5,
              fillColor = ~pal(categoria_), color = "#444444",
              highlightOptions = highlightOptions(color = "white", weight = 2,
                                                  bringToFront = TRUE),  label = ~as.character(categ$POBTOT))

cat
