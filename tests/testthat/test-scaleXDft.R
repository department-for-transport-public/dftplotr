test_that("scale_all_dft returns error with unknown palettes", {
  expect_error(scale_all_dft(palette = "fake.palette", gradient = TRUE))
  expect_error(scale_all_dft(palette = "main.palette", gradient = FALSE), NA)
  expect_error(scale_all_dft(palette = "fake.palette", gradient = TRUE))
})

test_that("use of gradient palette returns a warning", {
  expect_warning(scale_all_dft(palette = "main.palette", gradient = TRUE))
  expect_warning(scale_all_dft(palette = "main.palette", gradient = TRUE), regexp =  "Gradient palettes do not meet accessibility requirements for publishing")
})

test_that("scale_all_dft can swap between gradient and palette", {
  expect_error(scale_all_dft(palette = "main.palette", gradient = FALSE), NA)
  expect_error(scale_all_dft(palette = "main.palette", gradient = TRUE), NA)
})

test_that("scale_all_dft accessibility message is as expected", {
  expect_message(scale_all_dft(palette = "main.palette", gradient = FALSE))
  expect_message(scale_all_dft(palette = "main.palette", gradient = FALSE),
                 regexp = "This palette meets WCAG 2.0 AAA accessibility guidelines")

  expect_message(scale_all_dft(palette = "clear.skies", gradient = FALSE))
  expect_message(scale_all_dft(palette = "clear.skies", gradient = FALSE),
                 regexp = "This palette meets WCAG 2.0 AA accessibility guidelines only")
})

test_that("scale_all_dft returns an unnamed vector", {
  expect_true(is.null(names(scale_all_dft(palette = "clear.skies", gradient = FALSE))))
  expect_true(is.null(names(scale_all_dft(palette = "main.palette", gradient = TRUE))))
})

test_that("scale_all_dft returns a vector of the right length", {
  expect_length(dftplotr:::scale_all_dft("main.palette", gradient = FALSE), 4)
  expect_length(dftplotr:::scale_all_dft("main.palette", gradient = TRUE), 5)
  expect_length(dftplotr:::scale_all_dft("mountain.train", gradient = FALSE), 6)

})

test_that("fill and colour functions return ggproto objects", {
  expect_true(is.ggproto(dftplotr::scale_colour_dft()))
  expect_true(is.ggproto(dftplotr::scale_fill_dft()))
  expect_true(is.ggproto(dftplotr::scale_colour_dft(palette = "just.beachy", gradient = TRUE, n = 6)))
  expect_true(is.ggproto(dftplotr::scale_colour_dft(palette = "just.beachy")))
})


test_that("scale_fill_dft returns fill argument", {

  p <- dftplotr::scale_fill_dft("just.beachy")
  q <- dftplotr::scale_fill_dft()

  expect_equal(p$aesthetics, "fill")
  expect_equal(q$aesthetics, "fill")
})


test_that("scale_fill_dft returns colour argument", {
  p <- dftplotr::scale_colour_dft()
  q <- dftplotr::scale_colour_dft(gradient = TRUE, n = 7)

  expect_equal(p$aesthetics, "colour")
  expect_equal(q$aesthetics, "colour")
})
