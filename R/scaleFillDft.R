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
    ##Create a gradient based on the palette selected
    pal <- unname(extractGradient(colours = palette, ...))
  } else {
    ##Add a message to explain the accessibility of the palette chosen
    if(palette %in% c("mountain.train", "clear.skies")) {
      message("This palette meets WCAG 2.0 AA accessibility guidelines only. This is the basic level expected for publication")
    } else{
      message("This palette meets WCAG 2.0 AAA accessibility guidelines. This is the highest standard of accessibility.")
    }
    #Select one of the pre-created palettes
    pal <- unname(dft.palettes[[palette]])

  }
  scale_fill_manual(values = pal)
}
