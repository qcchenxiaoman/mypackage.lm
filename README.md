
# mypackage.lm

<!-- badges: start -->
  [![R-CMD-check](https://github.com/qcchenxiaoman/mypackage.lm/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/qcchenxiaoman/mypackage.lm/actions/workflows/R-CMD-check.yaml)
[![Codecov test coverage](https://codecov.io/gh/qcchenxiaoman/mypackage.lm/branch/main/graph/badge.svg)](https://app.codecov.io/gh/qcchenxiaoman/mypackage.lm?branch=main)
<!-- badges: end -->

The goal of mypackage.lm is to execute linear regression models on a specified data frame, 
mimicking the the build-in methods `lm()` and  `summary(lm())` in `R`. 

- `LM()` is used to fit simple linear regression or multiple linear regression. 
It yields the same but combined output results from the build-in methods lm() and summary(lm()).
The function does not explicitly present any output until you extract the desired output with `$` followed by its name. 
The outputs can be extracted are 
`coefficients`, `residuals`, `rank`, `fitted.values`, `df.residual, model`, `call`, `terms`, 
`coefficients_df`, `sigma`, `r.squared`, `adj.r.squared`, `fstatistic`, `F.p-value`, `cov.unscaled`. 
Please refer to the help page via `?LM` for detailed information.


- `summaryLM()` is used to print the summary of fitted linear regression models by `LM()`. 
Please refer to the help page via `?summaryLM` for detailed information.


## Installation

You can install the development version of mypackage.lm from [GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("qcchenxiaoman/mypackage.lm", build_vignettes = T)
```

## Usage

This is a basic example which shows you how to solve a common problem:

``` r
library(mypackage.lm)

LM_result = LM(Sepal.Width ~ Sepal.Length + Petal.Width, data = iris)
LM_result$coefficients
#>  (Intercept) Sepal.Length  Petal.Width 
#>    1.9263208    0.2892867   -0.4664143
LM_result$residuals
#>             1             2             3             4             5 
#>  0.1915997715 -0.2505428828  0.0073144628 -0.0637568644  0.3205284443 
#>             6             7             8             9            10 
#>  0.5980966142  0.2828845662  0.1205284443 -0.2058995187 -0.1971843135 
#>            11            12            13            14            15 
#>  0.3048137530  0.1783857900 -0.2682556406 -0.1236122765  0.4890990617 
#>            16            17            18            19            20 
#>  1.0113105957  0.5980966142  0.2382412021  0.3646691651  0.5382412021 
#>            21            22            23            24            25 
#>  0.0048137530  0.4848826327  0.4362431356  0.1315240633  0.1783857900 
#>            26            27            28            29            30 
#> -0.2794715557  0.2138113055  0.1626710987  0.0626710987  0.0073144628 
#>            31            32            33            34            35 
#> -0.1216142100  0.0980966142  0.7160296681  0.7758850802 -0.1505428828 
#>            36            37            38            39            40 
#> -0.0794715557  0.0758850802  0.3028156865 -0.1058995187  0.0915997715 
#>            41            42            43            44            45 
#>  0.2671698749 -0.7881867609  0.0941004813  0.4070941668  0.5848826327 
#>            46            47            48            49            50 
#> -0.1749727794  0.4915997715  0.0362431356  0.3337424258  0.0205284443 
#>            51            52            53            54            55 
#> -0.0983478450  0.1218656226 -0.1227777415 -0.6110591831 -0.3070630502 
#>            56            57            58            59            60 
#> -0.1689165288  0.2974357260 -0.4774114380 -0.3292745843 -0.0776317340 
#>            61            62            63            64            65 
#> -0.9063401108  0.0665089868 -0.9956268391 -0.1379897895 -0.0399878560 
#>            66            67            68            69            70 
#> -0.1115618265  0.1532950052 -0.4377694935 -0.8202770317 -0.5332707172 
#>            71            72            73            74            75 
#>  0.4064332786 -0.2846312201 -0.5492057046 -0.3312726507 -0.2714172386 
#>            76            77            78            79            80 
#> -0.1826331537 -0.4404904993 -0.0716375347 -0.0624196861 -0.5088408206 
#>            81            82            83            84            85 
#> -0.6043420444 -0.6509834750 -0.3444866322 -0.2157782555  0.2111523509 
#>            86            87            88            89            90 
#>  0.4842217445 -0.0649203959 -0.8424885658  0.0600121440 -0.4110591831 
#>            91            92            93            94            95 
#> -0.3577006137 -0.0379897895 -0.4444866322 -0.6063401108 -0.2399878560 
#>            96            97            98            99           100 
#> -0.0155579594 -0.0689165288 -0.2135598929 -0.3886273530 -0.1689165288 
#>           101           102           103           104           105 
#>  0.7172086015 -0.0179966180 -0.0007865036 -0.0092814127  0.2194269640 
#>           106           107           108           109           110 
#> -0.1454298677 -0.0509214237 -0.2985681410 -0.5249961041  0.7568505461 
#>           111           112           113           114           115 
#>  0.3261441028 -0.1915686550  0.0859995149 -0.1424265145  0.3152105351 
#>           116           117           118           119           120 
#>  0.4949970675  0.0328612416  0.6722828901 -0.4810756793 -0.7624196861 
#>           121           122           123           124           125 
#>  0.3503537033  0.1865021583 -0.4209999711 -0.2092814127  0.4149281878 
#>           126           127           128           129           130 
#>  0.0303605318 -0.0803527399  0.1485759329  0.0017142063 -0.2629223294 
#>           131           132           133           134           135 
#> -0.3808553833  0.5211426832  0.0483556369 -0.2492057046 -0.4379897895 
#>           136           137           138           139           140 
#> -0.0810756793  0.7705671709  0.1617899144  0.1775046058  0.1570708421 
#>           141           142           143           144           145 
#>  0.3548524796  0.2503537033 -0.0179966180  0.3792823762  0.6014939102 
#>           146           147           148           149           150 
#>  0.2082110490 -0.3626399821  0.1261441028  0.7528544131  0.2064332786
LM_result$rank
#> [1] 3
LM_result$fitted.values
#>        1        2        3        4        5        6        7        8 
#> 3.308400 3.250543 3.192686 3.163757 3.279472 3.301903 3.117115 3.279472 
#>        9       10       11       12       13       14       15       16 
#> 3.105900 3.297184 3.395186 3.221614 3.268256 3.123612 3.510901 3.388689 
#>       17       18       19       20       21       22       23       24 
#> 3.301903 3.261759 3.435331 3.261759 3.395186 3.215117 3.163757 3.168476 
#>       25       26       27       28       29       30       31       32 
#> 3.221614 3.279472 3.186189 3.337329 3.337329 3.192686 3.221614 3.301903 
#>       33       34       35       36       37       38       39       40 
#> 3.383970 3.424115 3.250543 3.279472 3.424115 3.297184 3.105900 3.308400 
#>       41       42       43       44       45       46       47       48 
#> 3.232830 3.088187 3.105900 3.092906 3.215117 3.174973 3.308400 3.163757 
#>       49       50       51       52       53       54       55       56 
#> 3.366258 3.279472 3.298348 3.078134 3.222778 2.911059 3.107063 2.968917 
#>       57       58       59       60       61       62       63       64 
#> 3.002564 2.877411 3.229275 2.777632 2.906340 2.933491 3.195627 3.037990 
#>       65       66       67       68       69       70       71       72 
#> 2.939988 3.211562 2.846705 3.137769 3.020277 3.033271 2.793567 3.084631 
#>       73       74       75       76       77       78       79       80 
#> 3.049206 3.131273 3.171417 3.182633 3.240490 3.071638 2.962420 3.108841 
#>       81       82       83       84       85       86       87       88 
#> 3.004342 3.050983 3.044487 2.915778 2.788848 2.915778 3.164920 3.142489 
#>       89       90       91       92       93       94       95       96 
#> 2.939988 2.911059 2.957701 3.037990 3.044487 2.906340 2.939988 3.015558 
#>       97       98       99      100      101      102      103      104 
#> 2.968917 3.113560 2.888627 2.968917 2.582791 2.717997 3.000787 2.909281 
#>      105      106      107      108      109      110      111      112 
#> 2.780573 3.145430 2.550921 3.198568 3.024996 2.843149 2.873856 2.891569 
#>      113      114      115      116      117      118      119      120 
#> 2.914000 2.642427 2.484789 2.705003 2.967139 3.127717 3.081076 2.962420 
#>      121      122      123      124      125      126      127      128 
#> 2.849646 2.613498 3.221000 2.909281 2.885072 3.169639 2.880353 2.851424 
#>      129      130      131      132      133      134      135      136 
#> 2.798286 3.262922 3.180855 3.278857 2.751644 3.049206 3.037990 3.081076 
#>      137      138      139      140      141      142      143      144 
#> 2.629433 2.938210 2.822495 2.942929 2.745148 2.849646 2.717997 2.820718 
#>      145      146      147      148      149      150 
#> 2.698506 2.791789 2.862640 2.873856 2.647146 2.793567
LM_result$df.residual
#> [1] 147
LM_result$call
#> [1] "lm(Sepal.Width ~ Sepal.Length + Petal.Width)"
LM_result$terms
#> Sepal.Width ~ Sepal.Length + Petal.Width
#> attr(,"variables")
#> list(Sepal.Width, Sepal.Length, Petal.Width)
#> attr(,"factors")
#>              Sepal.Length Petal.Width
#> Sepal.Width             0           0
#> Sepal.Length            1           0
#> Petal.Width             0           1
#> attr(,"term.labels")
#> [1] "Sepal.Length" "Petal.Width" 
#> attr(,"order")
#> [1] 1 1
#> attr(,"intercept")
#> [1] 1
#> attr(,"response")
#> [1] 1
#> attr(,".Environment")
#> <environment: R_GlobalEnv>
LM_result$coefficients_df
#>                Estimate Std. Error   t value     Pr(>|t|)
#> (Intercept)   1.9263208 0.32093615  6.002193 1.453405e-08
#> Sepal.Length  0.2892867 0.06604544  4.380117 2.241644e-05
#> Petal.Width  -0.4664143 0.07174926 -6.500615 1.169070e-09
LM_result$sigma
#> [1] 0.384058
LM_result$r.squared
#> [1] 0.2340188
LM_result$adj.r.squared
#> [1] 0.2235973
LM_result$fstatistic
#>     value     numdf     dendf 
#>  22.45535   2.00000 147.00000
LM_result$`F.p-value`
#> [1] 3.090526e-09
LM_result$cov.unscaled
#>              (Intercept) Sepal.Length Petal.Width
#> (Intercept)    0.6983026  -0.14128774  0.11169157
#> Sepal.Length  -0.1412877   0.02957277 -0.02627778
#> Petal.Width    0.1116916  -0.02627778  0.03490127

summaryLM(LM(Sepal.Width ~ Sepal.Length + Petal.Width, data = iris))
#> Call: 
#> lm(Sepal.Width ~ Sepal.Length + Petal.Width)
#>  
#> Residuals: 
#>          Min           1Q       Median           3Q          Max 
#> -0.995626839 -0.246901242 -0.005033958  0.233537643  1.011310596 
#> 
#> Coefficients: 
#>                Estimate Std. Error   t value     Pr(>|t|)    
#> (Intercept)   1.9263208 0.32093615  6.002193 1.453405e-08 ***
#> Sepal.Length  0.2892867 0.06604544  4.380117 2.241644e-05 ***
#> Petal.Width  -0.4664143 0.07174926 -6.500615 1.169070e-09 ***
#> ---
#> Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1 
#> 
#> Residual standard error: 0.384057992599148 on 147 degrees of freedom 
#> Multiple R-Squared: 0.234018769482097, Adjusted R-squared: 0.223597256141718
#> F-Statistic: 22.4553538280624 on 2 and 147 DF, p-value: 3.09052605729221e-09
```

For more detailed tutorial and comparisons against the existing `lm()` and `summary(lm())` functions, 
please refer to the vignettes via the following code `browseVignettes(package = 'mypackage.lm')`.
