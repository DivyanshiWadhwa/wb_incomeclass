#' World Bank Income Country codes
#'
#' This function allows you to get World Bank's country codes and names
#' @keywords country codes
#' @export
#' @examples dataiwant <- displaycountrylist()
#' displaycountrylist()

displaycountrylist <- function() {

  newcache <- wbstats::wb_cache()
  countries_df <- newcache$countries
  countries <- countries_df[countries_df$region != "Aggregates",]
  countrylist <- countries[, c("iso3c", "country")]

  return(countrylist)

}
