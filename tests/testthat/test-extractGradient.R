test_that("function returns a character vector", {
  expect_type(extract_gradient("main.palette"),  "character")
  expect_true(is.vector(extract_gradient("main.palette")))
})

test_that("correct number of colours are returned", {
  expect_length(extract_gradient("main.palette"), 5)
  expect_length(extract_gradient("main.palette", n = 10), 10)
  expect_length(extract_gradient("main.palette", n = 3), 3)
})

test_that("message returns correct number of shades", {
  expect_message(extract_gradient("main.palette"), regexp = "Returning a gradient with 5 shades")
  expect_message(extract_gradient("main.palette", n = 7), regexp = "Returning a gradient with 7 shades")

})


test_that("warning is always displayed", {
  expect_warning(extract_gradient("main.palette"), regexp = "Gradient palettes do not meet accessibility requirements for publishing")
  expect_warning(extract_gradient("main.palette", n = 3), regexp = "Gradient palettes do not meet accessibility requirements for publishing")
})
