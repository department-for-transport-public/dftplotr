scale_fill_dft <- function(palette = "main.palette", gradient = FALSE, ...) {

  if (gradient) {
    pal <- unname(extractGradient(colours = palette, n = n))
  } else {
    pal <- unname(dft.palettes[[palette]])

  }
  scale_fill_manual(values = pal)
}
