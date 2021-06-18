#' World Bank Income Classification function
#'
#' This function allows you to get World Bank's historical income classifications
#' @param startyear To specify a range of years, you'll use startyear to specify the first year from which you want the income thresholds. Defaults to "first". "first" gives the first available year for income thresholds. The first year of available income thresholds is 1987.
#' @param endyear To specify a range of years, you'll use endyear to specify the latest year till which you want the income thresholds. Defaults to "last". "last" gives the most recent year available for income thresholds. Before July 1, the most recent thresholds available will be 2 years prior to today. After July 1, the most recent income thresholds available will be 1 year prior to today.
#' @param group Select income group by specifying names of income groups "High income", "Upper middle income", "Lower middle income" and "Low income". For example, to get all countries in the "High income" category, type group = "High income". If you'd like multiple groups, type all income groups in c() function. Defaults to "all". "all" will give income thresholds for all four income groups.
#' @keywords income thresholds
#' @export
#' @examples dataiwant <- wbincomethresh(startyear = 1995, endyear = 2012)
#' @examples dataimightwant <- wbincomethresh(group = c("Low income", "High income), startyear = "first", endyear = "last")
#' @examples dataiwillneed <- wbincomethresh(group = "Low income", startyear = 1995, endyear = 1995)
#' wbincomethresh()

wbincomethresh <- function(startyear = "first", endyear = "last", group = "all") {

  thresh <- income_thresh


  if (startyear == "first") {

    startyear <- 1987

  }

  if (endyear == "last") {

    endyear <- format(Sys.Date(), "%Y")

  }

  if (group == "all") {

    group <- unique(thresh[["income_group"]])

  }

  thresh <- thresh[thresh$datayear <= endyear & thresh$datayear >= startyear & thresh$income_group %in% group,]

}
