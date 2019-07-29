#' Check if CBS Wijk en Buurtkaart exists
#'
#' Check if shapefile exists.
#'
#' @param year Read the shape file from this year.
#' @param path Local path to the shape files. If NULL, the shapefiles are
#'   downloaded and a temporary path is created.
#' @return TRUE or FALSE
#' @examples
#' cbs_shape_exists(2016, path="wijkenbuurt2016")
cbs_shape_exists <- function(year, path) {

  # shapefile path
  shp_path <- Sys.glob(file.path(path, sprintf("*%s*.shp", year)))

  if (length(shp_path) > 1){
    return(TRUE)
  } else {
    return(FALSE)
  }
}
