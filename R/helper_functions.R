# Evaluates all arguments (see #81)
force_all <- function(...) list(...)

"%||%" <- function(a, b) if (!is.null(a)) a else b

range_finite <- function(x) {
  suppressWarnings(range(x, na.rm = TRUE, finite = TRUE))
}

seq2 <- function(from, to) {
  if (from > to) {
    numeric()
  } else {
    from:to
  }
}

#' Label numbers in decimal format (e.g. 0.12, 1,234)
#'
#' Use `label_number()` force decimal display of numbers (i.e. don't use
#' [scientific][label_scientific] notation). `label_comma()` is a special case
#' that inserts a comma every three digits.
#'
#' @return
#' All `label_()` functions return a "labelling" function, i.e. a function that
#' takes a vector `x` and returns a character vector of `length(x)` giving a
#' label for each input value.
#'
#' Labelling functions are designed to be used with the `labels` argument of
#' ggplot2 scales. The examples demonstrate their use with x scales, but
#' they work similarly for all scales, including those that generate legends
#' rather than axes.
#' @section Old interface:
#' `number_format()`, `comma_format()`, and `comma()` are retired; please use
#' `label_number()` and `label_comma()` instead.
#' @param x A numeric vector to format.
#' @param accuracy A number to round to. Use (e.g.) `0.01` to show 2 decimal
#'   places of precision. If `NULL`, the default, uses a heuristic that should
#'   ensure breaks have the minimum number of digits needed to show the
#'   difference between adjacent values.
#'
#'   Applied to rescaled data.
#' @param scale A scaling factor: `x` will be multiplied by `scale` before
#'   formatting. This is useful if the underlying data is very small or very
#'   large.
#' @param prefix,suffix Symbols to display before and after value.
#' @param big.mark Character used between every 3 digits to separate thousands.
#' @param decimal.mark The character to be used to indicate the numeric
#'   decimal point.
#' @param trim Logical, if `FALSE`, values are right-justified to a common
#'   width (see [base::format()]).
#' @param ... Other arguments passed on to [base::format()].

label_number <- function(accuracy = NULL, scale = 1, prefix = "",
                         suffix = "", big.mark = " ", decimal.mark = ".",
                         trim = TRUE, ...) {
  force_all(
    accuracy,
    scale,
    prefix,
    suffix,
    big.mark,
    decimal.mark,
    trim,
    ...
  )
  function(x) number(
    x,
    accuracy = accuracy,
    scale = scale,
    prefix = prefix,
    suffix = suffix,
    big.mark = big.mark,
    decimal.mark = decimal.mark,
    trim = trim,
    ...
  )
}

#' A low-level numeric formatter
#'
#' This function is a low-level helper that powers many of the labelling
#' functions. You should generally not need to call it directly unless you
#' are creating your own labelling function.
#'
#' @keywords internal
#' @inheritParams label_number
#' @return A character vector of `length(x)`.
number <- function(x, accuracy = NULL, scale = 1, prefix = "",
                   suffix = "", big.mark = " ", decimal.mark = ".",
                   trim = TRUE, ...) {
  if (length(x) == 0) return(character())
  accuracy <- accuracy %||% scales:::precision(x * scale)
  x <- round_any(x, accuracy / scale)
  nsmall <- -floor(log10(accuracy))
  nsmall <- min(max(nsmall, 0), 20)

  ret <- format(
    scale * x,
    big.mark = big.mark,
    decimal.mark = decimal.mark,
    trim = trim,
    nsmall = nsmall,
    scientific = FALSE,
    ...
  )
  ret <- paste0(prefix, ret, suffix)
  ret[is.infinite(x)] <- as.character(x[is.infinite(x)])

  # restore NAs from input vector
  ret[is.na(x)] <- NA
  names(ret) <- names(x)

  ret
}

#' Round to multiple of any number.
#'
#' @param x numeric or date-time (POSIXct) vector to round
#' @param accuracy number to round to; for POSIXct objects, a number of seconds
#' @param f rounding function: \code{\link{floor}}, \code{\link{ceiling}} or
#'  \code{\link{round}}
#' @keywords manip
#' @export
#' @examples
#' round_any(135, 10)
#' round_any(135, 100)
#' round_any(135, 25)
#' round_any(135, 10, floor)
#' round_any(135, 100, floor)
#' round_any(135, 25, floor)
#' round_any(135, 10, ceiling)
#' round_any(135, 100, ceiling)
#' round_any(135, 25, ceiling)
#'
#' round_any(Sys.time() + 1:10, 5)
#' round_any(Sys.time() + 1:10, 5, floor)
#' round_any(Sys.time(), 3600)
round_any <- function(x, accuracy, f = round) {
  UseMethod("round_any")
}

#' @export
round_any.numeric <- function(x, accuracy, f = round) {
  f(x / accuracy) * accuracy
}

#' @export
round_any.POSIXct <- function(x, accuracy, f = round) {
  tz <- format(x[1], "%Z")
  xr <- round_any(as.numeric(x), accuracy, f)
  as.POSIXct(xr, origin="1970-01-01 00:00.00 UTC", tz=tz)
}
