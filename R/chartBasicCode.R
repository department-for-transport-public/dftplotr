library(ggplot2)
library(dplyr)
library(forcats)

mtcars


plot <- ggplot(mtcars, aes(x = gear, fill = factor(am), group = am)) +
    geom_bar()

plot2 <- mtcars %>%
  mutate(gear = fct_rev(factor(gear))) %>%
  ggplot(aes(x = gear, fill = factor(am), group = am)) +
  geom_bar()


line_plot <- ggplot(economics,aes(x=date, y = pop, label = "population")) +
  ggplot2::geom_line()


fake_grouped_time_series <- tibble::tibble(
  date = c(2018, 2019, 2020, 2021, 2018, 2019, 2020, 2021, 2018, 2019, 2020, 2021),
  group = c("example", "example", "example", "example", "exemple", "exemple", "exemple", "exemple", "beispiel", "beispiel", "beispiel", "beispiel"),
  number = c(200, 250, 300, 350, 250, 300, 350, 400, 400, 400, 400, 355)
)


line_plot_grouped <- ggplot(fake_grouped_time_series, aes(x=date, y = number, group = group, label = group, color = group)) +
  ggplot2::geom_line()
#
# plot
# plot + theme_bar_dft()
# plot + theme_bar_dft(flip = TRUE, legend_position = "right")
# plot2
# plot2 + theme_bar_dft(flip = TRUE, legend_position = "right")
# line_plot
# line_plot + theme_line_dft()
# line_plot_grouped
# line_plot_grouped + theme_line_dft()
