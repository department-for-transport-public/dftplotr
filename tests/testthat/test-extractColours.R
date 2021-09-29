test_that("can extract a single or multiple colours", {
  expect_length(extract_colours("CorporateGreen"), 1)
  expect_length(extract_colours("CorporateGreen", "SkyBlue80", "Yellow"), 3)
})

test_that("works with a vector", {
  expect_length(extract_colours(c("CorporateGreen", "SkyBlue80", "Yellow")), 3)
})

test_that("errors with an unknown colour", {
  expect_error(extract_colours("Yellow90"))
  expect_error(extract_colours("Yellow90"), "Not a recognised colour")
})

test_that("returns all colours with no arguments", {
  expect_length(extract_colours(), 48)
})
