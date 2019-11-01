#' BRFSS Demographic, Socioeconomic, Health Care, Status and Behaviors Data
#'
#' @format A long data frame with rows of individual BRFSS respondents in a given state and year and the following column variables:
#' \describe{
#'   \item{age_num}{numeric, quantiative	18-99}
#'   \item{age_cat}{factor, categorical	5-year age categories (18-24, 25-29,…95-99)}
#'   \item{millennial_d_num}{numeric, dichotomous	1/0}
#'   \item{millennial_d_fct}{factor, dichotomous	Yes/No}
#'   \item{agege45_d_num}{numeric, dichotomous	1/0}
#'   \item{agege45_d_fct}{factor, dichotomous	Yes/No}
#'   \item{agege65_d_num}{numeric, dichotomous	1/0}
#'   \item{agege65_d_fct}{factor, dichotomous	Yes/No}
#'   \item{mstat_cat_fct}{factor, categorical	Married, Divorced, Widowed, Separated, Never Married, Coupled}
#'   \item{mstat_cat_fct}{factor, categorical	Married, Divorced, Widowed, Separated, Never Married, Coupled}
#'   \item{chld_num}{numeric, quantiative	0-87}
#'   \item{chld_cat_fct}{factor, categorical	None, One, Two or More}
#'   \item{race_cat_fct}{factor, categorical	White only, Black or African American only,  American Indian or Alaskan Native only,Asian only,  Native Hawaiian or other Pacific Islander only,Other race only,Multiracial}]
#'   \item{ethn_cat_fct}{factor, categorical	Hispanic, Non-Hispanic}
#'   \item{raceth_cat_fct}{factor, categorical	White Non-Hispanic; Black, Non-Hispanic;  Other, Non-Hispanic; Multiple, Non-Hispanic; Hispanic}
#'   \item{sex_d_fct}{factor, dichotomous	female/male}
#'   \item{fem_d_num}{numeric, dichotomous	0/1 (male/female)}
#'   \item{vtrn_d_num}{numeric, dichotomous	0/1 (Non-Vet/Veteran)}
#'   \item{vtrn_d_fct}{factor, dichotomous	Non-Veteran, Veteran}
#'   \item{msa_cat_fct}{factor, categorical	City_Center, City_County, Suburb, Outside MSA}
#'   \item{msa_d_fct}{factor, dichotomous	Yes/No}
#'   \item{drnkbng_d_fct}{factor, dichotomous	Yes/No}
#'   \item{drnkhvy_d_fct}{factor, dichotomous	Yes/No}
#'   \item{bmi_cat_fct}{factor, categorical	Underweight, Normal Weight, Overweight, Obese, Unkown}
#'   \item{hiv_d_num}{numeric, dichotomous	0/1 (No/Yes)}
#'   \item{hiv_d_fct}{factor, dichotomous	Yes/No}
#'   \item{fluvac_d_fct}{factor, dichotomous	Yes/No}
#'   \item{fluvac_d_num}{numeric, dichotomous	0/1 (No/Yes)}
#'   \item{fluvac_date_num}{numeric, date	12-20-15 - 12-20-16}
#'   \item{ltpa_d_fct}{factor, dichotomous	Yes/No}
#'   \item{smk_cat_fct}{factor, categorical	Current smoker, Former smoker, Never smoker}
#'   \item{drcost_d_fct}{factor, dichotomous	Yes/No}
#'   \item{hcplan_d_fct}{factor, dichotomous	Yes/No}
#'   \item{chckup_cat_fct}{factor, categorical	<1 year, 1-2 years, 2-5 years, 5+ years, Never}
#'   \item{dntst_cat_fct}{factor, categorical	<1 year, 1-2 years, 2-5 years, 5+ years, Never}
#'   \item{chron_num}{numeric, quantiative	0-7}
#'   \item{chron_d_fct}{factor, dichotomous	Yes/No}
#'   \item{cvd_d_num}{numeric, dichotomous	0/1 (No/Yes)}
#'   \item{strk_d_num}{numeric, dichotomous	0/1 (No/Yes)}
#'   \item{diab_d_num}{numeric, dichotomous	0/1 (No/Yes)}
#'   \item{asth_d_num}{numeric, dichotomous	0/1 (No/Yes)}
#'   \item{arth_d_num}{numeric, dichotomous	0/1 (No/Yes)}
#'   \item{copd_d_num}{numeric, dichotomous	0/1 (No/Yes)}
#'   \item{cncr_d_num}{numeric, dichotomous	0/1 (No/Yes)}
#'   \item{dep_d_fct}{factor, dichotomous	No/Yes}
#'   \item{mentqol_num}{numeric, quantitative, 0-30}
#'   \item{mentqol14_d_num}{numeric, dichotomous	0/1 (No/Yes)}
#'   \item{mentqol14_d_fct}{factor, dichotomous	No/Yes}
#'   \item{physqol_num}{numeric, quantitative, 0-30}
#'   \item{physqol14_d_num}{numeric, dichotomous	0/1 (No/Yes)}
#'   \item{physqol14_d_fct}{factor, dichotomous	No/Yes}
#'   \item{srh_d_fct}{factor, dichotomous: Good+ vs. Fair/Poor}
#'   \item{srh_cat_fct}{factor, categorical: Excellent, Very Good, Good, Fair, Poor}
#'   \item{empl_cat_fct}{factor, categorical: Out of work, Employed for wages, Self-employed,A homemaker, A student, Retired, Unable to work}
#'   \item{inc_cat_fct}{factor, categorical: <$10,000, $10,000-$14,999, $15,000-19,999, $20,000-$24,999,$25,000-34,999, $35,000-$49,999,$50,000-74,999, $75,000+,Don't know or refused}
#'   \item{educ_cat_fct}{factor, categorical:<High School,High School,Some College,College or More}
#'   \item{x_state}{numeric variable of state}
#'   \item{state}{state FIPS code, labeled with state alphabetic abbreviation}
#'   \item{seqno}{identificaiton variable}
#'   \item{year}{Numeric year: 2014-2017}
#'   \item{x_psu}{Primary Sampling Unit Variable}
#'   \item{x_ststr}{Sampling Strata Variable}
#'   \item{var_wt_raw}{Original,raw sampling weight: 2014-2017}
#'   \item{version_var}{Character, Version of data: Core (X_LLCPWT), V1 (X_LCPWTV1), V2(X_LCPWTV2), V3 (X_LCPWTV3)}
#' }
#' @source BRFSS Annual Survey Data \url{https://www.cdc.gov/brfss/annual_data/annual_data.htm}.
#' @examples
#' # To adjust the sampling weight (var_wt_raw) by dividing
#' # the sampling weight by the number of instances a state
#' # is in the data, run:
#' library(tidyverse)
#' data(brfss_core)
#' waves<-brfss_core %>%
#'   filter(year %in% 2016:2017) %>% #keeping only 2016-2017 for illustration
#'   group_by(year,state) %>%
#'   slice(1) %>% #keeping the first observation of each state + year
#'   ungroup() %>%
#'   group_by(state) %>% #grouping by state
#'   count() %>% #counting how many years the state was included
#'   rename(wave=n) #renaming as wave

#' brfss_core<-full_join(brfss_core,waves,by="state") %>%
#'   mutate(var_wt_adj = var_wt_raw/wave) #adjusting the weight by number of waves
"brfss_core"
