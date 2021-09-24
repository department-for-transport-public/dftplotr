library(ggplot2)

mtcars

half_line <- base_size/2
flip <- TRUE

plot <- ggplot(mtcars, aes(x = gear, fill = factor(am), group = am)) +
    geom_bar()


line_plot <- ggplot(economics,aes(x=date, y = pop)) +
  ggplot2::geom_line()


fake_grouped_time_series <- tibble::tibble(
  date = c(2018, 2019, 2020, 2021, 2018, 2019, 2020, 2021, 2018, 2019, 2020, 2021),
  group = c("example", "example", "example", "example", "exemple", "exemple", "exemple", "exemple", "beispiel", "beispiel", "beispiel", "beispiel"),
  number = c(200, 250, 300, 350, 250, 300, 350, 400, 400, 400, 400, 355)
)


line_plot_grouped <- ggplot(fake_grouped_time_series, aes(x=date, y = number, group = group, label = group, color = group)) +
  ggplot2::geom_line(size = 1) +
  # ggplot2::geom_text(data = subset(fake_grouped_time_series, date == max(fake_grouped_time_series$date)),
  #   hjust = 0)
  ggrepel::geom_text_repel(aes(date + 0.4),
                           data = subset(fake_grouped_time_series, date == max(fake_grouped_time_series$date)),
                           direction = "y",
                           hjust = "left",
                           vjust = 1)

plot + theme_bar_dft()
plot + theme_bar_dft(flip = TRUE, legend_right = TRUE)
line_plot_grouped + theme_line_dft()
