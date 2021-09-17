#' Function to extract a gradient of colours as hex codes
#'
#' @param colours Individual names of colours to start and end gradient with, in a vector
#' @param n Number of colours required in created gradient, as an integer
#' @name extractGradient
#' @title Extract gradient of n colours as hex codes based on DfT palettes
#'
extractGradient <- function(colours, n){
  ramp  <- colorRampPalette(colors = dft.gradients[[colours]])
  ramp(n)
}
