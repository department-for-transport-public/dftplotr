## Larger bar chart using longer palette

library(ggplot2)

df <- mpg[mpg$class %in% c("subcompact", "compact", "midsize", "suv", "pickup", "minivan"),]

ggplot(df, aes(manufacturer)) +
  geom_bar(aes(fill=class), width = 0.5) +
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
  scale_fill_dft(palette = "clear.skies")
