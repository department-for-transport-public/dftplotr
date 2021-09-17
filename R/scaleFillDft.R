#' Function to use custom DfT palettes for fill colours in ggplot charts
#'
#' @export
#' @param palette Named DfT palette to use in the fill. Defaults to "main.palette"
#' @param gradient Boolean response whether to use gradient palette instead of standard palettes. Defaults to false.
#' @param ... Other arguments to pass to extract gradients function
#' @name scale_fill_dft
#' @title Extract named palette colours as hex codes
#'
#'
scale_fill_dft <- function(palette = "main.palette", gradient = FALSE, ...) {

  if (gradient) {
    pal <- unname(extractGradient(colours = palette, ...))
  } else {
    pal <- unname(dft.palettes[[palette]])

  }
  scale_fill_manual(values = pal)
}
