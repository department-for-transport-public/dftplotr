#' Launches the DfT palette picker Shiny tool in a new window.
#'
#' This tool allows visualisation of the full DfT corporate colour list in two chart formats; line and bar to allow you to build and visualise your own custom palettes.
#'
#' It contains options to allow you to select a WCAG 2.0 accessibility rating you require the palette to meet, and functions to show what that palette looks like in grayscale and with colour-blindness.
#'
#' @export
#' @name palette_picker_tool
#' @title Launch DfT palette picker tool

palette_picker_tool <- function() {
  appDir <- system.file("shiny-examples", "myapp", package = "dftplotr")
  if (appDir == "") {
    stop("Could not find example directory. Try re-installing `dftplotr`.", call. = FALSE)
  }

  shiny::runApp(appDir, display.mode = "normal")
}
