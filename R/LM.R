#'LM
#'
#'LM is used to fit linear models, including multivariate ones. It can be used to carry out regression.
#'It yields the same results as the build-in methods lm() and summary(lm()).
#'@param formula an object of class "formula": a symbolic description of the model to be fitted.
#'
#'@param data an optional data frame containing the variables in the model.
#'
#'@param intercept If the model fit with intercept, intercept = TRUE;
#'if model fit without intercept, intercept = FALSE.
#'The default setting is intercept = TRUE.
#'
#'@return An object of class "LM" is a list containing at least the following components:
#' \describe{
#'   \item{coefficients}{a named vector of coefficients}
#'   \item{residuals}{the residuals, that is response minus fitted values.}
#'   \item{rank}{the numeric rank of the fitted linear model.}
#'   \item{fitted.values}{the fitted mean values.}
#'   \item{df.residual}{the residual degrees of freedom.}
#'   \item{call}{the matched call.}
#'   \item{terms}{the terms object used.}
#'   \item{coefficients_df}{the table includes estimates of beta coefficients, standard error, t value, and p-value}
#'   \item{sigma}{the residual standard error}
#'   \item{r.squared}{the proportion of the variance for a dependent variable that's explained by independent variable(s)}
#'   \item{adj.r.squared}{a penalized version of R_squared}
#'   \item{fstatistic}{the overall F statistic and its corresponding degrees of freedom of numerator and denominator}
#'   \item{cov.unscaled}{the unscaled var-cov matrix of estimates of beta coefficients}
#' }
#'
#'
#'@examples
#'## fit the simple linear regression model
#'LM(Sepal.Width ~ Sepal.Length, data = iris, intercept = FALSE) # omiting intercept
#'
#'## fit the multiple linear regression model
#'LM_result = LM(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)
#'LM_result$coefficients ## obtain estimates of beta coefficients
#'LM_result$fitted.values ## obtain fitted mean values
#'
#'## fit the multiple linear regression model with interaction terms
#'LM(Sepal.Width ~ Sepal.Length * Petal.Length, data = iris)
#'
#'## fit the linear regression model with only interaction terms
#'LM(Sepal.Width ~ I(Sepal.Length * Petal.Length), data = iris)
#'
#'@export
#'
LM = function(formula, data, intercept = TRUE) {
  #### Remove NAs ####
  data = na.omit(data)

  #### Get Y ####
  Y = matrix(data[[all.vars(formula)[1]]])

  ## Check Y type: need to be numeric
  ## return a warning if not
  if (typeof(Y) != "double") {
    return(cat(
      c(
        "Warning messages: ",
        "1: In model.response(mf, 'numeric'):",
        "using type = 'numeric' with a factor response will be ignored",
        "2: In Ops.factor(y, z$residuals): '-' not meaningful for factors"
      ),
      sep = '\n'
    ))
  }

  #### Get X, n, p depends on intercept ####
  if (intercept == TRUE) {
    X = model.matrix(formula, data)
  } else{
    X = as.matrix(model.matrix(formula, data)[, -1], nrow = nrow(data))
    colnames(X) = colnames(model.matrix(formula, data))[-1]
  }
  p = ncol(X)
  n = nrow(X)

  #### Estimation: betahat and var(betahat) ####
  betahat = solve(t(X) %*% X) %*% t(X) %*% Y
  Yhat = as.vector(X %*% betahat)
  names(Yhat) = row.names(data)

  ## residual
  epsilonhat = as.vector(Y - Yhat)
  names(epsilonhat) = row.names(data)

  ## estimated sigma^2
  sigma_squared = t(epsilonhat) %*% epsilonhat / (n - p)

  ## variance of betahat
  var_betahat = diag(solve(t(X) %*% X)) * c(sigma_squared)

  ## se of betahat
  se_betahat = sqrt(var_betahat)

  #### Inference: t statistic and p val for H0: beta=0 ####
  t_statistic = (betahat / se_betahat)
  t_p_value = 2 * pt(q = abs(t_statistic),
                     df = n - p,
                     lower.tail = FALSE)

  #### Inference: F statistic and p val for H0: beta1=...=0 ####
  Ybar = intercept * mean(Y)
  SSE = sum((Y - Yhat) ^ 2)
  SSR = sum((Yhat - Ybar) ^ 2)
  SSY = SSE + SSR
  F_stat = (SSR / (p + (-1) * intercept)) / (SSE / (n - p))
  F_p_value = 1 - pf(F_stat, p + (-1) * intercept, (n - p))

  #### Outputs ####
  LM_coefficients_table = data.frame(
    "Estimate" = betahat,
    "Std. Error" = se_betahat,
    "t value" = t_statistic,
    "Pr(>|t|)" = t_p_value,
    check.names = FALSE
  )

  LM_r.squared = 1 - SSE / SSY
  LM_adj.r.squared = 1 - (SSE / (n - p)) / (SSY / (n + (-1) * intercept))

  LM_terms = terms(formula)
  LM_sigma = sqrt(sigma_squared)[1]
  LM_fstatistic = cbind(
    value = F_stat,
    numdf = p + (-1) * intercept,
    dendf = n - p
  )

  LM_call = paste(c('lm(', formula, ')'), collapse = '')
  LM_cov.unscaled = solve(t(X) %*% X)

  #### Make output list ####
  result = list(
    betahat[, 1],
    epsilonhat,
    p,
    Yhat,
    n - p,
    LM_call,
    LM_terms,
    LM_coefficients_table,
    LM_sigma,
    LM_r.squared,
    LM_adj.r.squared,
    LM_fstatistic[1, ],
    F_p_value,
    LM_cov.unscaled
  )

  names(result) = c(
    "coefficients",
    "residuals",
    "rank",
    "fitted.values",
    "df.residual",
    "call",
    "terms",
    "coefficients_df",
    "sigma",
    "r.squared",
    "adj.r.squared",
    "fstatistic",
    "F.p-value",
    "cov.unscaled"
  )
  return(invisible(result))
}
