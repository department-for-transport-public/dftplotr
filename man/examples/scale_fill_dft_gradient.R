## Larger bar chart using gradient palette

library(ggplot2)

ggplot(mpg, aes(manufacturer)) +
  geom_bar(aes(fill=class), width = 0.5) +
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
  scale_fill_dft(gradient = TRUE, n = 7)
