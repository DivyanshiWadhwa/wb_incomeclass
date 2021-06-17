#' World Bank Income Country codes
#'
#' This function allows you to get World Bank's country codes and names
#' @keywords country codes
#' @export
#' @examples dataiwant <- displaycountrylist()
#' displaycountrylist()

displaycountrylist <- function() {

  countrylist <- unique(income_class[, c("wb_code", "countryname")])
  countrylist <- countrylist[!is.na(countrylist$wb_code) | !is.na(countrylist$wb_code),]

  return(countrylist)

}
