#' Function to extract palette colours as hex codes
#'
#' @param ... Character names of colours in palette
#' @name extractColours
#' @title Extract named palette colours as hex codes
#'
extractColours <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (dft.colours)
  else if(mean(cols %in% names(dft.colours))){
    dft.colours[cols]
  }
  else{
    stop("Not a recognised colour")
  }


}

#' Function to extract a gradient of colours as hex codes
#'
#' @param palette Palette name as a string
#' @name extractGradient
#' @title Extract gradient of n colours as hex codes based on DfT palettes
#'
extractGradient <- function(colours, n = 10){
  ramp  <- colorRampPalette(colors = colours)
  ramp(n)
}
