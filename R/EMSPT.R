#' BRFSS Emotional Support (EmSpt) and Life Satisfaction Data
#'
#' @format A "long" data frame with rows of individual BRFSS respondents in a given state and year and YY column variables:
#' \describe{
#'   \item{emsup_d_fct}{factor, dichotomous	Sometimes+, Rarely/Never}
#'   \item{emsup_cat_fct}{factor, categorical	Always, Usually, Sometimes, Rarely, Never}
#'   \item{lsat_d_fct}{	factor, dichotomous	Satisfied/Dissatisfied}
#'   \item{lsat_cat_fct}{	factor, categorical	Very Satisfied, Satisfied, Dissatisfied, Very Dissatisfied}
#'   \item{x_state}{numeric variable of state}
#'   \item{state}{state FIPS code, labeled with state alphabetic abbreviation}
#'   \item{seqno}{identificaiton variable}
#'   \item{year}{Numeric year: 2014-2017}
#'   \item{x_psu}{Primary Sampling Unit Variable}
#'   \item{x_ststr}{Sampling Strata Variable}
#'   \item{emspt_wt_raw}{Original,raw sampling weight: 2014-2017}
#'   \item{version_emspt}{Character, Version of data: Core (X_LLCPWT), V1 (X_LCPWTV1), V2(X_LCPWTV2), V3 (X_LCPWTV3)}
#' }
#' @source BRFSS Annual Survey Data \url{https://www.cdc.gov/brfss/annual_data/annual_data.htm}.
#' @examples
#' # To adjust the sampling weight (emspt_wt_raw) by dividing the sampling weight by the number of instances a state is in the data, run:
#' library(dplyr)
#' library(tidyr)
#' emspt_data_stateyears <- brfss_emspt %>%
#'   filter(year %in% 2016:2017) %>%
#'   mutate(wave = count(state, year),
#'        emspt_wt_adj = emspt_wt_raw/wave
#'   )
"brfss_emspt"
