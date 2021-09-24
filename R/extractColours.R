#' Function to extract palette colours as hex codes
#'
#' @param ... Individual character names of colours in palette
#' @name extractColours
#' @title Extract named palette colours as hex codes
#'
extractColours <- function(...) {
  cols <- c(...)

  if (is.null(cols))
    return (dft.colours)
  else if(mean(cols %in% names(dft.colours))){
    dft.colours[cols]
  }
  else{
    stop("Not a recognised colour")
  }


}

