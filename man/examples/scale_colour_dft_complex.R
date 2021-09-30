## More complex line plot using full range of colours in palette

library(ggplot2)

df <- data.frame(supp=rep(c("VC1", "OJ", "VC2", "OJ2"), each=3),
                 dose=rep(c("D0.5", "D1", "D2"), 4),
                 len=c(6.8, 15, 33, 4.2, 10, 29.5, 3.6, 11, 21, 2, 8, 16))

# plot
ggplot(df, aes(x=dose, y=len, colour=supp, group = supp)) +
  geom_line(size = 1) +
  scale_colour_dft(palette = "electric.brights")+
  theme(axis.text.x = element_text(angle = 90, vjust=0.5, size = 8))  # turn off minor grid
