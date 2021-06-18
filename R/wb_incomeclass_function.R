#' World Bank Income Classification function
#'
#' This function allows you to get World Bank's historical income classifications
#' @param country Select countries by specifying country code. For example, to get classifications for India, type country = "IND". If you'd like multiple countries, type all country codes in c() function. Defaults to "all". "all" will give classification for all countries. To identify countrycodes, run the following code: d <- displaycountrylist().
#' @param startyear To specify a range of years, you'll use startyear to specify the first year from which you want classifications. Defaults to "first". "first" gives the first available year for classifications. The first year of available classifications is 1987.
#' @param endyear To specify a range of years, you'll use endyear to specify the latest year till which you want classifications. Defaults to "last". "last" gives the most recent year available for classifications. Before July 1, the most recent classification available will be 2 years prior to today. After July 1, the most recent classification available will be 1 year prior to today.
#' @param group Select income group by specifying names of income groups "High income", "Upper middle income", "Lower middle income" and "Low income". For example, to get all countries in the "High income" category, type group = "High income". If you'd like multiple income groups, type all income groups in c() function. Defaults to "all". "all" will give classification for all countries across all income groups.
#' @keywords income classification
#' @export
#' @examples dataiwant <- wbincomeclass(country = c("IND", "PAK", "BGD"), startyear = 1995, endyear = 2012)
#' @examples dataimightwant <- wbincomeclass(country = "all", startyear = "first", endyear = "last")
#' @examples dataiwillneed <- wbincomeclass(country = "FRA", startyear = "first", endyear = 2012)
#' @examples df <- wbincomeclass(startyear = 1995, endyear = 1995, group = c("High income", "Low income"))
#' wbincomeclass()

wbincomeclass <- function(country = "all", startyear = "first", endyear = "last", group = "all") {

# income_class <- readxl::read_excel("C:/Users/wb482273/OneDrive - WBG/Income Classifications/OGHIST-revised.xlsx",
#  sheet = "Historical classifications")
 # hist <- usethis::use_data(income_class)
   hist <- income_class

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

   if (group == "all") {

     group <- unique(hist[["income_group"]])

   }

    hist <- hist[hist$datayear <= endyear & hist$datayear >= startyear & hist$wb_code %in% country & hist$income_group %in% group,]

}
