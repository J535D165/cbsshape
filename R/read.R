#' Read CBS Wijk en Buurtkaart
#'
#' Read shapefiles from the CBS Wijk en Buurtkaart with the package sf.
#'
#' @param year Read the shape file from this year.
#' @param path Local path to the shape files. If NULL, the shapefiles are
#'   downloaded and a temporary path is created.
#' @param verbose Verbosity. Default TRUE.
#' @return st object with the CBS Wijk en Buurtkaart
#' @examples
#' st_read_cbs(2017)
st_read_cbs <- function(year, path=NULL, verbose=TRUE) {

  if (is.null(path)){
    path = download_cbs_shapefile(year, verbose=verbose)
  }

  shp <- st_read(file.path(path, sprintf("gem_%s.shp", year)))

  return(shp)
}
