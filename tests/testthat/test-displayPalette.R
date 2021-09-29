

test_that("returns error with unknown palette", {
  expect_error(display_palette("fake.palette"))
  expect_error(display_palette("fake.palette"), regexp = "is not a recognised DfT palette. Available palettes are")
})

test_that("ggplot object is returned", {
  p <- display_palette("main.palette")
  q <- display_palette("just.beachy")

  expect_true(is.ggplot(p))
  expect_true(is.ggplot(q))
})


test_that("can change length of gradient palette", {
  p <- display_palette("main.palette", gradient = TRUE, n = 4)
  q <- display_palette("main.palette", gradient = TRUE, n = 6)

  expect_equal(nrow(p$data), 4)
  expect_equal(nrow(q$data), 6)
})

test_that("can swap between gradient and palette", {

  p <- display_palette("main.palette")
  q <- display_palette("main.palette", gradient = TRUE)

  expect_true(is.ggplot(p))
  expect_true(is.ggplot(q))

  expect_equal(nrow(p$data), 4)
  expect_equal(nrow(q$data), 5)
})
