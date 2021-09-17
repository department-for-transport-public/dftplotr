library(ggplot2)

mtcars

ggplot(mtcars, aes(x = gear, fill = factor(am), group = am))+
  geom_bar()+
  theme_grey() +
  scale_fill_dft()+
  theme(line = element_line(colour = "grey80"),
        panel.grid = element_blank(),
        axis.ticks = element_blank(),
        axis.title.x = element_blank(),
        axis.title.y = element_text(angle = 0),
        axis.ticks.length = unit(0.5, "lines"),
        panel.background = element_blank(),
        legend.title = element_blank(),
        legend.key = element_blank(),
        legend.key.size = unit(1.5, "lines"),
        legend.position = "bottom",
        legend.spacing.x = unit(0.5, 'cm'),
        panel.spacing = unit(1, "lines"),
        strip.background = element_blank(),
        strip.text = element_text(face = "bold"))
