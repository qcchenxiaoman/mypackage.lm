# mypackage.lm

## Overview
`mypackage.lm` is created for BIOSTAT 625 HW3, which is intended to execute linear regression models on a specified data frame, 
mimicking the the build-in methods `lm()` and  `summary(lm())` in `R`. 

- `LM()` is used to fit simple linear regression or multiple linear regression. 
The function does not explicitly present any output until you extract the desired output with `$` followed by its name. 
The outputs can be extracted are 
`coefficients`, `residuals`, `rank`, `fitted.values`, `df.residual, model`, `call`, `terms`, 
`coefficients_df`, `sigma`, `r.squared`, `adj.r.squared`, `fstatistic`, `F.p-value`, `cov.unscaled`. 
Please refer to the help page via ?LM for detailed information.


- `summaryLM()` is used to print the summary of fitted linear regression models by `LM()`. 
Please refer to the help page via ?summaryLM for detailed information.


## Installation
```{r}
install.packages('devtools')
install.packages("bench")
devtools::install_github("qcchenxiaoman/mypackage.lm", build_vignettes = T)
```

## Usage

```{r}
library(mypackage.lm)

LM_result = LM(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)
LM_result$r.squared
#> [1] 0.456415
LM_result$adj.r.squared
#> [1] 0.4490193
LM_result$coefficients_df
#>                Estimate Std. Error    t value     Pr(>|t|)
#> (Intercept)   1.0380691 0.28816846   3.602299 4.308316e-04
#> Sepal.Length  0.5611860 0.06533060   8.589940 1.163254e-14
#> Petal.Length -0.3352667 0.03064528 -10.940240 9.429194e-21
```

For more detailed tutorial and comparisons against the existing R function, 
please refer to the vignettes via the following code `browseVignettes(package = 'mypackage.lm')`.
