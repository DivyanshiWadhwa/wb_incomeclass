#' World Bank Income Classification function
#'
#' This function allows you to get World Bank's historical income classifications
#' @param country Select countries by specifying country code. For example, to get classifications for India, type country = "IND". If you'd like multiple countries, type all country codes in c() function. Defaults to all. all is a vector of all country codes. You can find official country codes here: https://unstats.un.org/unsd/tradekb/knowledgebase/country-code.
#' @param startyear To specify a range of years, you'll use startyear to specify the first year from which you want classifications. Defaults to first. first is a vector for the first value available for classifications. The first year of available classifications is 1987.
#' @param endyear To specify a range of years, you'll use endyear to specify the latest year till which you want classifications. Defaults to last. last is a vector for the most recent value available for classifications. Before July 1, the most recent classification available will be 2 years prior. After July, the most recent classification available will be 1 year prior.
#' @keywords income classification
#' @export
#' @examples dataiwant <- wbincomeclass(country = c("IND", "PAK", "BGD"), startyear = 1995, endyear = 2012)
#' @examples data <- wbincomeclass(country = all, startyear = first, endyear = last)
#' @examples data <- wbincomeclass(country = "FRA", startyear = first, endyear = 2012)
#' wbincomeclass()

wbincomeclass <- function(country = "all", startyear = "first", endyear = "last") {

  hist <- googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1ose4ar0k3Bfty_fLwYcOfIBKsYv_3GAqiJD41swczOA/edit#gid=744413969")

  if (country != "all") {

    hist <- hist[hist$wb_code %in% country,]

  } else if (startyear != "first") {

      hist <- hist[hist$datayear >= startyear,]

    } else if (endyear != "last") {

        hist <- hist[hist$datayear <= endyear,]

      } else {

      hist <- hist[hist$datayear <= endyear & hist$datayear >= startyear & hist$wb_code %in% country,]

    }

}
