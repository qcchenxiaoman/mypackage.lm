
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

LM_result = LM(Sepal.Width ~ Sepal.Length + Petal.Length, data = iris)
LM_result$coefficients
#>  (Intercept) Sepal.Length Petal.Length 
#>    1.0380691    0.5611860   -0.3352667
LM_result$residuals
#>             1             2             3             4             5 
#>  0.0692559285 -0.3185068772 -0.0397963572 -0.0166244118  0.2253745256 
#>             6             7             8             9            10 
#>  0.4014801597  0.2498489141  0.0589011998 -0.1379138917 -0.1849802031 
#>            11            12            13            14            15 
#>  0.1344268114  0.2046650682 -0.2623882801 -0.0823753171  0.1093724005 
#>            16            17            18            19            20 
#>  0.6660710200  0.2673734631  0.0692559285  0.1331243684  0.4027826027 
#>            21            22            23            24            25 
#> -0.0985198403  0.3027826027  0.3157422175 -0.0301640490  0.3052450907 
#>            26            27            28            29            30 
#> -0.3075721260  0.0924278740  0.0466640056 -0.0868626686  0.0607836653 
#>            31            32            33            34            35 
#> -0.0953349318 -0.1655731886  0.6466640056  0.5447815401 -0.1849802031 
#>            36            37            38            39            40 
#> -0.2416788227 -0.1887451341  0.2814931228 -0.0714405658  0.0027826027 
#>            41            42            43            44            45 
#>  0.0918478515 -0.8275591630  0.1285594342  0.1924278740  0.5368892993 
#>            46            47            48            49            50 
#> -0.2623882801  0.4363092769  0.0498489141  0.1905454085 -0.0746254744 
#>            51            52            53            54            55 
#> -0.1906171693  0.0790410650 -0.1674452239 -0.4835249318 -0.3435508579 
#>            56            57            58            59            60 
#>  0.0718712448  0.3022130104 -0.2815000682 -0.2996694551  0.0513041854 
#>            61            62            63            64            65 
#> -0.6705653170  0.0590540281 -0.8641179173  0.0144502047 -0.0737502255 
#>            66            67            68            69            70 
#> -0.2228414005  0.3279898419 -0.2183540490 -0.8087217408 -0.3731702031 
#>            71            72            73            74            75 
#>  0.4602140730 -0.3202365145 -0.4307336413 -0.0855497953 -0.2880122833 
#>            76            77            78            79            80 
#> -0.2667228034 -0.4448533010 -0.1216813555  0.0035154534 -0.4633954968 
#>            81            82            83            84            85 
#> -0.4505782801 -0.4841049543 -0.2854073973  0.0046754984  0.4402270361 
#>            86            87            88            89            90 
#>  0.5035154534 -0.1222613780 -0.7983670120  0.1938831453 -0.2835249318 
#>            91            92            93            94            95 
#> -0.0494182352  0.0809235305 -0.3518807231 -0.4376186654 -0.0725901806 
#>            96            97            98            99           100 
#>  0.1712912223  0.0712912223 -0.1757750891 -0.3943172849 -0.0622354519 
#>           101           102           103           104           105 
#>  0.7380597745  0.1169126926 -0.0444156766  0.2039530779  0.2587692319 
#>           106           107           108           109           110 
#> -0.0903219430  0.2208200217 -0.1225461741 -0.3534679623  0.5665190747 
#>           111           112           113           114           115 
#>  0.2240825128 -0.1527455417 -0.0101665819 -0.0604953844  0.2169126926 
#>           116           117           118           119           120 
#>  0.3472544583  0.1581892095  0.6870861341 -0.4458605176 -0.5288511758 
#>           121           122           123           124           125 
#>  0.2007681694  0.2620965385 -0.3129138659 -0.2307336413  0.4130053636 
#>           126           127           128           129           130 
#>  0.1329924005 -0.1081417183  0.1815035530  0.0478344807 -0.1340609478 
#>           131           132           133           134           135 
#> -0.3457181196  0.4742689174  0.0478344807 -0.0636802929  0.0161902721 
#>           136           137           138           139           140 
#> -0.3140739109  0.7039530779  0.3143078066  0.2040954759  0.0001881469 
#>           141           142           143           144           145 
#>  0.1794786894 -0.1003918756  0.1169126926  0.3239401148  0.4130053636 
#>           146           147           148           149           150 
#> -0.0546280072 -0.3972069671  0.0576091870  0.6930183266  0.3607940955
LM_result$rank
#> [1] 3
LM_result$fitted.values
#>        1        2        3        4        5        6        7        8 
#> 3.430744 3.318507 3.239796 3.116624 3.374625 3.498520 3.150151 3.341099 
#>        9       10       11       12       13       14       15       16 
#> 3.037914 3.284980 3.565573 3.195335 3.262388 3.082375 3.890628 3.733929 
#>       17       18       19       20       21       22       23       24 
#> 3.632627 3.430744 3.666876 3.397217 3.498520 3.397217 3.284258 3.330164 
#>       25       26       27       28       29       30       31       32 
#> 3.094755 3.307572 3.307572 3.453336 3.486863 3.139216 3.195335 3.565573 
#>       33       34       35       36       37       38       39       40 
#> 3.453336 3.655218 3.284980 3.441679 3.688745 3.318507 3.071441 3.397217 
#>       41       42       43       44       45       46       47       48 
#> 3.408152 3.127559 3.071441 3.307572 3.263111 3.262388 3.363691 3.150151 
#>       49       50       51       52       53       54       55       56 
#> 3.509455 3.374625 3.390617 3.120959 3.267445 2.783525 3.143551 2.728129 
#>       57       58       59       60       61       62       63       64 
#> 2.997787 2.681500 3.199669 2.648696 2.670565 2.940946 3.064118 2.885550 
#>       65       66       67       68       69       70       71       72 
#> 2.973750 3.322841 2.672010 2.918354 3.008722 2.873170 2.739786 3.120237 
#>       73       74       75       76       77       78       79       80 
#> 2.930734 2.885550 3.188012 3.266723 3.244853 3.121681 2.896485 3.063395 
#>       81       82       83       84       85       86       87       88 
#> 2.850578 2.884105 2.985407 2.695325 2.559773 2.896485 3.222261 3.098367 
#>       89       90       91       92       93       94       95       96 
#> 2.806117 2.783525 2.649418 2.919076 2.951881 2.737619 2.772590 2.828709 
#>       97       98       99      100      101      102      103      104 
#> 2.828709 3.075775 2.894317 2.862235 2.561940 2.583087 3.044416 2.696047 
#>      105      106      107      108      109      110      111      112 
#> 2.741231 3.090322 2.279180 3.022546 2.853468 3.033481 2.975917 2.852746 
#>      113      114      115      116      117      118      119      120 
#> 3.010167 2.560495 2.583087 2.852746 2.841811 3.112914 3.045861 2.728851 
#>      121      122      123      124      125      126      127      128 
#> 2.999232 2.537903 3.112914 2.930734 2.886995 3.067008 2.908142 2.818496 
#>      129      130      131      132      133      134      135      136 
#> 2.752166 3.134061 3.145718 3.325731 2.752166 2.863680 2.583810 3.314074 
#>      137      138      139      140      141      142      143      144 
#> 2.696047 2.785692 2.795905 3.099812 2.920521 3.200392 2.583087 2.876060 
#>      145      146      147      148      149      150 
#> 2.886995 3.054628 2.897207 2.942391 2.706982 2.639206
LM_result$df.residual
#> [1] 147
LM_result$call
#> [1] "lm(Sepal.Width ~ Sepal.Length + Petal.Length)"
LM_result$terms
#> Sepal.Width ~ Sepal.Length + Petal.Length
#> attr(,"variables")
#> list(Sepal.Width, Sepal.Length, Petal.Length)
#> attr(,"factors")
#>              Sepal.Length Petal.Length
#> Sepal.Width             0            0
#> Sepal.Length            1            0
#> Petal.Length            0            1
#> attr(,"term.labels")
#> [1] "Sepal.Length" "Petal.Length"
#> attr(,"order")
#> [1] 1 1
#> attr(,"intercept")
#> [1] 1
#> attr(,"response")
#> [1] 1
#> attr(,".Environment")
#> <environment: R_GlobalEnv>
LM_result$coefficients_df
#>                Estimate Std. Error    t value     Pr(>|t|)
#> (Intercept)   1.0380691 0.28816846   3.602299 4.308316e-04
#> Sepal.Length  0.5611860 0.06533060   8.589940 1.163254e-14
#> Petal.Length -0.3352667 0.03064528 -10.940240 9.429194e-21
LM_result$sigma
#> [1] 0.3235352
LM_result$r.squared
#> [1] 0.456415
LM_result$adj.r.squared
#> [1] 0.4490193
LM_result$fstatistic
#>     value     numdf     dendf 
#>  61.71344   2.00000 147.00000
LM_result$`F.p-value`
#> [1] 0
LM_result$cov.unscaled
#>              (Intercept) Sepal.Length Petal.Length
#> (Intercept)   0.79332277  -0.17560031  0.063713415
#> Sepal.Length -0.17560031   0.04077466 -0.016673668
#> Petal.Length  0.06371341  -0.01667367  0.008971896
```

For more detailed tutorial and comparisons against the existing `lm()` and `summary(lm())` functions, 
please refer to the vignettes via the following code `browseVignettes(package = 'mypackage.lm')`.
