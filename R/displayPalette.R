#' Displays a visual colour chart of a selected palette based on the name of the palette.
#'
#' Current DfT palettes available are main.palette, electric.brights, just.beachy, cycling.hills, mountain.train and clear.skies.
#'
#' All palettes are available as either pre-set palettes of colours, or as gradients. Gradient palettes allow the user to select as many colour options as they like using the dots argument.
#'
#' @export
#' @name display_palette
#' @param palette string, name of palette of interest
#' @param gradient boolean to indicate whether palette should be standard colours or gradient. Default is gradient = FALSE
#' @param ... Additional arguments to pass to the extract_gradient function, such as number of colours to display in gradient palette
#' @title Displays a visual colour chart of a selected palette

display_palette <- function(palette, gradient = FALSE, ...){

  ##Select gradient or palette
  if(gradient){
  x <- dftplotr:::extract_gradient(colours = palette, ...)
  }else{
  x <- dft.palettes[[palette]]
  }
  df <- dplyr::tibble(x = factor(x), y = 1)

  ggplot2::ggplot(df, ggplot2::aes(x = .data$x, y = .data$y, fill = .data$x)) +
    ggplot2::geom_col() +
    ggplot2::coord_flip() +
    ggplot2::theme_void(base_size = 13) +
    ggplot2::theme(legend.position = "none",
                   axis.text.y = ggplot2::element_text(),
                   plot.margin = ggplot2::unit(c(10, 10, 10, 10), "pt")) +
    ggplot2::scale_fill_manual(values = rev(unname(x))) +
    ggplot2::scale_x_discrete(labels = unname(x)) +
    ggplot2::scale_y_continuous(expand = ggplot2::expansion(mult = 0.02))
}
