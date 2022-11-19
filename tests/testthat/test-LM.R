test_that("LM: Error input", {
  expect_output(LM(Species ~ Sepal.Length + Petal.Length, data = iris))
})



test_that("LM: Coefficients correct", {
  expect_equal(LM(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)$coefficients,
               lm(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)$coefficients)
})

test_that("LM: Residuals correct", {
  expect_equal(LM(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)$residuals,
               lm(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)$residuals)
})

test_that("LM: Rank correct", {
  expect_equal(LM(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)$rank,
               lm(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)$rank)
})

test_that("LM: Fitted values correct", {
  expect_equal(LM(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)$fitted.values,
               lm(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)$fitted.values)
})

test_that("LM: Degree of freedom of Residual correct", {
  expect_equal(LM(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)$df.residual,
               lm(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)$df.residual)
})

test_that("LM: Model correct", {
  expect_equal(as.matrix(LM(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)$model),
               as.matrix(lm(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)$model))
})

test_that("LM: Sigma correct", {
  expect_equal(LM(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)$sigma,
               summary(lm(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris))$sigma)
})

test_that("LM: R^2 correct", {
  expect_equal(LM(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)$r.squared,
               summary(lm(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris))$r.squared)
})

test_that("LM: R_{adj}^2 correct", {
  expect_equal(LM(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)$adj.r.squared,
               summary(lm(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris))$adj.r.squared)
})

test_that("LM: F statistics and P values correct", {
  expect_equal(LM(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)$adj.r.squared,
               summary(lm(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris))$adj.r.squared)
})

test_that("LM: Unscaled Covariance correct", {
  expect_equal(LM(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)$cov.unscaled,
               summary(lm(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris))$cov.unscaled)
})

test_that("summaryLM: Expect output", {
  expect_output(summaryLM(LM(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)))
})

