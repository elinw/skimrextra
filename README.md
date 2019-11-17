
<!-- README.md is generated from README.Rmd. Please edit that file -->
skimrExtra
==========

<!-- badges: start -->
<!-- badges: end -->
The goal of skimrExtra is to provide examples of extension to the skimr package.

Installation
------------

You can install the released version of skimrExtra from github.

``` r
devtools::install_github("elinw/skimrExtra")
```

Using skimrExtra
----------------

The `skimr` package provides a compact summary of data in a data frame or object that can be coerced to a data frame. The summary provides an an opinionated list of statistics for many of the most commonly used data types (based on the `class()` of a variable). This package, skimrExtra, extends this to some additional types both as examples of how to do this and in response to some common requests for additional data types.

For example, objects using produced by the `sf` (simple features) package include (one or more) columns representing geometries. These are in geographic formats and not standard. In `skimr` these fall back to the default type of character, while `skimrExtra` supports them directly, assuming that the `sf` package is installed.

``` r
library(skimr)
if (requireNamespace("sf", quietly = TRUE)){
  library(sf)
  nc <- st_read(system.file("shape/nc.shp", package = "sf"))
  skim(nc)
}
#> Linking to GEOS 3.7.2, GDAL 2.4.2, PROJ 5.2.0
#> Reading layer `nc' from data source `/Users/elinwaring/Library/R/3.6/library/sf/shape/nc.shp' using driver `ESRI Shapefile'
#> Simple feature collection with 100 features and 14 fields
#> geometry type:  MULTIPOLYGON
#> dimension:      XY
#> bbox:           xmin: -84.32385 ymin: 33.88199 xmax: -75.45698 ymax: 36.58965
#> epsg (SRID):    4267
#> proj4string:    +proj=longlat +datum=NAD27 +no_defs
#> Warning: Couldn't find skimmers for class: sfc_MULTIPOLYGON, sfc; No user-
#> defined `sfl` provided. Falling back to `character`.
```

|                                                  |      |
|:-------------------------------------------------|:-----|
| Name                                             | nc   |
| Number of rows                                   | 100  |
| Number of columns                                | 15   |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |      |
| Column type frequency:                           |      |
| character                                        | 1    |
| factor                                           | 2    |
| numeric                                          | 12   |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |      |
| Group variables                                  | None |

**Variable type: character**

| skim\_variable |  n\_missing|  complete\_rate|  min|   max|  empty|  n\_unique|  whitespace|
|:---------------|-----------:|---------------:|----:|-----:|------:|----------:|-----------:|
| geometry       |           0|               1|  232|  1965|      0|        100|           0|

**Variable type: factor**

| skim\_variable |  n\_missing|  complete\_rate| ordered |  n\_unique| top\_counts                    |
|:---------------|-----------:|---------------:|:--------|----------:|:-------------------------------|
| NAME           |           0|               1| FALSE   |        100| Ala: 1, Ale: 1, All: 1, Ans: 1 |
| FIPS           |           0|               1| FALSE   |        100| 370: 1, 370: 1, 370: 1, 370: 1 |

**Variable type: numeric**

| skim\_variable |  n\_missing|  complete\_rate|      mean|       sd|        p0|       p25|       p50|       p75|      p100| hist  |
|:---------------|-----------:|---------------:|---------:|--------:|---------:|---------:|---------:|---------:|---------:|:------|
| AREA           |           0|               1|      0.13|     0.05|      0.04|      0.09|      0.12|      0.15|      0.24| ▆▇▆▃▂ |
| PERIMETER      |           0|               1|      1.67|     0.48|      1.00|      1.32|      1.61|      1.86|      3.64| ▇▇▂▁▁ |
| CNTY\_         |           0|               1|   1985.96|   106.52|   1825.00|   1902.25|   1982.00|   2067.25|   2241.00| ▇▆▆▅▁ |
| CNTY\_ID       |           0|               1|   1985.96|   106.52|   1825.00|   1902.25|   1982.00|   2067.25|   2241.00| ▇▆▆▅▁ |
| FIPSNO         |           0|               1|  37100.00|    58.02|  37001.00|  37050.50|  37100.00|  37149.50|  37199.00| ▇▇▇▇▇ |
| CRESS\_ID      |           0|               1|     50.50|    29.01|      1.00|     25.75|     50.50|     75.25|    100.00| ▇▇▇▇▇ |
| BIR74          |           0|               1|   3299.62|  3848.17|    248.00|   1077.00|   2180.50|   3936.00|  21588.00| ▇▁▁▁▁ |
| SID74          |           0|               1|      6.67|     7.78|      0.00|      2.00|      4.00|      8.25|     44.00| ▇▂▁▁▁ |
| NWBIR74        |           0|               1|   1050.81|  1432.91|      1.00|    190.00|    697.50|   1168.50|   8027.00| ▇▁▁▁▁ |
| BIR79          |           0|               1|   4223.92|  5179.46|    319.00|   1336.25|   2636.00|   4889.00|  30757.00| ▇▁▁▁▁ |
| SID79          |           0|               1|      8.36|     9.43|      0.00|      2.00|      5.00|     10.25|     57.00| ▇▂▁▁▁ |
| NWBIR79        |           0|               1|   1352.81|  1976.00|      3.00|    250.50|    874.50|   1406.75|  11631.00| ▇▁▁▁▁ |

Support for variables of the class `haven_labelled` is also included. This support simply identifies the underlying data type using `typeof()` and assumes the user will manage further processing if desired.

``` r
library(skimrExtra)
## basic example code
if (requireNamespace("sf", quietly = TRUE)){
  skim(nc)
}
```

|                                                  |      |
|:-------------------------------------------------|:-----|
| Name                                             | nc   |
| Number of rows                                   | 100  |
| Number of columns                                | 15   |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |      |
| Column type frequency:                           |      |
| factor                                           | 2    |
| numeric                                          | 12   |
| sfc\_MULTIPOLYGON                                | 1    |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |      |
| Group variables                                  | None |

**Variable type: factor**

| skim\_variable |  n\_missing|  complete\_rate| ordered |  n\_unique| top\_counts                    |
|:---------------|-----------:|---------------:|:--------|----------:|:-------------------------------|
| NAME           |           0|               1| FALSE   |        100| Ala: 1, Ale: 1, All: 1, Ans: 1 |
| FIPS           |           0|               1| FALSE   |        100| 370: 1, 370: 1, 370: 1, 370: 1 |

**Variable type: numeric**

| skim\_variable |  n\_missing|  complete\_rate|      mean|       sd|        p0|       p25|       p50|       p75|      p100| hist  |
|:---------------|-----------:|---------------:|---------:|--------:|---------:|---------:|---------:|---------:|---------:|:------|
| AREA           |           0|               1|      0.13|     0.05|      0.04|      0.09|      0.12|      0.15|      0.24| ▆▇▆▃▂ |
| PERIMETER      |           0|               1|      1.67|     0.48|      1.00|      1.32|      1.61|      1.86|      3.64| ▇▇▂▁▁ |
| CNTY\_         |           0|               1|   1985.96|   106.52|   1825.00|   1902.25|   1982.00|   2067.25|   2241.00| ▇▆▆▅▁ |
| CNTY\_ID       |           0|               1|   1985.96|   106.52|   1825.00|   1902.25|   1982.00|   2067.25|   2241.00| ▇▆▆▅▁ |
| FIPSNO         |           0|               1|  37100.00|    58.02|  37001.00|  37050.50|  37100.00|  37149.50|  37199.00| ▇▇▇▇▇ |
| CRESS\_ID      |           0|               1|     50.50|    29.01|      1.00|     25.75|     50.50|     75.25|    100.00| ▇▇▇▇▇ |
| BIR74          |           0|               1|   3299.62|  3848.17|    248.00|   1077.00|   2180.50|   3936.00|  21588.00| ▇▁▁▁▁ |
| SID74          |           0|               1|      6.67|     7.78|      0.00|      2.00|      4.00|      8.25|     44.00| ▇▂▁▁▁ |
| NWBIR74        |           0|               1|   1050.81|  1432.91|      1.00|    190.00|    697.50|   1168.50|   8027.00| ▇▁▁▁▁ |
| BIR79          |           0|               1|   4223.92|  5179.46|    319.00|   1336.25|   2636.00|   4889.00|  30757.00| ▇▁▁▁▁ |
| SID79          |           0|               1|      8.36|     9.43|      0.00|      2.00|      5.00|     10.25|     57.00| ▇▂▁▁▁ |
| NWBIR79        |           0|               1|   1352.81|  1976.00|      3.00|    250.50|    874.50|   1406.75|  11631.00| ▇▁▁▁▁ |

**Variable type: sfc\_MULTIPOLYGON**

| skim\_variable |  n\_missing|  complete\_rate|  n\_unique|  valid|  simple|  n\_empty|
|:---------------|-----------:|---------------:|----------:|------:|-------:|---------:|
| geometry       |           0|               1|        100|    100|     100|         0|

Generally speaking, the skimr API should be extended in packages that wish to use it rather than relying on the `skimr` or `skimrExtra` maintainers. Doing so allows much greater customization. Instructions for this are included in the `skimr` "Supporting additional objects" vignette.

Utility functions
-----------------

The package also includes a utility function `skim_to_var_table()` which produces a more compact data frame than does the standard `skim()` function by casting statistics with shared names to strings and placing them in a single column.

``` r
skim_to_var_table(CO2) %>% knitr::kable()
```

| skim\_variable |  n\_missing|  complete\_rate| ordered |  n\_unique| top\_counts                    | data\_type | n   | mean | sd  | p0  | p25 | p50 | p75 | p100 | hist  |
|:---------------|-----------:|---------------:|:--------|----------:|:-------------------------------|:-----------|:----|:-----|:----|:----|:----|:----|:----|:-----|:------|
| Plant          |           0|               1| TRUE    |         12| Qn1: 7, Qn2: 7, Qn3: 7, Qc1: 7 | factor     | 84  | NA   | NA  | NA  | NA  | NA  | NA  | NA   | NA    |
| Type           |           0|               1| FALSE   |          2| Que: 42, Mis: 42               | factor     | 84  | NA   | NA  | NA  | NA  | NA  | NA  | NA   | NA    |
| Treatment      |           0|               1| FALSE   |          2| non: 42, chi: 42               | factor     | 84  | NA   | NA  | NA  | NA  | NA  | NA  | NA   | NA    |
| conc           |           0|               1| NA      |         NA| NA                             | numeric    | 84  | 435  | 296 | 95  | 175 | 350 | 675 | 1000 | ▇▂▂▂▂ |
| uptake         |           0|               1| NA      |         NA| NA                             | numeric    | 84  | 27   | 11  | 7.7 | 18  | 28  | 37  | 46   | ▇▇▅▇▇ |

compared to

``` r
skim(CO2)
```

|                                                  |      |
|:-------------------------------------------------|:-----|
| Name                                             | CO2  |
| Number of rows                                   | 84   |
| Number of columns                                | 5    |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_   |      |
| Column type frequency:                           |      |
| factor                                           | 3    |
| numeric                                          | 2    |
| \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_ |      |
| Group variables                                  | None |

**Variable type: factor**

| skim\_variable |  n\_missing|  complete\_rate| ordered |  n\_unique| top\_counts                    |
|:---------------|-----------:|---------------:|:--------|----------:|:-------------------------------|
| Plant          |           0|               1| TRUE    |         12| Qn1: 7, Qn2: 7, Qn3: 7, Qc1: 7 |
| Type           |           0|               1| FALSE   |          2| Que: 42, Mis: 42               |
| Treatment      |           0|               1| FALSE   |          2| non: 42, chi: 42               |

**Variable type: numeric**

| skim\_variable |  n\_missing|  complete\_rate|    mean|      sd|    p0|    p25|    p50|     p75|    p100| hist  |
|:---------------|-----------:|---------------:|-------:|-------:|-----:|------:|------:|-------:|-------:|:------|
| conc           |           0|               1|  435.00|  295.92|  95.0|  175.0|  350.0|  675.00|  1000.0| ▇▂▂▂▂ |
| uptake         |           0|               1|   27.21|   10.81|   7.7|   17.9|   28.3|   37.12|    45.5| ▇▇▅▇▇ |

Plans
-----

It may be that this package will add support for other data types, sets of skimmers, statistics and utilities. Pull requests in these categories are welcome and will be considered on a case by case basis. Contributions should include full documentation and tests.

Please note that the 'skimrExtra' project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By contributing to this project, you agree to abide by its terms.
