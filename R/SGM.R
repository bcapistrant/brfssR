#' BRFSS Sexual and Gender Minority (SGM) Data
#'
#' BRFSS Sexual and Gender Minority Questions asked from 2014-2017
#' \url{https://www.cms.gov/About-CMS/Agency-Information/OMH/resource-center/hcps-and-researchers/data-tools/sgm-clearinghouse/brfss.html}.
#'
#' @format A "long" data frame with XX rows of individual BRFSS respondents in a given state and year and YY column variables:
#' \describe{
#'   \item{sgm_d}{indicator, numeric variable of whether respondent was SGM (sgm_d=1) or not (sgm_d=0)}
#'   \item{lgb_cat}{categorical, factor variable of respondent's sexual orientation: Lesbian; Gay; Bisexual; or Heterosexual}
#'   \item{lgb_d}{indicator, numeric variable of whether respondent was lesbian, gay, or bisexual (lgb_d=1) or Heterosexual (lgb_d=0)}
#'   \item{lgb_het_d}{indicator, numeric variable of whether respondent was Heterosexual (lgb_het_d=1) or not (lgb_het_d=0)}
#'   \item{lgb_gayles_d}{indicator, numeric variable of whether respondent was Gay or Lesbian (lgb_gayles_d=1) or not (lgb_gayles_d=0)}
#'   \item{lgb_bi_d}{indicator, numeric variable of whether respondent was Bisexual (lgb_bi_d=1) or not (lgb_bi_d=0)}
#'   \item{genmin_cat}{categorical, factor variable of respondent's gender identity: Transgender, Female; Transgender, Gender-Non-Conforming; or Cis-Gendered ("Cis-Gender")}
#'   \item{genmin_d}{indicator, numeric variable of whether respondent was Trans* Female, Male or Gender-Non-Conforming (genmin_d=1) or Cis-Gendered (genmin_d=0)}
#'   \item{genmin_fem_d}{indicator, numeric variable of whether respondent was Trans* Female (genmin_fem_d=1) or not (genmin_fem_d=0)}
#'   \item{genmin_men_d}{indicator, numeric variable of whether respondent was Transgender, Male (genmin_men_d=1) or not (genmin_men_d=0)}
#'   \item{genmin_gnc_d}{indicator, numeric variable of whether respondent was Gender Non Conforming (genmin_gnc_d=1) or not (genmin_gnc_d=0)}
#'   \item{genmin_cis_d}{indicator, numeric variable of whether respondent was Cis-Gender (genmin_cis_d=1) or not (genmin_cis_d=0)}
#'   \item{state}{state FIPS code, labeled with state alphabetic abbreviation}
#'   \item{seqno}{identificaiton variable}
#'   \item{year}{Numeric year, 2014-2017}
#'   \item{sgm_wt_raw}{Original, raw sampling weight: 2014-2017}
#' }
#' @source BRFSS Annual Survey Data \url{https://www.cdc.gov/brfss/annual_data/annual_data.htm}.
#' @examples
#' # To adjust the sampling weight (sgm_wt_adj) by dividing the sampling weight by the number of instances a state is in the data, run:
#' library(dplyr)
#' library(tidyr)
#' sgm_data_stateyears <- sgm_data %>%
#'   filter(year %in% 2016:2017) %>%
#'   mutate(wave = count(state, year),
#'        sgm_wt_adj = sgm_wt_raw/wave
#'   )
"sgm_data"
