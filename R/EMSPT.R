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
#' # To adjust the sampling weight (emspt_wt_raw) by dividing the
#' # sampling weight by the number of instances a state is in the data, run:
#' library(tidyverse)
#' data(brfss_emspt)
#' waves<-brfss_emspt %>%
#'   filter(year %in% 2016:2017) %>% #keeping only 2016-2017 for illustration
#'   group_by(year,state) %>%
#'   slice(1) %>% #keeping the first observation of each state + year
#'   ungroup() %>%
#'   group_by(state) %>% #grouping by state
#'   count() %>% #counting how many years the state was included
#'   rename(wave=n) #renaming as wave

#' brfss_emspt<-full_join(brfss_emspt,waves,by="state") %>%
#'   mutate(emspt_wt_adj = emspt_wt_raw/wave) #adjusting the weight by number of waves
"brfss_emspt"
