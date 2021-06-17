#' World Bank Income Classification function
#'
#' This function allows you to get World Bank's historical income classifications
#' @param country Select countries by specifying country code. For example, to get classifications for India, type country = "IND". If you'd like multiple countries, type all country codes in c() function. Defaults to "all". "all" will give classification for all countries. To identify countrycodes, run the following code: d <- displaycountrylist().
#' @param startyear To specify a range of years, you'll use startyear to specify the first year from which you want classifications. Defaults to "first". "first" gives the first available year for classifications. The first year of available classifications is 1987.
#' @param endyear To specify a range of years, you'll use endyear to specify the latest year till which you want classifications. Defaults to "last". "last" gives the most recent year available for classifications. Before July 1, the most recent classification available will be 2 years prior to today. After July 1, the most recent classification available will be 1 year prior to today.
#' @keywords income classification
#' @export
#' @examples dataiwant <- wbincomeclass(country = c("IND", "PAK", "BGD"), startyear = 1995, endyear = 2012)
#' @examples dataimightwant <- wbincomeclass(country = "all", startyear = "first", endyear = "last")
#' @examples dataiwillneed <- wbincomeclass(country = "FRA", startyear = "first", endyear = 2012)
#' wbincomeclass()

wbincomeclass <- function(country = "all", startyear = "first", endyear = "last") {

 # income_class <- readxl::read_excel("data/OGHIST-revised.xlsx", sheet = "Historical classifications")
 # hist <- usethis::use_data(income_class)
   hist <- income_class
 # hist <- googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1ose4ar0k3Bfty_fLwYcOfIBKsYv_3GAqiJD41swczOA/edit#gid=744413969")

#  newcache <- wbstats::wb_cache()
#  countries_df <- newcache$countries
#  countries <- countries_df[countries_df$region != "Aggregates",]
  countrylist <- unique(hist[["wb_code"]])

  if (country == "all") {

    country <- countrylist

  }

  if (startyear == "first") {

    startyear <- 1987

  }

  if (endyear == "last") {

    endyear <- format(Sys.Date(), "%Y")

  }

    hist <- hist[hist$datayear <= endyear & hist$datayear >= startyear & hist$wb_code %in% country,]

}
