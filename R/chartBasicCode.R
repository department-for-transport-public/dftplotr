library(ggplot2)

mtcars

half_line <- base_size/2
flip <- TRUE

plot <- ggplot(mtcars, aes(x = gear, fill = factor(am), group = am)) +
    geom_bar() +
  # scale_fill_dft() +
  theme(text = element_text(size = base_size),
        plot.title = ggplot2::element_text(size = ggplot2::rel(1.2)),
        line = element_line(colour = "grey80"),
        panel.grid = element_blank(),
        panel.grid.major.y = ggplot2::element_line(
                                      color = "#CCC1B7"),
        axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_text(
          angle = 0,
          vjust = ggplot2::rel(1.1),
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
        legend.position = "bottom",
        legend.spacing.x = unit(0.5, 'cm'),
        panel.spacing = unit(1, "lines"),
        strip.background = element_blank(),
        strip.text = element_text(face = "bold"),
        plot.margin = margin(t = 30, l = 10, r = 10, b = 10)) +
  scale_y_continuous(expand = c(0, 0))


if(flip == TRUE){
  plot +
    coord_flip() +
    theme(
      panel.grid.major.x = ggplot2::element_line(
        color = "#CCC1B7"),
      panel.grid.major.y = element_blank(),
      axis.line.x = element_blank()

  )
}


dfthemer <-  function(legend_right = FALSE,
                      base_family = "",
                      base_size = 14,
                      base_line_size = 2){

  half_line <- base_size/2


  if(legend_right == TRUE){
    spec_legend_position <- "right"
    spec_legend_direction <- "vertical"
    legend_justification_spec <- "center"
    legend_box_spacing_spec = ggplot2::unit(2 * half_line, "pt")
  } else {
    spec_legend_position <- "top"
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
                     vjust = ggplot2::rel(1.1),
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
                   # legend.position = "bottom",
                   legend.spacing.x = unit(0.5, 'cm'),
                   legend.position = spec_legend_position,
                   legend.justification = legend_justification_spec,
                   legend.direction = spec_legend_direction,
                   legend.box.spacing = legend_box_spacing_spec,
                   panel.spacing = unit(1, "lines"),
                   strip.background = element_blank(),
                   strip.text = element_text(face = "bold"),
                   plot.margin = margin(t = 30, l = 10, r = 10, b = 10))

}


dfthemer_test <- function(plot,
                          legend_right = FALSE,
                          base_family = "",
                          base_size = 14,
                          base_line_size = 2){

  list(
    dfthemer(legend_right = legend_right,
             base_family = base_family,
             base_size = base_size,
             base_line_size = 2),
    scale_fill_dft(),
    ggplot2::scale_y_continuous(expand = c(0, 0),
                                labels = scales::number_format()),
    expand_limits(y = 0))
}


line_plot <- ggplot(economics,aes(x=date, y = pop)) +
  ggplot2::geom_line()

dfthemer_test(line_plot)


fake_grouped_time_series <- tibble::tibble(
  date = c(2018, 2019, 2020, 2021, 2018, 2019, 2020, 2021, 2018, 2019, 2020, 2021),
  group = c("example", "example", "example", "example", "exemple", "exemple", "exemple", "exemple", "beispiel", "beispiel", "beispiel", "beispiel"),
  number = c(200, 250, 300, 350, 250, 300, 350, 400, 400, 400, 400, 355)
)


line_plot_grouped <- ggplot(fake_grouped_time_series, aes(x=date, y = number, group = group, label = group, color = group)) +
  ggplot2::geom_line() +
  ggplot2::geom_text(data = subset(fake_grouped_time_series, date == max(fake_grouped_time_series$date)),
                     hjust = 0)

line_plot_grouped


plot + dfthemer_test()
