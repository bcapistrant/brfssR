library(tidyverse)
library(lubridate)
library(foreign)
library(labelled)
library(usethis)
library(devtools)

#------------------------------------------------------------------------------------#
#  Bringing in Data
#------------------------------------------------------------------------------------#
### 2014
sgm2014_0<-c(10,15,16,18,19,
             20,21,22,24,27,
             30,32,36,39,42,
             50,51,55,56,66)

SGM_2014_0<-read.xport("data-raw/LLCP2014.XPT")
data_2014 <- SGM_2014_0 %>%
  filter(X_STATE %in% sgm2014_0) %>%
  mutate(YEAR=2014,
         VERSION_SGM="X_LLCPWT",
         sgm_wt_raw=X_LLCPWT,
         SEQNO=as.integer(SEQNO))
rm(SGM_2014_0)

### 2015
sgm2015_0<-c(8,9,10,13,15,16,17,
             18,19,20,24,27,29,32,
             36,39,42,48,50,54,55)
sgm2015_1<-19

SGM_2015_0<-read.xport("data-raw/LLCP2015.XPT")
SGM_2015_0 <- SGM_2015_0 %>%
  filter(X_STATE %in% sgm2015_0) %>%
  mutate(YEAR=2015,
         VERSION_SGM="X_LLCPWT",
         sgm_wt_raw=X_LLCPWT,
         SEQNO=as.integer(SEQNO))

SGM_2015_1<-read.xport("data-raw/LLCP15V1.XPT")
SGM_2015_1 <- SGM_2015_1 %>%
  filter(X_STATE %in% sgm2015_1) %>%
  mutate(YEAR=2015,
         VERSION_SGM="X_LCPWTV1",
         sgm_wt_raw=X_LCPWTV1,
         SEQNO=as.integer(SEQNO))

list2015<-list(SGM_2015_0, SGM_2015_1)
data_2015<-bind_rows(list2015)
rm(SGM_2015_0, SGM_2015_1, list2015)

### 2016

sgm2016_0<-c(6,9,10,13,15,
             16,17,18,19,21,
             22,25,27,28,29,
             32,36,39,42,44,
             48,50,51,53,55,66)

SGM_2016_0<-read.xport("data-raw/LLCP2016.XPT")
data_2016 <- SGM_2016_0 %>%
  filter(X_STATE %in% sgm2016_0) %>%
  mutate(YEAR=2016,
         VERSION_SGM="X_LLCPWT",
         sgm_wt_raw=X_LLCPWT,
         SEQNO=as.integer(SEQNO))
rm(SGM_2016_0)

### 2017

sgm2017_0<-c(6,9,10,12,13,15,17,
             18,19,22,25,27,28,30,
             32,36,37,39,40,42,44,
             45,48,50,51,53,55,66)

SGM_2017_0<-read.xport("data-raw/LLCP2017.XPT")
data_2017<- SGM_2017_0 %>%
  filter(X_STATE %in% sgm2017_0) %>%
  mutate(YEAR=2017,
         VERSION_SGM="X_LLCPWT",
         sgm_wt_raw=X_LLCPWT,
         SEQNO=as.integer(SEQNO))
rm(SGM_2017_0)

### 2018

# states administered SOGI Module in 2018: Arizona(V2), Connecticut, Delaware, Florida, Guam, Hawaii,
### Idaho, Illinois, Kansas, Louisiana, Maryland, Minnesota, Mississippi, Missouri, Montana,
### Nevada, New York, North Carolina, Ohio, Oklahoma, Pennsylvania, Rhode Island, South Carolina,
### Tennessee, Texas, Vermont, Virginia, Washington, West Virginia, Wisconsin

sgm2018_0 <- c(9, 10, 12, 66, 15, 16,
               17, 20, 22, 24, 27, 28,
               29, 30, 32, 36, 37, 39,
               40, 42, 44, 45, 47, 48,
               50, 51, 53, 54, 55)

sgm2018_2 <- c(4)

SGM_2018_0 <- read.xport("data-raw/LLCP2018.XPT")
SGM_2018_2 <- read.xport("data-raw/LLCP18V2.XPT")

data_2018_0<- SGM_2018_0 %>%
  filter(X_STATE %in% sgm2018_0) %>%
  mutate(YEAR=2018,
         VERSION_SGM="X_LLCPWT",
         sgm_wt_raw=X_LLCPWT,
         SEQNO=as.integer(SEQNO))
rm(SGM_2018_0)
data_2018_2<- SGM_2018_2 %>%
  filter(X_STATE %in% sgm2018_2) %>%
  mutate(YEAR=2018,
         VERSION_SGM="X_LLCPWT2",
         sgm_wt_raw=X_LLCPWT2,
         SEQNO=as.integer(SEQNO))
rm(SGM_2018_2)

data_2018 <- bind_rows(data_2018_0, data_2018_2)

# recode 2018 sexual orientation vars (delivered seperately for men and women)
## NOTE: coded to match 2017 levels
### in 2018, SXORIENT is two variables, SOMALE and SOFEMALE
### in 2017, 1 is straight and 2 is gay, opposite in 2018

data_2018 <- data_2018 %>%
  mutate(SXORIENT = ifelse(is.na(SOMALE) == FALSE, SOMALE, SOFEMALE)) %>%
  mutate(SXORIENT = ifelse(SXORIENT == 1, 2,
                           ifelse(SXORIENT == 2, 1, SXORIENT)))

### COMBINING 2014-2018
brfss_sgm<-bind_rows(data_2018,data_2017,data_2016,data_2015,data_2014)

### Labeling State indicators
sgmstates<-c(4,6,8,9,10,12,13,15,
             16,17,18,19,20,21,22,
             24,25,27,28,29,30,32,
             36,37,39,40,42,44,45,47,
             48,50,51,53,54,55,56,66)
sgmstatelabel<-c("AZ","CA","CO","CT","DE","FL","GA","HI",
                 "ID","IL","IN","IA","KS","KY","LA",
                 "MD","MA","MN","MS","MO","MT","NV",
                 "NY","NC","OH","OK","PA","RI","SC", "TN",
                 "TX","VT","VA","WA","WV","WI","WY","GU")
brfss_sgm$state<-factor(brfss_sgm$X_STATE, levels=sgmstates, labels=sgmstatelabel)

#------------------------------------------------------------------------------------#
# Cleaning Variables
#------------------------------------------------------------------------------------#
## Sexual / Gender Minority Status
brfss_sgm <- brfss_sgm %>%
  mutate(
    #Sexual and Gender Minority Status
    #Sexual Orientation - Lesbian, Gay, Bisexual vs. Heterosexual
        lgb_d=if_else(SXORIENT==1, 0,
                        if_else(SXORIENT %in% 2:3, 1, NA_real_)),
        lgb_het_d=if_else(SXORIENT==1, 1,
                      if_else(SXORIENT %in% 2:3, 0, NA_real_)),
        lgb_gayles_d=if_else(SXORIENT==2, 1,
                        if_else(SXORIENT %in% c(1,3), 0, NA_real_)),
        lgb_bi_d=if_else(SXORIENT==3, 1,
                           if_else(SXORIENT %in% 1:2, 0, NA_real_)),
        lgb_cat=as.factor(if_else(SXORIENT==1, "Heterosexual",
                                  if_else(SXORIENT==2, "Gay or Lesbian",
                                  if_else(SXORIENT==3, "Bisexual", NA_character_)))),
    #Gender Minority Identity - Trans* or Gender-non-Conforming vs. Cis-gendered
        genmin_d=if_else(TRNSGNDR %in% 1:3, 1,
                 if_else(TRNSGNDR==4, 0, NA_real_)),
        genmin_fem_d=if_else(TRNSGNDR==1, 1,
                   if_else(TRNSGNDR %in% 2:4, 0, NA_real_)),
        genmin_men_d=if_else(TRNSGNDR==2, 1,
                       if_else(TRNSGNDR %in% c(1,3,4), 0, NA_real_)),
        genmin_gnc_d=if_else(TRNSGNDR==3, 1,
                       if_else(TRNSGNDR %in% c(1,2,4), 0, NA_real_)),
        genmin_cis_d=if_else(TRNSGNDR==4, 1,
                         if_else(TRNSGNDR %in% 1:3, 0, NA_real_)),
        genmin_only_cat=as.factor(if_else(TRNSGNDR==1, "Transgender, Female",
                          if_else(TRNSGNDR==2, "Transgender, Male",
                          if_else(TRNSGNDR==3, "Gender Non Conforming",NA_character_)))),
        genmin_cat=as.factor(if_else(TRNSGNDR==1, "Transgender, Female",
                          if_else(TRNSGNDR==2, "Transgender, Male",
                          if_else(TRNSGNDR==3, "Gender Non Conforming",
                          if_else(TRNSGNDR==4, "Cis-Gender", NA_character_))))),
    #Sexual / Gender Minority - Either LGB or Trans/GNC vs. Cis-gendered Heterosexuals
        sgm_d=if_else(lgb_d==1 | genmin_d==1, 1,
              if_else(lgb_d==0 & genmin_d==0, 0, NA_real_)),
                sgm_sex_cat=as.factor(if_else(TRNSGNDR==4 & SEX == 1 & SXORIENT==1, "Cis_Het_Male",
                                  if_else(TRNSGNDR==4 & SEX == 1 & SXORIENT==2, "Cis_Gay_Male",
                                  if_else(TRNSGNDR==4 & SEX == 1 & SXORIENT==3, "Cis_Bi_Male",
                                  if_else(TRNSGNDR==4 & SEX == 2 & SXORIENT==1, "Cis_Het_Female",
                                  if_else(TRNSGNDR==4 & SEX == 2 & SXORIENT==2, "Cis_Gay_Female",
                                  if_else(TRNSGNDR==4 & SEX == 2 & SXORIENT==3, "Cis_Bi_Female",
                                  if_else(TRNSGNDR==1, "Trans_Female",
                                  if_else(TRNSGNDR==2, "Trans_Male",
                                  if_else(TRNSGNDR==3, "Trans_GNC",NA_character_)))))))))),
            sgm_sex_cat2=as.factor(if_else(TRNSGNDR==4 & SEX == 1 & SXORIENT==1, "Cis_Het_Male",
                                  if_else(TRNSGNDR==4 & SEX == 1 & SXORIENT==2, "Cis_Gay_Male",
                                  if_else(TRNSGNDR==4 & SEX == 1 & SXORIENT==3, "Cis_Bi_Male",
                                  if_else(TRNSGNDR==4 & SEX == 2 & SXORIENT==1, "Cis_Het_Female",
                                  if_else(TRNSGNDR==4 & SEX == 2 & SXORIENT==2, "Cis_Gay_Female",
                                  if_else(TRNSGNDR==4 & SEX == 2 & SXORIENT==3, "Cis_Bi_Female",
                                  if_else(TRNSGNDR %in% 1:3, "Transgender",NA_character_))))))))
  ) %>%
  rename_all(tolower) %>%
  select(sgm_d,sgm_sex_cat,sgm_sex_cat2,
         lgb_d, lgb_het_d, lgb_gayles_d,lgb_bi_d, lgb_cat,
         genmin_d, genmin_fem_d, genmin_men_d,genmin_cis_d,genmin_gnc_d,genmin_only_cat,genmin_cat,
        x_state,state,year,seqno,x_psu,x_ststr,sgm_wt_raw,version_sgm)

# Setting Reference Groups: LGB vs. (reference) Heterosexual
brfss_sgm$lgb_cat<-relevel(factor(brfss_sgm$lgb_cat), ref="Heterosexual")
brfss_sgm$genmin_cat<-relevel(factor(brfss_sgm$genmin_cat), ref="Cis-Gender")

#save(brfss_sgm, file = "data/brfss_sgm.rda", compress = "bzip2", version=2)
use_data(brfss_sgm, overwrite = TRUE,compress = "bzip2")
