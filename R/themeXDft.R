#' Applies a standardised DfT theme to a ggplot.
#'
#' This theme has been designed using charting best practice principles.
#'
#' @export
#' @name theme_dft
#' @param legend_right Logical indicating whether legend should be placed to the right of the plot. If FALSE, the default, legend is positioned below the plot.
#' @param base_family Font family
#' @param base_size The base font size
#' @param base_line_size Default
#' @title Displays a visual colour chart of a selected palette

theme_general_dft <-  function(legend_right = FALSE,
                               base_family = "Arial",
                               base_size = 14,
                               base_line_size = base_size/170){

  half_line <- base_size/2

  if(legend_right == TRUE){
    spec_legend_position <- "right"
    spec_legend_direction <- "vertical"
    legend_justification_spec <- "center"
    legend_box_spacing_spec = ggplot2::unit(2 * half_line, "pt")
  } else {
    spec_legend_position <- "bottom"
    spec_legend_direction <- "horizontal"
    legend_justification_spec <- c(0,0)
    legend_box_spacing_spec <- ggplot2::unit(0, "char")
  }

  ggplot2::theme_minimal(base_size = base_size,
                         base_family = base_family,
                         base_line_size = base_line_size) %+replace%
    ggplot2::theme(text = element_text(size = base_size),
                   plot.title = ggplot2::element_text(size = ggplot2::rel(1.2)),
                   line = element_line(colour = "grey80"),
                   panel.grid = element_blank(),
                   panel.grid.major.y = ggplot2::element_line(
                     color = "#CCC1B7"),
                   axis.ticks = element_blank(),
                   axis.title.x = element_blank(),
                   axis.title.y = element_text(
                     angle = 0,
                     vjust = ggplot2::rel(1.15),
                     margin = margin(r = -25),
                     size = ggplot2::rel(0.9),
                     face = "bold"
                   ),
                   axis.text = ggplot2::element_text(
                     size = ggplot2::rel(0.8)
                   ),
                   axis.text.y = ggplot2::element_text(
                     margin = ggplot2::margin(r = -0.8 * half_line / 2),
                     hjust = 1),
                   axis.ticks.length = unit(0.5, "lines"),
                   axis.line.x = element_line(),
                   panel.background = element_blank(),
                   legend.title = element_blank(),
                   legend.key = element_blank(),
                   legend.key.size = unit(1.5, "lines"),
                   legend.spacing.x = unit(0.5, 'cm'),
                   legend.position = spec_legend_position,
                   legend.justification = legend_justification_spec,
                   legend.direction = spec_legend_direction,
                   legend.box.spacing = legend_box_spacing_spec,
                   panel.spacing = unit(1, "lines"),
                   strip.background = element_blank(),
                   strip.text = element_text(face = "bold"),
                   plot.margin = margin(t = 30, l = 20, r = 30, b = 20))

}

#' Applies a standardised DfT theme to a ggplot bar plot.
#'
#' This theme has been designed using charting best practice principles.
#'
#' @export
#' @name theme_dft
#' @param legend_right Logical indicating whether legend should be placed to the right of the plot. If FALSE, the default, legend is positioned below the plot.
#' @param base_family Font family
#' @param base_size The base font size
#' @param base_line_size Default
#' @title Displays a visual colour chart of a selected palette


theme_bar_dft <- function(legend_right = FALSE,
                          base_family = "",
                          base_size = 14,
                          base_line_size = 2,
                          palette = "main.palette",
                          accuracy = 1,
                          flip = FALSE){

  if(flip == TRUE){

    list(
      theme_general_dft(legend_right = legend_right,
                        base_family = base_family,
                        base_size = base_size,
                        base_line_size = 2),
      scale_fill_dft(palette = palette),
      ggplot2::scale_y_continuous(expand = c(0, 0),
                                  labels = scales::label_number(accuracy = accuracy)),
      coord_flip(),
      theme(
        panel.grid.major.x = ggplot2::element_line(
          color = "#CCC1B7"),
        panel.grid.major.y = element_blank(),
        axis.line.x = element_blank()
      )
      )
  }else{
  list(
    theme_general_dft(legend_right = legend_right,
                      base_family = base_family,
                      base_size = base_size,
                      base_line_size = 2),
    scale_fill_dft(palette = palette),
    ggplot2::scale_y_continuous(expand = c(0, 0),
                                labels = scales::label_number(accuracy = accuracy))
    )
  }
}


#' Applies a standardised DfT theme to a ggplot line plot.
#'
#' This theme has been designed using charting best practice principles.
#'
#' @export
#' @name theme_dft
#' @param legend_right Logical indicating whether legend should be placed to the right of the plot. If FALSE, the default, legend is positioned below the plot.
#' @param base_family Font family
#' @param base_size The base font size
#' @param base_line_size Default
#' @title Displays a visual colour chart of a selected palette



theme_line_dft <- function(legend_right = FALSE,
                           base_family = "",
                           base_size = 14,
                           base_line_size = base_size/170,
                           palette = "main.palette",
                           accuracy = 1){

  list(
    theme_general_dft(legend_right = legend_right,
                      base_family = base_family,
                      base_size = base_size,
                      base_line_size = 2),
    scale_colour_dft(palette = palette),
    ggplot2::scale_y_continuous(expand = c(0, 0),
                                labels = scales::label_number(accuracy = accuracy)),
    expand_limits(y = 0),
    coord_cartesian(clip = 'off'),
    theme(legend.position = 'none'))
}
