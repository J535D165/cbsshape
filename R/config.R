shapefiles <- c(
  "2009"="http://download.cbs.nl/regionale-kaarten/2009-buurtkaart-gn-3.zip",
  "2010"="http://download.cbs.nl/regionale-kaarten/2010-buurtkaart-shape-versie-3.zip",
  "2011"="http://download.cbs.nl/regionale-kaarten/2011-buurtkaart-shape-versie-3.zip",
  "2012"="http://download.cbs.nl/regionale-kaarten/shape-2012-versie-3.0.zip",
  "2013"="http://download.cbs.nl/regionale-kaarten/shape-2013-versie-3-0.zip",
  "2014"="https://www.cbs.nl/-/media/_pdf/2016/35/shape%202014%20versie%2030.zip",
  "2015"="https://www.cbs.nl/-/media/_pdf/2017/36/buurt_2015.zip",
  "2016"="https://www.cbs.nl/-/media/cbs/dossiers/nederland%20regionaal/wijk-en-buurtstatistieken/shape%202016%20versie%2030.zip", 
  "2017"="https://www.cbs.nl/-/media/cbs/dossiers/nederland%20regionaal/wijk-en-buurtstatistieken/wijkbuurtkaart_2017_v3.zip",
  "2018"="https://www.cbs.nl/-/media/cbs/dossiers/nederland%20regionaal/wijk-en-buurtstatistieken/wijkbuurtkaart_2018_v2.zip"
)

#' List available CBS wijk en buurtkaarten
#'
#' @return List of available shapefiles
#' @export
#'
#' @examples
#' cbs_shape_list()
cbs_shape_list <- function(){
  return(shapefiles)
}

list_cbs_shapefiles <- cbs_shape_list
