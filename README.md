# wbincomeclass (World Bank Income Classification)
This is an R package that allows users to access World Bank's historical income classifications.

## How to install
Please follow these steps:
library(devtools)

install.github("DivyanshiWadhwa/wbincomeclass")

Currently, the package is dependent on 'googlesheets4', so please install this package before use.

## How to use this package
You can access all historical income classifications by typing:
wbincomeclass()

If you want to access historical income classifications for specific years or specific countries, you have three arguments available:
1. country: Select countries by specifying country code. For example, to get classifications for India, type country = "IND". If you'd like multiple countries, type all country codes in c() function. Defaults to "all". "all" will give classification for all countries. To identify countrycodes, run the following code: d <- displaycountrylist().
2. startyear: To specify a range of years, you'll use startyear to specify the first year from which you want classifications. Defaults to "first". "first" gives the first available year for classifications. The first year of available classifications is 1987.
3.  endyear: To specify a range of years, you'll use endyear to specify the latest year till which you want classifications. Defaults to "last". "last" gives the most recent year available for classifications. Before July 1, the most recent classification available will be 2 years prior to today. After July 1, the most recent classification available will be 1 year prior to today.

## Examples
To get income classifications for India, Pakistan, Bangladesh starting in 1995 and ending in 2012:
dataiwant <- wbincomeclass(country = c("IND", "PAK", "BGD"), startyear = 1995, endyear = 2012)

To get income classifications for all countries from the first year when income classifications are available (1987) to the most recent:
dataimightwant <- wbincomeclass(country = "all", startyear = "first", endyear = "last")

To get income classifications for France from the first year when income classifications are available (1987) till 2012:
dataiwillneed <- wbincomeclass(country = "FRA", startyear = "first", endyear = 2012)

To get income classifications for all countries for the year 2015
dataforoneyear <- wbincomeclass(country = "all", startyear = 2012, endyear = 2012)
