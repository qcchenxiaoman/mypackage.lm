#'LM
#'
#'Fit linear regression model by given dataset and corresponding interests of covariates
#'@param formula  an object of class "formula": a symbolic description of the model to be fitted.
#'
#'@param data an optional data frame containing the variables in the model.
#'
#'
#'@return a list of result: coefficients, residuals, rank, fitted.values, df.residual, model, call, terms, coefficients_df, sigma, r.squared, adj.r.squared, fstatistic, F.p-value, cov.unscaled
#'
#'
#'@examples
#'## fit the simple linear regression model
#'LM_result = LM(Sepal.Width ~ Sepal.Length, data = iris, intercept = FALSE) # omiting intercept
#'
#'## fit the multiple linear regression model
#'LM_result = LM(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)
#'LM(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)$coefficients ## obtain coefficients
#'
#'## fit the multiple linear regression model with interaction terms
#'LM(Sepal.Width ~ Sepal.Length * Petal.Length, data = iris)
#'
#'## fit the linear regression model with only interaction terms
#'LM(Sepal.Width ~ I(Sepal.Length * Petal.Length), data = iris)
#'
#'
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

  #### Get X, n, p ####
  X = model.matrix(formula, data)
  n = nrow(X)
  p = ncol(X)

  #### Estimation: betahat and var(betahat) ####
  betahat = solve(t(X) %*% X) %*% t(X) %*% Y
  Yhat = as.vector(X %*% betahat)
  names(Yhat) <- row.names(data)

  ## residual
  epsilonhat = as.vector(Y - Yhat)
  names(epsilonhat) <- row.names(data)

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
  # if(intercept == FALSE){
  #   Ybar = 0
  # }else{
  #   Ybar = mean(Y)
  # }
  Ybar = mean(Y)
  SSE = sum((Y - Yhat) ^ 2)
  SSR = sum((Yhat - Ybar) ^ 2)
  SSY = SSE + SSR
  F_stat = (SSR / (p - 1)) / (SSE / (n - p))
  F_p_value = 1 - pf(F_stat, (p - 1), (n - p))

  #### Result ####
  LM_coefficients_table = data.frame(
    "Estimate" = betahat,
    "Std. Error" = se_betahat,
    "t value" = t_statistic,
    "Pr(>|t|)" = t_p_value, check.names = FALSE
  )

  LM_r.squared = 1 - SSE / SSY
  LM_adj.r.squared = 1 - (SSE / (n - p)) / (SSY / (n - 1))
  LM_model = cbind(data[all.vars(formula)[1]], X[,-1])
  LM_terms = terms(formula)
  LM_sigma = sqrt(sigma_squared)[1]
  LM_fstatistic = cbind(value = F_stat,
                        numdf = p - 1,
                        dendf = n - p)


  LM_call = paste(c('lm(', formula, ')'), collapse = '')
  LM_cov.unscaled = solve(t(X) %*% X)

  #### Make result list ####
  result = list(betahat[, 1],
                epsilonhat,
                p,
                Yhat,
                n - p,
                LM_model,
                LM_call,
                LM_terms,
                LM_coefficients_table,
                LM_sigma,
                LM_r.squared,
                LM_adj.r.squared,
                LM_fstatistic[1,],
                F_p_value,
                LM_cov.unscaled)

  names(result) = c("coefficients",
                    "residuals",
                    "rank",
                    "fitted.values",
                    "df.residual",
                    "model",
                    "call",
                    "terms",
                    "coefficients_df",
                    "sigma",
                    "r.squared",
                    "adj.r.squared",
                    "fstatistic",
                    "F.p-value",
                    "cov.unscaled")
  return(invisible(result))
}

