## Simple bar chart with a flipped axis and legend at the top

library(ggplot2)

df <- mpg[mpg$class %in% c("subcompact", "compact", "midsize", "suv"),]

ggplot(df, aes(manufacturer)) +
  geom_bar(aes(fill=class), width = 0.5) +
  theme_bar_dft(flip = TRUE, legend_position = "top")
