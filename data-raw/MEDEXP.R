library(tidyverse)
library(lubridate)
library(foreign)
library(usethis)
library(devtools)
library(readr)

medicaid_expansion_2020 <- read_csv("data-raw/medicaid_expansion_2020.csv")

brfss_medexp <- medicaid_expansion_2020 %>%
  select(x_state = FIPS, state = Abbrev, medexp_status_fct = `Adoption Status`,
         medexp_year = `Year Implemented` , medexp_date = `Full Date Implemented`)

use_data(brfss_medexp, overwrite = TRUE,compress = "bzip2")
