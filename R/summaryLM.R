#'summaryLM
#'
#'summaryLM is a generic function used to produce result summaries of the results of various model fitting functions.
#'It mimics the printed output of the build-in method summary(lm()).
#'@param result the summary of all outputs by using LM() to fit the linear regression model
#'
#'@examples
#'## fit the simple linear regression model
#'LM_result = LM(Sepal.Width ~ Sepal.Length, data = iris)
#'summaryLM(LM_result) ## obtain the summary of the fitted model
#'
#'## fit the simple linear regression model
#'LM_result = LM(Sepal.Width ~ Sepal.Length, data = iris, intercept = FALSE) # omiting intercept
#'summaryLM(LM_result)
#'
#'## fit the multiple linear regression model
#'LM_result = LM(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)
#'summaryLM(LM_result)
#'
#'## fit the multiple linear regression model with interaction
#'LM_result = LM(Sepal.Width ~ Sepal.Length * Petal.Length, data = iris)
#'summaryLM(LM_result)
#'
#'@export
#'
summaryLM = function(result) {
  summaryLM_residuals = quantile(result$residuals)
  names(summaryLM_residuals) <-
    c("Min", "1Q", "Median", "3Q", "Max")

  LM_pval = result$coefficients_df[, 4]
  sig_star = ifelse (LM_pval < 0.001, '***',
                     ifelse (LM_pval < 0.01, '** ',
                             ifelse(
                               LM_pval < 0.05, '*  ',
                               ifelse(LM_pval < 0.1, '.  ', '')
                             )))
  LM_pval = ifelse(LM_pval < 2.2e-16, "< 2.2e-16", LM_pval)
  coefficients_df = result$coefficients_df
  coefficients_df[, 4] = LM_pval
  coefficients_table = cbind(coefficients_df, sig_star)
  names(coefficients_table) = c("Estimate", "Std. Error", "t value", "Pr(>|t|)", "")

  Fpvalue = ifelse(result$`F.p-value` < 2.2e-16, "< 2.2e-16", result$`F.p-value`)

  cat("Call: ", result$call, ' ',  "Residuals: ", sep = '\n')
  print(summaryLM_residuals)

  cat("\nCoefficients: \n")
  print(coefficients_table)
  cat("---\n")

  Signif.codes =
    "Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1"
  cat(Signif.codes, "\n\n")

  summary_LM =
    paste(
      c(
        "Residual standard error: ",
        result$sigma,
        " on ",
        result$df.residual,
        " degrees of freedom \nMultiple R-Squared: ",
        result$r.squared,
        ", Adjusted R-squared: ",
        result$adj.r.squared,
        "\nF-Statistic: ",
        result$fstatistic[1],
        " on ",
        result$fstatistic[2],
        " and ",
        result$fstatistic[3],
        " DF, p-value: ",
        Fpvalue
      ),
      collapse = ''
    )
  cat(summary_LM)
}
