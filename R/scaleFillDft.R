scale_fill_dft <- function(palette = "main.palette", gradient = FALSE, ...) {
  pal <- unname(dft.palettes[[palette]])

  if (gradient) {
    gradient_col <- colorRampPalette(colors = c(pal[1], pal[4]))
    scale_fill_manual(values = gradient_col(10))
  } else {
    scale_fill_manual(values = pal)
  }
}
