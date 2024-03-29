% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/scaleXDft.R
\name{scale_fill_dft}
\alias{scale_fill_dft}
\title{Extract named palette colours as hex codes for use in area charts}
\usage{
scale_fill_dft(palette = "main.palette", gradient = FALSE, ...)
}
\arguments{
\item{palette}{Named DfT palette to use in the fill. Defaults to "main.palette"}

\item{gradient}{Boolean response whether to use gradient palette instead of standard palettes. Defaults to false.}

\item{...}{Other arguments to pass to extract gradients function}
}
\description{
Function to use custom DfT palettes for fill colours in ggplot charts
}
\examples{
## Simple bar chart using default palette

library(ggplot2)

df <- mpg[mpg$class \%in\% c("subcompact", "compact", "midsize", "suv"),]

ggplot(df, aes(manufacturer)) +
  geom_bar(aes(fill=class), width = 0.5) +
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
  scale_fill_dft()
## Simple bar chart using alternative palette


library(ggplot2)

df <- mpg[mpg$class \%in\% c("subcompact", "compact", "midsize", "suv"),]

ggplot(df, aes(manufacturer)) +
  geom_bar(aes(fill=class), width = 0.5) +
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
  scale_fill_dft("just.beachy")
## Larger bar chart using longer palette

library(ggplot2)

df <- mpg[mpg$class \%in\% c("subcompact", "compact", "midsize", "suv", "pickup", "minivan"),]

ggplot(df, aes(manufacturer)) +
  geom_bar(aes(fill=class), width = 0.5) +
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
  scale_fill_dft(palette = "clear.skies")
## Larger bar chart using gradient palette

library(ggplot2)

ggplot(mpg, aes(manufacturer)) +
  geom_bar(aes(fill=class), width = 0.5) +
  theme(axis.text.x = element_text(angle=65, vjust=0.6)) +
  scale_fill_dft(gradient = TRUE, n = 7)
}
