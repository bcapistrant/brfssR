#' BRFSS Cognitive Decline Module Data
#'
#' BRFSS Cognitive Decline Module Questions asked from 2015-2017
#' \url{https://www.cdc.gov/aging/pdf/2015-brfss-cognitive-decline-module.pdf}.

#' @format A "long" data frame with rows of individual BRFSS respondents in a given state and year and the following column variables:
#' \describe{
#'   \item{cog_mem_d_fct}{Dichotomous, Factor: 0/1 (No/Yes) for raw variable CIMEMLOS: During the past 12 months, have you experienced confusion or memory loss that is happening more often or is getting worse? No/Yes}
#'   \item{cog_mem_d_num}{Dichotomous, Numeric: 0/1 for raw variable CIMEMLOS: During the past 12 months, have you experienced confusion or memory loss that is happening more often or is getting worse?}
#'   \item{cog_hous_cat_fct}{Categorical, Factor: Always, Usually, Sometimes, Rarely, Never for raw variable CDHOUSE - During the past 12 months, as a result of confusion or memory loss, how often have you given up day-to-day household activities or chores you used to do, such as cooking, cleaning, taking medications, driving, or paying bills?}
#'   \item{cog_hous_d_fct}{Dichotomous, Factor: Sometimes + (Always, Usually, Sometimes) or Rarely/Never for raw variable CDHOUSE - During the past 12 months, as a result of confusion or memory loss, how often have you given up day-to-day household activities or chores you used to do, such as cooking, cleaning, taking medications, driving, or paying bills?}
#'   \item{cog_asst_cat_fct}{Categorical, Factor: Always, Usually, Sometimes, Rarely, Never for raw variable for raw variable CDASSIST - As a result of confusion or memory loss, how often do you need assistance with these day-to-day activities?}
#'   \item{cog_asst_d_fct}{Dichotomous, Factor: Sometimes + (Always, Usually, Sometimes) or Rarely/Never for raw variable for raw variable CDASSIST - As a result of confusion or memory loss, how often do you need assistance with these day-to-day activities?}
#'   \item{cog_help_cat_fct}{Categorical, Factor: Always, Usually, Sometimes, Rarely, Never for raw variable for raw variable CDHELP - When you need help with these day-to-day activities, how often are you able to get the help that you need?}
#'   \item{cog_help_cat_fct2}{Categorical, Factor: Always, Usually, Sometimes, Rarely, Never or Never Need (which keeps those who don't need help in their own category rather than as NA in cog_help_cat_fct) for raw variable for raw variable CDHELP - When you need help with these day-to-day activities, how often are you able to get the help that you need?}
#'   \item{cog_help_d_fct}{Dichotomous, Factor: Sometimes + (Always, Usually, Sometimes) or Rarely/Never for raw variable for raw variable CDHELP - When you need help with these day-to-day activities, how often are you able to get the help that you need?}
#'   \item{cog_social_cat_fct}{Categorical, Factor: Always, Usually, Sometimes, Rarely, Never for raw variable for raw variable CDSOCIAL - During the past 12 months, how often has confusion or memory loss interfered with your ability to work, volunteer, or engage in social activities outside the home?}
#'   \item{cog_social_cat_fct2}{Categorical, Factor: Always, Usually, Sometimes, Rarely, Never or Never Need (which keeps those who don't need help in their own category rather than as NA in cog_social_cat_fct) for raw variable for raw variable CDSOCIAL - During the past 12 months, how often has confusion or memory loss interfered with your ability to work, volunteer, or engage in social activities outside the home?}
#'   \item{cog_social_d_fct}{Dichotomous, Factor: Sometimes + (Always, Usually, Sometimes) or Rarely/Never for raw variable for raw variable CDSOCIAL - During the past 12 months, how often has confusion or memory loss interfered with your ability to work, volunteer, or engage in social activities outside the home?}
#'   \item{cog_dscs_d_fct}{Dichotomous, Factor: No/Yes for raw variable CDDISCUS: Have you or anyone else discussed your confusion or memory loss with a health care professional?}
#'   \item{cog_dscs_d_num}{Dichotomous, Numeric: 0/1 for raw variable CDDISCUS: Have you or anyone else discussed your confusion or memory loss with a health care professional?}
#'   \item{x_state}{numeric variable of state}
#'   \item{state}{state FIPS code, labeled with state alphabetic abbreviation}
#'   \item{seqno}{identificaiton variable}
#'   \item{year}{Numeric year: 2014-2017}
#'   \item{x_psu}{Primary Sampling Unit Variable}
#'   \item{x_ststr}{Sampling Strata Variable}
#'   \item{cog_wt_raw}{Original,raw sampling weight: 2014-2017}
#'   \item{version_cog}{Character, Version of data: Core (X_LLCPWT), V1 (X_LCPWTV1), V2(X_LCPWTV2), V3 (X_LCPWTV3)}
#' }
#' @source BRFSS Annual Survey Data \url{https://www.cdc.gov/brfss/annual_data/annual_data.htm}.
#' @examples
#' # To adjust the sampling weight (cog_wt_raw) by dividing
#' # the sampling weight by the number of instances a state
#' # is in the data, run:
#' library(tidyverse)
#' data(brfss_cog)
#' waves<-brfss_cog %>%
#'   filter(year %in% 2016:2017) %>% #keeping only 2016-2017 for illustration
#'   group_by(year,state) %>%
#'   slice(1) %>% #keeping the first observation of each state + year
#'   ungroup() %>%
#'   group_by(state) %>% #grouping by state
#'   count() %>% #counting how many years the state was included
#'   rename(wave=n) #renaming as wave

#' brfss_cog<-full_join(brfss_cog,waves,by="state") %>%
#'   mutate(cog_wt_adj = cog_wt_raw/wave) #adjusting the weight by number of waves
"brfss_cog"
