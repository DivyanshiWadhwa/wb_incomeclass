#' World Bank Income Classification function
#'
#' This function allows you to get World Bank's historical income classifications
#' @param country Select countries by specifying country code. For example, to get classifications for India, type country = "IND". If you'd like multiple countries, type all country codes in c() function. Defaults to all. all is a vector of all country codes.
#' @param startyear To specify a range of years, you'll use startyear to specify the first year from which you want classifications. Defaults to first. first is a vector for the first value available for classifications.
#' @param endyear To specify a range of years, you'll use endyear to specify the latest year till which you want classifications. Defaults to last. last is a vector for the most recent value available for classifications.
#' @keywords income classification
#' @export
#' @examples dataiwant <- wb_incomeclass(country = c("IND", "PAK", "BGD"), startyear = first, endyear = 2012)
#' wb_incomeclass()

wb_incomeclass <- function(country = all, startyear = first, endyear = last) {
  
  hist <- googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1ose4ar0k3Bfty_fLwYcOfIBKsYv_3GAqiJD41swczOA/edit#gid=744413969") %>%
    rename(countryname = country,
           date = year)
  
  hist <- data.table::setDT(hist)
  
  first <- min(hist$date)
  last <- max(hist$date)
  all <- unique(hist$wb_code)
  
  data <- hist[date >= startyear & date <= endyear & wb_code %in% country,]
  
  
}