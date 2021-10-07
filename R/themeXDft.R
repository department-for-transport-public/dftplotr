#' Applies a standardised DfT theme to a ggplot.
#'
#' This theme has been designed using charting best practice principles.
#'
#' @export
#' @name theme_dft
#' @param legend_position the desired legend position. Selects bottom by default.
#' @param base_family Font family
#' @param base_size The base font size
#' @param base_line_size The base line size
#' @title Displays a visual colour chart of a selected palette

theme_general_dft <-  function(legend_position = "bottom",
                               base_family = "Arial",
                               base_size = 14,
                               base_line_size = 2){
# half line organises the legend spacing and margins relative to base text size.
  half_line <- base_size/2

  if(legend_position == "right"){
    spec_legend_position <- "right"
    spec_legend_direction <- "vertical"
    legend_justification_spec <- "center"
    legend_box_spacing_spec = ggplot2::unit(2 * half_line, "pt")
  } else {
    spec_legend_position <- legend_position
    spec_legend_direction <- "horizontal"
    legend_justification_spec <- c(0,0)
    legend_box_spacing_spec <- ggplot2::unit(0, "char")
  }

  ggplot2::theme_minimal(base_size = base_size,
                         base_family = base_family,
                         base_line_size = base_line_size) %+replace%
    ggplot2::theme(text = ggplot2::element_text(size = base_size),
                   plot.title = ggplot2::element_text(size = ggplot2::rel(1.2)),
                   line = ggplot2::element_line(colour = "grey80"),
                   panel.grid = ggplot2::element_blank(),
                   panel.grid.major.y = ggplot2::element_line(
                     color = "#CCC1B7"),
                   axis.ticks = ggplot2::element_blank(),
                   axis.title.x = ggplot2::element_blank(),
                   axis.title.y = ggplot2::element_text(
                     angle = 0,
                     vjust = ggplot2::rel(1.15),
                     margin = ggplot2::margin(r = -25),
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
                   axis.line.x = ggplot2::element_line(),
                   panel.background = ggplot2::element_blank(),
                   legend.title = ggplot2::element_blank(),
                   legend.key = ggplot2::element_blank(),
                   legend.key.size = unit(1.5, "lines"),
                   legend.spacing.x = unit(0.5, 'cm'),
                   legend.position = spec_legend_position,
                   legend.justification = legend_justification_spec,
                   legend.direction = spec_legend_direction,
                   legend.box.spacing = legend_box_spacing_spec,
                   panel.spacing = unit(1, "lines"),
                   strip.background = element_blank(),
                   strip.text = ggplot2::element_text(face = "bold"),
                   plot.margin = margin(t = 30, l = 20, r = 40, b = 20))

}

#' Applies a standardised DfT theme to a ggplot bar plot.
#'
#' This theme has been designed using charting best practice principles.
#'
#' @export
#' @name theme_bar_dft
#' @param legend_position the desired legend position. Selects bottom by default.
#' @param base_family Font family
#' @param base_size The base font size
#' @param base_line_size The base line size
#' @param accuracy The accuracy of the y-axis, default to 1 for 0 decimal place. 0.1 would give 1 decimal place, 0.01 would give 2 decimal places.
#' @param flip Boolean response whether to flip the x and y-axis. Defaults to false.
#' @param palette The name of the DfT palette you want to use
#' @param gradient Boolean response whether to use gradient palette instead of standard palettes. Defaults to false.
#' @param ... Other arguments to pass to extract gradients function
#' @title Applies a standardised DfT theme to a ggplot bar plot


theme_bar_dft <- function(legend_position = "bottom",
                          base_family = "",
                          base_size = 14,
                          base_line_size = 2,
                          accuracy = 1,
                          flip = FALSE,
                          palette = "main.palette",
                          gradient = FALSE,
                          ...){

  if(flip == TRUE){

    list(
      dftplotr::theme_general_dft(legend_position = legend_position,
                        base_family = base_family,
                        base_size = base_size,
                        base_line_size = base_line_size),
      dftplotr::scale_fill_dft(palette = palette, gradient = gradient, ...),
      ggplot2::scale_y_continuous(expand = c(0, 0),
                                  labels = scales::label_number(accuracy = accuracy)),
      ggplot2::coord_flip(),
      ggplot2::theme(
        panel.grid.major.x = ggplot2::element_line(color = "#CCC1B7"),
        panel.grid.major.y = ggplot2::element_blank(),
        axis.line.x = ggplot2::element_blank()
      )
      )
  }else{
  list(
    dftplotr::theme_general_dft(legend_position = legend_position,
                                base_family = base_family,
                                base_size = base_size,
                                base_line_size = base_line_size),
    dftplotr:::scale_fill_dft(palette = palette),
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
#' @name theme_line_dft
#' @param legend_position the desired legend position. Selects bottom by default.
#' @param base_family Font family
#' @param base_size The base font size
#' @param base_line_size The base line size
#' @param accuracy The accuracy of the y-axis, default to 1 for 0 decimal place. 0.1 would give 1 decimal place, 0.01 would give 2 decimal places.
#' @param palette The name of the DfT palette you want to use
#' @param gradient Boolean response whether to use gradient palette instead of standard palettes. Defaults to false.
#' @param ... Other arguments to pass to extract gradients function
#' @title Applies a standardised DfT theme to a ggplot line plot



theme_line_dft <- function(legend_position = "bottom",
                           base_family = "",
                           base_size = 14,
                           base_line_size = 2,
                           accuracy = 1,
                           palette = "main.palette",
                           gradient = FALSE,
                           ...){

  list(
    dftplotr::theme_general_dft(legend_position = legend_position,
                                base_family = base_family,
                                base_size = base_size,
                                base_line_size = base_line_size),
    dftplotr::scale_colour_dft(palette = palette, gradient = gradient, ...),
    ggplot2::scale_y_continuous(expand = c(0, 0),
                                labels = scales::label_number(accuracy = accuracy)),
    ggplot2::expand_limits(y = 0),
    directlabels::geom_dl(method = list("last.points", 'last.bumpup')),
    ggplot2::coord_cartesian(clip = 'off'),
    ggplot2::theme(legend.position = 'none'))
}