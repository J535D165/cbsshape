# CBS Wijk en Buurtkaart interface

This package provides a simple interface for the [CBS Wijk en Buurtkaart shapefiles](https://www.cbs.nl/nl-nl/dossier/nederland-regionaal/geografische-data). These shapefiles are available on the website of CBS.

## Installation

Install the package directly from Github with `devtools`. The package requires `sf` for reading shapefiles.
```
install_github("J535D165/cbsshape")
```

## Usage

Read municipality shapefiles (gemeenten) from 2017.

``` R
library(cbsshape)

st_read_cbs(2017)
```

## Download

One can use `cbsshape` to download shapefiles.
``` R
download_cbs_shapefile(2017, "data/")
```

and read the local shapefile

``` R
st_read_cbs(2017, "data/")

```

## Examples

### Population density

``` R
library(cbsshape)
library(ggplot2)

# download 2017 data
wijk_en_buurt_2017 <- st_read_cbs(2017)

# plot map
g <- ggplot(wijk_en_buurt_2017) + 
  geom_sf(aes(fill=AANT_INW/OPP_TOT)) + 
  ggsave("density.png")
```

### Distance to Amsterdam

Compute the distance between every municipality in The Netherlands and the
city of Amsterdam. 

```
library(cbsshape)
library(sf)
library(tidyverse)

# download 2017 data
wijk_en_buurt_2017 <- st_read_cbs(2017) %>%     
  filter(GM_CODE != "GM9999")

# compute the centroids
df_centroids <- wijk_en_buurt_2017 %>% 
  group_by(GM_CODE, GM_NAAM) %>% 
  summarise(geometry = st_combine(geometry)) %>% 
  mutate(centroid = st_centroid(geometry)) %>%
  st_drop_geometry() %>% 
  ungroup()

# compute the centroid of Amsterdam
centroid_amsterdam <- df_centroids %>% 
  filter(GM_NAAM == "Amsterdam") %>% 
  pull(centroid)

# Compute the distance to Amsterdam
st_distance(df_centroids$centroid, centroid_amsterdam)

```



