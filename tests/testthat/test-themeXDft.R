test_that("scale_general_dft text has the correct font and size", {
  th_g <- dftplotr::theme_general_dft()
  expect_equal(th_g$text$family, "Arial")
  expect_equal(th_g$text$size, 14)
})

test_that("all themes return the expected object type", {
  expect_true(is.theme(dftplotr::theme_general_dft()))
  expect_false(is.list(dftplotr::theme_line_dft()))
  expect_false(is.list(dftplotr::theme_bar_dft()))
})
