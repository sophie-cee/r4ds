My\_First\_Markdown
================

R Markdown
----------

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

``` r
d.new <- mtcars %>% 
  select(mpg)

(d.new)
```

    ##                      mpg
    ## Mazda RX4           21.0
    ## Mazda RX4 Wag       21.0
    ## Datsun 710          22.8
    ## Hornet 4 Drive      21.4
    ## Hornet Sportabout   18.7
    ## Valiant             18.1
    ## Duster 360          14.3
    ## Merc 240D           24.4
    ## Merc 230            22.8
    ## Merc 280            19.2
    ## Merc 280C           17.8
    ## Merc 450SE          16.4
    ## Merc 450SL          17.3
    ## Merc 450SLC         15.2
    ## Cadillac Fleetwood  10.4
    ## Lincoln Continental 10.4
    ## Chrysler Imperial   14.7
    ## Fiat 128            32.4
    ## Honda Civic         30.4
    ## Toyota Corolla      33.9
    ## Toyota Corona       21.5
    ## Dodge Challenger    15.5
    ## AMC Javelin         15.2
    ## Camaro Z28          13.3
    ## Pontiac Firebird    19.2
    ## Fiat X1-9           27.3
    ## Porsche 914-2       26.0
    ## Lotus Europa        30.4
    ## Ford Pantera L      15.8
    ## Ferrari Dino        19.7
    ## Maserati Bora       15.0
    ## Volvo 142E          21.4

``` r
glimpse(mtcars)
```

    ## Observations: 32
    ## Variables: 11
    ## $ mpg  <dbl> 21.0, 21.0, 22.8, 21.4, 18.7, 18.1, 14.3, 24.4, 22.8, 19.2,…
    ## $ cyl  <dbl> 6, 6, 4, 6, 8, 6, 8, 4, 4, 6, 6, 8, 8, 8, 8, 8, 8, 4, 4, 4,…
    ## $ disp <dbl> 160.0, 160.0, 108.0, 258.0, 360.0, 225.0, 360.0, 146.7, 140…
    ## $ hp   <dbl> 110, 110, 93, 110, 175, 105, 245, 62, 95, 123, 123, 180, 18…
    ## $ drat <dbl> 3.90, 3.90, 3.85, 3.08, 3.15, 2.76, 3.21, 3.69, 3.92, 3.92,…
    ## $ wt   <dbl> 2.620, 2.875, 2.320, 3.215, 3.440, 3.460, 3.570, 3.190, 3.1…
    ## $ qsec <dbl> 16.46, 17.02, 18.61, 19.44, 17.02, 20.22, 15.84, 20.00, 22.…
    ## $ vs   <dbl> 0, 0, 1, 1, 0, 1, 0, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1, 1,…
    ## $ am   <dbl> 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,…
    ## $ gear <dbl> 4, 4, 4, 3, 3, 3, 3, 4, 4, 4, 4, 3, 3, 3, 3, 3, 3, 4, 4, 4,…
    ## $ carb <dbl> 4, 4, 1, 1, 2, 1, 4, 2, 2, 4, 4, 3, 3, 3, 4, 4, 4, 1, 2, 1,…

Including Plots
---------------

You can also embed plots, for example:

``` r
plot(pressure)
```

![](My_First_Markdown_files/figure-markdown_github/pressure-1.png)

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.
