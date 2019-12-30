# IMFVPLAC
#
# Label: Where did you get your last flu shot/vaccine?
# Section Name: Influenza
# Module Section Number: 17
# Question Number: 1
# Column: 441-442
# Type of Variable: Num
# SAS Variable Name: IMFVPLAC
# Question Prologue:
# Question: At what kind of place did you get your last flu shot or vaccine?
# Value Value Label Frequency Percentage
# Weighted
# Percentage
# 1 A doctor´s office or health maintenance
# organization (HMO)
# 9,155 42.36 40.54
# 2 A health department 371 1.72 1.93
# 3 Another type of clinic or health center (a
# community health center)
# 1,530 7.08 10.60
# 4 A senior, recreation, or community center 166 0.77 0.48
# 5 A store (supermarket, drug store) 5,927 27.42 21.71
# 6 A hospital (inpatient) 1,453 6.72 9.35
# 7 An emergency room 20 0.09 0.20
# 8 Workplace 2,318 10.72 11.94
# 9 Some other kind of place 426 1.97 1.59
# 10 Received vaccination in Canada/Mexico 22 0.10 0.17
# 11 A school 145 0.67 1.09
# 77 Don’t know / Not sure—Probe: 62 0.29 0.21
# 99 Refused 19 0.09 0.20


library(tidyverse)
library(lubridate)
library(foreign)
library(labelled)
library(usethis)
library(devtools)

#------------------------------------------------------------------------------------#
#  Bringing in Data
#------------------------------------------------------------------------------------#

### 2016


flu2016_0<-c(6,28,29,31)
flu2016_1<-c(9,25)
flu2016_2<-c(48)

flu_2016_0<-read.xport("data-raw/LLCP2016.XPT")
flu_2016_0 <- flu_2016_0 %>%
  filter(X_STATE %in% flu2016_0) %>%
  mutate(YEAR=2016,
         VERSION_flu="X_LLCPWT",
         flu_wt_raw=X_LLCPWT,
         SEQNO=as.integer(SEQNO))

flu_2016_1<-read.xport("data-raw/LLCP16V1.XPT")
flu_2016_1 <- flu_2016_1 %>%
  filter(X_STATE %in% flu2016_1) %>%
  mutate(YEAR=2016,
         VERSION_flu="X_LCPWTV1",
         flu_wt_raw=X_LCPWTV1,
         SEQNO=as.integer(SEQNO))

flu_2016_2<-read.xport("data-raw/LLCP16V2.XPT")
flu_2016_2 <- flu_2016_2 %>%
  filter(X_STATE %in% flu2016_2) %>%
  mutate(YEAR=2016,
         VERSION_flu="X_LCPWTV2",
         flu_wt_raw=X_LCPWTV2,
         SEQNO=as.integer(SEQNO))

list2016<-list(flu_2016_0, flu_2016_1,flu_2016_2)
data_2016<-bind_rows(list2016)
rm(flu_2016_0, flu_2016_1, flu_2016_2,list2016)

### 2017

flu2017_0<-c(5,6,28,33,45,48,54)
flu2017_1<-c(9,25)

flu_2017_0<-read.xport("data-raw/LLCP2017.XPT")
flu_2017_0 <- flu_2017_0 %>%
  filter(X_STATE %in% flu2017_0) %>%
  mutate(YEAR=2017,
         VERSION_flu="X_LLCPWT",
         flu_wt_raw=X_LLCPWT,
         SEQNO=as.integer(SEQNO))

flu_2017_1<-read.xport("data-raw/LLCP17V1.XPT")
flu_2017_1 <- flu_2017_1 %>%
  filter(X_STATE %in% flu2017_1) %>%
  mutate(YEAR=2017,
         VERSION_flu="X_LCPWTV1",
         flu_wt_raw=X_LCPWTV1,
         SEQNO=as.integer(SEQNO))


list2017<-list(flu_2017_0, flu_2017_1)
data_2017<-bind_rows(list2017)
rm(flu_2017_0, flu_2017_1,list2017)


### COMBINING 2016-2017
brfss_flu<-bind_rows(data_2017,data_2016)

### Labeling State indicators
flustates<-c(5,6,9,25,28,29,31,33,45,48,54)
flustatelabel<-c("AR","CA","CT","MA","MS","MO","NE","NH","SC","TX", "WV")
brfss_flu$state<-factor(brfss_flu$X_STATE, levels=flustates, labels=flustatelabel)
#table(brfss_flu$IMFVPLAC)

#------------------------------------------------------------------------------------#
# Cleaning Variables
#------------------------------------------------------------------------------------#
## Sexual / Gender Minority Status
brfss_flu <- brfss_flu %>%
  mutate(
    fluvac_plcat_num=as.numeric(if_else(IMFVPLAC %in% 1:11, IMFVPLAC, NA_real_)),
    fluvac_plcat_fct=as.factor(if_else(IMFVPLAC==1, "Dr. Office",
                              if_else(IMFVPLAC==2, "Health Department",
                              if_else(IMFVPLAC==3, "Health Center",
                              if_else(IMFVPLAC==4, "Community Center",
                              if_else(IMFVPLAC==5, "Store",
                              if_else(IMFVPLAC==6, "Hospital",
                              if_else(IMFVPLAC==7, "Emergency Room",
                              if_else(IMFVPLAC==8, "Workplace",
                              if_else(IMFVPLAC==9, "Other Place",
                              if_else(IMFVPLAC==10, "Other Country",
                              if_else(IMFVPLAC==11, "School",
                              if_else(IMFVPLAC %in% 77:99, "DK/Refused", NA_character_
                                       ))))))))))))),
    fluvac_pl5cat_fct=as.factor(if_else(IMFVPLAC==1, "Dr. Office",
                              if_else(IMFVPLAC %in% c(2,3,6,7), "Other Health Setting",
                              if_else(IMFVPLAC==5, "Store",
                              if_else(IMFVPLAC==8, "Workplace",
                              if_else(IMFVPLAC %in% c(4,9,10,11,77,99), "Other", NA_character_
                                       )))))),
    fluvac_allcat_fct=as.factor(if_else(FLUSHOT6 %in% c(2,7,9), "No Vaccine",
                                if_else(FLUSHOT6==1 & (is.na(IMFVPLAC) | IMFVPLAC %in% 77:99), "Vaccine Place Unknown",
                              if_else(IMFVPLAC==1, "Dr. Office",
                              if_else(IMFVPLAC %in% c(2,3,6,7), "Other Health Setting",
                              if_else(IMFVPLAC==5, "Store",
                              if_else(IMFVPLAC==8, "Workplace",
                              if_else(IMFVPLAC %in% c(4,9,10,11), "Other", NA_character_
                                       ))))))))
    ) %>%
  rename_all(tolower) %>%
  select(fluvac_plcat_num,fluvac_plcat_fct,fluvac_pl5cat_fct,fluvac_allcat_fct, x_state,state,year,seqno,x_psu,x_ststr,flu_wt_raw,version_flu)

# Setting Reference Groups: LGB vs. (reference) Heterosexual
brfss_flu$fluvac_plcat_fct<-relevel(factor(brfss_flu$fluvac_plcat_fct), ref="Dr. Office")
brfss_flu$fluvac_pl5cat_fct<-relevel(factor(brfss_flu$fluvac_pl5cat_fct), ref="Dr. Office")

#save(brfss_sgm, file = "data/brfss_sgm.rda", compress = "bzip2", version=2)
use_data(brfss_flu, overwrite = TRUE,compress = "bzip2")


