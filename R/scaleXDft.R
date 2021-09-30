#' Internal function to select which palette to use in scale_fill_dft and scale_colour_dft and output warnings/errors as appropriate
#'
#' @param palette Named DfT palette to use in the fill.
#' @param gradient Boolean response whether to use gradient palette instead of standard palettes.
#' @param ... Other arguments to pass to extract gradients function
#' @name scale_all_dft
#' @title Extract named palette colours as hex codes

scale_all_dft <- function(palette, gradient, ...){
  #Stop and list palette names if palette name is not recognised
  if(!palette %in% names(dft.palettes)){
    stop(paste(palette, "is not a recognised DfT palette. Available palettes are: ",
               paste(names(dft.palettes), collapse = ", ")))
  }

  ##If a gradient palette is needed:
  if (gradient) {
    ##Create a gradient based on the palette selected
    pal <- unname(extract_gradient(palette = palette, ...))
  } else {
    ##Add a message to explain the accessibility of the palette chosen
    if(palette %in% c("mountain.train", "clear.skies")) {
      message("This palette meets WCAG 2.0 AA accessibility guidelines only. This is the basic level expected for publication")
    } else{
      message("This palette meets WCAG 2.0 AAA accessibility guidelines. This is the highest standard of accessibility.")
    }
    #Else, select one of the pre-created palettes
    pal <- unname(dft.palettes[[palette]])

  }

  return(pal)

}

#' Function to use custom DfT palettes for fill colours in ggplot charts
#'
#' @export
#' @param palette Named DfT palette to use in the fill. Defaults to "main.palette"
#' @param gradient Boolean response whether to use gradient palette instead of standard palettes. Defaults to false.
#' @param ... Other arguments to pass to extract gradients function
#' @name scale_fill_dft
#' @title Extract named palette colours as hex codes for use in area charts
#'
#'
scale_fill_dft <- function(palette = "main.palette", gradient = FALSE, ...) {
  pal <- scale_all_dft(palette = palette, gradient = gradient, ...)
  scale_fill_manual(values = pal)
}


#' Function to use custom DfT palettes for line colours in ggplot charts
#'
#' @export
#' @param palette Named DfT palette to use in line colours. Defaults to "electric.brights"
#' @param gradient Boolean response whether to use gradient palette instead of standard palettes. Defaults to false.
#' @param ... Other arguments to pass to extract gradients function
#' @name scale_colour_dft
#' @title Extract named palette colours as hex codes for use in line charts
#' @example man/examples/scale_colour_dft.R
#' @example man/examples/scale_colour_dft_complex.R
#'
scale_colour_dft <- function(palette = "electric.brights", gradient = FALSE, ...) {

  pal <- scale_all_dft(palette = palette, gradient = gradient, ...)
  scale_color_manual(values = pal)
}
