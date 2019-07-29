#' Read CBS Wijk en Buurtkaart
#'
#' Read shapefiles from the CBS Wijk en Buurtkaart with the package sf.
#'
#' @param year Read the shape file from this year.
#' @param level Level of detail of the returned results. Options are
#'   "gem", "buurt", "wijk". Default "gem".
#' @param path Local path to the shape files. If NULL, the shapefiles are
#'   downloaded and a temporary path is created.
#' @param wgs84 Return results in WGS84 coordinates (CRS 4326). Default
#'   FALSE (result in Rijksdriehoek Coordinaten).
#' @param verbose Verbosity. Default TRUE.
#' @return st object with the CBS Wijk en Buurtkaart
#' @examples
#' cbs_shape_read(2017)
#' cbs_shape_read(2018, level="buurt")
#' cbs_shape_read(2018, wgs84=TRUE)
#' cbs_shape_read(2016, path="wijkenbuurt2016")
cbs_shape_read <- function(year, level="gem", path=NULL, wgs84=FALSE, verbose=TRUE) {

  if (is.null(path)){
    path = download_cbs_shapefile(year, verbose=verbose)
  }

  if (!(level %in% c("gem", "buurt", "wijk"))){
    stop("level should be 'gem', 'buurt' or 'wijk'")
  }

  # shapefile path
  shp_path <- Sys.glob(file.path(path, sprintf("*%s*%s*.shp", level, year)))

  # load shape
  shp <- st_read(shp_path[[1]])

  if (wgs84){
    shp <- st_transform(shp, 4326)
  }

  return(shp)
}

st_read_cbs <- cbs_shape_read
