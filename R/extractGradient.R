#' Function to extract a gradient of colours as hex codes
#'
#' @param colours Individual names of colours to start and end gradient with, in a vector
#' @param n Number of colours required in created gradient, as an integer. Defaults to 5.
#' @name extractGradient
#' @title Extract gradient of n colours as hex codes based on DfT palettes
#'
extractGradient <- function(colours, n = 5){
  warning("Gradient palettes do not meet accessibility requirements for publishing")

  ramp  <- colorRampPalette(colors = dft.gradients[[colours]])
  ramp(n)
}
