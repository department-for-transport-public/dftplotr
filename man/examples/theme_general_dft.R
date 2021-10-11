## Simple line plot using default palette

library(ggplot2)

df <- economics_long[economics_long$variable %in% c("psavert", "uempmed"), ]

# plot
ggplot(df, aes(x=date)) +
  geom_line(aes(y=value, col=variable), size = 1) +
  theme_general_dft()
