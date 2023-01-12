#' Function to extract a gradient of colours as hex codes
#'
#' @param palette Gradient palette name as a string, provides the start and end colours of the gradient.
#' @param n Number of colours required in created gradient, as an integer. Defaults to 5.
#' @name extract_gradient
#' @title Extract gradient of n colours as hex codes based on DfT palettes
#' @importFrom grDevices colorRampPalette
#'
extract_gradient <- function(palette, n = 5){

  message(paste("Returning a gradient with", n, "shades. To change the number of shades returned, use the n parameter"))
  warning("Gradient palettes do not meet accessibility requirements for publishing")

  ramp  <- grDevices::colorRampPalette(colors = dft.gradients[[palette]])
  ramp(n)
}
