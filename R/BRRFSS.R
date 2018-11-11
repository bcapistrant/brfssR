#' BRFSS Demographic, Socioeconomic, Health Care, Status and Behaviors Data
#'
#' @format A "long" data frame with rows of individual BRFSS respondents in a given state and year and the following column variables:
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
#' # To adjust the sampling weight (emspt_wt_raw) by dividing the sampling weight by the number of instances a state is in the data, run:
#' library(dplyr)
#' library(tidyr)
#' var_data_stateyears <- brrfss_covariates %>%
#'   filter(year %in% 2016:2017) %>%
#'   mutate(wave = count(state, year),
#'        var_wt_adj = var_wt_raw/wave
#'   )
"brrfss_core"
