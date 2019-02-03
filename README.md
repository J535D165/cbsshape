# CBS Wijk en Buurtkaart interface

This package provides a simple interface for the CBS Wijk en Buurtkaart shapefiles. These shapefiles are available on the website of CBS.

## Installation

Install the package directly from Github. The package requires `sf` for reading shapefiles.
```
install_github("J535D165/cbsshape")
```

## Usage

Read municipality shapefiles (gemeenten) from 2017.

``` R
> st_read_cbs(2017)

```

## Download

One can use `cbsshape` to download shapefiles.
``` R
> download_cbs_shapefile(2017, "data/")
```

and read the local shapefile

``` R
> st_read_cbs(2017, "data/")

```








