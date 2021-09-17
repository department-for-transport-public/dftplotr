#' Displays a visual colour chart of a selected palette
#' @export
#' @name displayPalette
#' @title Launch DfT palette picker tool

displayPalette <- function(palette, gradient = FALSE){

  ##Select gradient or palette
  if(gradient){
    x <- dft.gradients[[palette]]
  }else{
  x <- dft.palettes[[palette]]
  }
  df <- dplyr::tibble(x = names(x), y = 1)

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
