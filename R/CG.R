#' BRFSS Caregiver (CG) Module Data
#'
#' BRFSS Caregiving Module Questions asked from 2015-2017
#' \url{https://www.cdc.gov/aging/healthybrain/brfss-faq-caregiver.htm}.
#'
#' @format A "long" data frame with XX rows of individual BRFSS respondents in a given state and year and YY column variables:
#' \describe{
#'   \item{cg_d_num}{indicator, numeric variable of whether respondent was Caregiver (cg_d_num=1) or not (cg_d_num=0)}
#'   \item{cg_d_fct}{indicator, factor variable of whether respondent was Caregiver (cg_d_fct="CG") or not (cg_d_fct="Non-CG")}
#'   \item{state}{state FIPS code, labeled with state alphabetic abbreviation}
#'   \item{seqno}{identificaiton variable}
#'   \item{year}{Numeric year, 2014-2017}
#'   \item{sgm_wt_raw}{Original, raw sampling weight: 2014-2017}
#' }
#' @source BRFSS Annual Survey Data \url{https://www.cdc.gov/brfss/annual_data/annual_data.htm}.
#' @examples
#' # To adjust the sampling weight (cg_wt_adj) by dividing the
#' # sampling weight (cg_wt_raw) by the number of instances
#' # a state is in the data, run:
#' library(tidyverse)
#' data(brfss_cg)
#' waves<-brfss_cg %>%
#'   filter(year %in% 2016:2017) %>% #keeping only 2016-2017 for illustration
#'   group_by(year,state) %>%
#'   slice(1) %>% #keeping the first observation of each state + year
#'   ungroup() %>%
#'   group_by(state) %>% #grouping by state
#'   count() %>% #counting how many years the state was included
#'   rename(wave=n) #renaming as wave

#' brfss_cg<-full_join(brfss_cg,waves,by="state") %>%
#'   mutate(cg_wt_adj = cg_wt_raw/wave) #adjusting the weight by number of waves
"brfss_cg"
