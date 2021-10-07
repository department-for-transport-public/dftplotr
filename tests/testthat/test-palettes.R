test_that("Colours are a named vector", {
  expect_true(is.vector(dft.colours))
  expect_true(!is.null(names(dft.colours)))
})

test_that("Palettes are in list format", {
  expect_true(is.list(dft.palettes))
  expect_true(is.list(dft.gradients))
})

test_that("6 options available in each list of palettes/gradients", {
  expect_length(dft.palettes, 6)
  expect_length(dft.gradients, 6)
})

test_that("All palettes contain at least 4 colours", {

  for(i in 1:length(dft.palettes)){
  expect_gt(length(dft.palettes[[i]]), 3)
  }
})

test_that("All gradients contain exactly 2 colours", {
  for(i in 1:length(dft.palettes)){
    expect_equal(length(dft.gradients[[i]]), 2)
  }
})
