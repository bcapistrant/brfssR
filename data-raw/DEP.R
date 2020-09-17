library(tidyverse)
library(lubridate)
library(foreign)
library(usethis)
library(devtools)

### 2018

dep2018_0<-c(41,47,66)
dep2018_1<-c(39)

BRFSS_2018_0 <- read.xport("data-raw/LLCP2018.XPT")
BRFSS_2018_0 <- BRFSS_2018_0 %>%
  filter(X_STATE %in% dep2018_0) %>%
  mutate(YEAR=2018,
         dep_WT_RAW=X_LLCPWT,
         VERSION_dep="X_LLCPWT",
         SEQNO=as.integer(SEQNO))

BRFSS_2018_1<-read.xport("data-raw/LLCP18V1.XPT")
BRFSS_2018_1 <- BRFSS_2018_1 %>%
  filter(X_STATE %in% dep2018_1) %>%
  mutate(YEAR=2018,
         dep_WT_RAW=X_LCPWTV1,
         VERSION_dep="X_LCPWTV1",
         SEQNO=as.integer(SEQNO))

### Adding data sets together
list2018<-list(BRFSS_2018_0, BRFSS_2018_1)

brfss_dep<-bind_rows(list2018)
rm(BRFSS_2018_0, BRFSS_2018_1, list2018)

depstates<-c(39,41,47,66)
depstatelabel<-c("OH","OR","TN","GU")
brfss_dep$state<- factor(brfss_dep$X_STATE, levels=depstates, labels=depstatelabel)


# Data Wrangling: Variables

## Depression / Anxiety Variables & Scoring
# **********************************************************************************************
# ADPLEAS1: Over the last 2 weeks, how often have you been bothered by having little interest or pleasure in doing things. Would you say this happens...
# ADDOWN1: Over the last 2 weeks, how often have you been bothered by feeling down, depressed or hopeless? Would you say this happens…
# FEELNERV: Over the last 2 weeks, how often have you been bothered by feeling nervous, anxious or on edge? Would you say this happens…
# STOPWORY: Over the last 2 weeks, how often have you been bothered by not being able to stop or control worrying? Would you say this happens…
#
# Scoring
# BRFSS Coding for Answers
# 1 Never, 2 for several days, 3 for more than half the days,or 4 nearly every day.
# 7 Don’t know/Not sure; 9 Refused
#
# PHQ-4 total score ranges from 0 to 12, with categories of psychological distress being:
# •	None		0-2
# •	Mild		3-5
# •	Moderate	6-8
# •	Severe	9-12
#
# Anxiety subscale = sum of items FEELNERV & STOPWORY		(score range, 0 to 6)
# Depression subscale = sum of items ADDOWN1 & ADPLEAS1	(score range, 0 to 6)
# On each subscale, a score of 3 or greater is considered positive for screening purposes

# **********************************************************************************************;

phq_level <- c(1,2,3,4,7,9)
phq_label <- c("Never", "Several", "More than Half", "Everyday", NA, NA)

brfss_dep <- brfss_dep %>%
    mutate(
      phq_dep_pls_fct = factor(ADPLEAS1,levels=phq_level, labels=phq_label),
      phq_dep_pls_num = as.numeric(ifelse(ADPLEAS1 > 4, NA, ADPLEAS1-1)),

      phq_dep_dwn_fct = factor(ADDOWN1,levels=phq_level, labels=phq_label),
      phq_dep_dwn_num = as.numeric(ifelse(ADDOWN1 > 4, NA, ADDOWN1-1)),

      phq_anx_nrv_fct = factor(FEELNERV,levels=phq_level, labels=phq_label),
      phq_anx_nrv_num = as.numeric(ifelse(FEELNERV > 4, NA, FEELNERV-1)),

      phq_anx_wry_fct = factor(STOPWORY,levels=phq_level, labels=phq_label),
      phq_anx_wry_num = as.numeric(ifelse(STOPWORY > 4, NA, STOPWORY-1)),

      phq_dep_scale_num = phq_dep_dwn_num + phq_dep_pls_num,
      phq_dep_scale_fct_d = if_else(phq_dep_scale_num>=3, "PHQ 3+: For Screening", "PHQ <3: No Screening"),

      phq_anx_scale_num = phq_anx_nrv_num + phq_anx_wry_num,
      phq_anx_scale_fct_d = if_else(phq_anx_scale_num>=3, "PHQ 3+: For Screening", "PHQ<3: No Screening"),

      phq_tot_scale_num = phq_dep_dwn_num + phq_dep_pls_num + phq_anx_nrv_num + phq_anx_wry_num,
      phq_tot_scale_cat = as.factor(if_else(phq_tot_scale_num %in% 0:2, "None",
                          if_else(phq_tot_scale_num %in% 3:5, "Mild",
                          if_else(phq_tot_scale_num %in% 6:8, "Moderate",
                          if_else(phq_tot_scale_num %in% 9:12, "Severe", NA_character_)))))


    )

 brfss_dep <- brfss_dep %>%
   mutate(indep=1) %>%
   rename_all(tolower) %>%
   select(starts_with("phq_"),
          x_state,state,year,seqno,x_psu,x_ststr,
          dep_wt_raw,version_dep,indep
          )

#save(brfss_cg, file = "data/brfss_cg.rda", compress = "bzip2", version=2)
use_data(brfss_dep, overwrite = TRUE,compress = "bzip2")





