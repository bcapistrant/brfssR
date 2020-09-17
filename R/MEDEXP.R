#' Medicaid Expansion Status and Timing for BRFSS data
#'
#' Medicaid Expansion status from each state was collected from Kaiser Family Foundation (as of August 17, 2020)
#' \url{https://www.kff.org/medicaid/issue-brief/status-of-state-medicaid-expansion-decisions-interactive-map/}.
#' The information captured in this dataframe includes the FIPS code and state abbreviations for merging with BRFSS data.
#' The status of a state's expansion is included as a factor variable. The year of implementation, and the month-day-year of implementation are included.
#'
#' @format A data frame with rows of states as observations and column variables of Medicaid expansion details:
#' \describe{
#'   \item{x_state}{state FIPS code}
#'   \item{state}{state alphabetic abbreviation}
#'   \item{medexp_status_fct}{character variable of Medicaid Expansion Adoption Status: Adopted; Adopted, Not Implemented; Not Adopted}
#'   \item{medexp_year}{numeric variable, 4 digit year of Medication Expansion implementation (for states who adopted and implemented)}
#'   \item{medexp_date}{character variable, Month / Day / Year of Medication Expansion implementation (for states who adopted and implemented)}
#' }
#' @source Kaiser Family Foundation \url{https://www.kff.org/medicaid/issue-brief/status-of-state-medicaid-expansion-decisions-interactive-map/}.
#' @examples
#' # To Merge depression with core data:
#' library(tidyverse)
#' library(brfssR)
#' data(brfss_medexp)
#' data(brfss_core)
#' brfss_expansion<-full_join(brfss_core,brfss_medexp,by="x_state")
"brfss_medexp"
