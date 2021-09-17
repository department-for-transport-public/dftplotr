#' Launches a Shiny tool in R which allows visualisation of the DfT corporate palette in charting functions, to allow creation of accessible charting palettes.
#' @export
#' @name showPalettes
#' @title Launch DfT palette picker tool

showPalettes <- function() {
  appDir <- system.file("shiny-examples", "myapp", package = "dftplotr")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `dftplotr`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}
