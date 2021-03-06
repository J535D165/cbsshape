#' Download CBS Wijk en Buurtkaart
#'
#' @param year Read the shape file from this year.
#' @param path Local path to the shape files. If NULL, the shapefiles are
#'   downloaded and a temporary path is created.
#' @param verbose Verbosity. Default TRUE.
#'
#' @return The folder to which the files are downloaded.
#' @export
#'
#' @examples
#' cbs_shape_download(2017)
#' cbs_shape_download(2017, path="wijkenbuurt2017")
cbs_shape_download <- function(year, path=NULL, verbose=TRUE) {

  year = as.character(year)

  if (is.null(path)){
    path = tempdir()
  }

  temp_zip <- tempfile()
  download.file(shapefiles[[year]], temp_zip, quiet=!verbose)

  fns <- unzip(temp_zip, junkpaths = TRUE, exdir = path)

  return(path)
}

download_cbs_shapefile <- cbs_shape_download
