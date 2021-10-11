## Simple line plot using default palette

library(ggplot2)

df <- economics_long[economics_long$variable %in% c("psavert", "uempmed"), ]

# plot
ggplot(df, aes(x=date, y=value, col=variable, label=variable)) +
  geom_line(size = 1) +
  theme_line_dft(palette = "clear.skies")
