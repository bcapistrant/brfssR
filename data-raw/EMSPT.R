library(tidyverse)
library(lubridate)
library(foreign)
library(usethis)
library(devtools)

#------------------------------------------------------------------------------------#
#  Bringing in Data
#------------------------------------------------------------------------------------#
### 2014
emspt2014_0<-c(27)

emspt_2014_0<-read.xport("data-raw/LLCP2014.XPT")
data_2014 <- emspt_2014_0 %>%
  filter(X_STATE %in% emspt2014_0) %>%
  mutate(YEAR=2014,
         version_emspt="X_LLCPWT",
         emspt_wt_raw=X_LLCPWT,
         SEQNO=as.integer(SEQNO))
rm(emspt_2014_0)

### 2015
emspt2015_0<-c(27,44)
emspt2015_2<-40

emspt_2015_0<-read.xport("data-raw/LLCP2015.XPT")
emspt_2015_0 <- emspt_2015_0 %>%
  filter(X_STATE %in% emspt2015_0) %>%
  mutate(YEAR=2015,
         version_emspt="X_LLCPWT",
         emspt_wt_raw=X_LLCPWT,
         SEQNO=as.integer(SEQNO))

emspt_2015_2<-read.xport("data-raw/LLCP15V2.XPT")
emspt_2015_2 <- emspt_2015_2 %>%
  filter(X_STATE %in% emspt2015_2) %>%
  mutate(YEAR=2015,
         version_emspt="X_LCPWTV2",
         emspt_wt_raw=X_LCPWTV2,
         SEQNO=as.integer(SEQNO))

list2015<-list(emspt_2015_0, emspt_2015_2)
data_2015<-bind_rows(list2015)
rm(emspt_2015_0, emspt_2015_2, list2015)

### 2016

emspt2016_0<-c(22,27,44,47)

emspt_2016_0<-read.xport("data-raw/LLCP2016.XPT")
data_2016 <- emspt_2016_0 %>%
  filter(X_STATE %in% emspt2016_0) %>%
  mutate(YEAR=2016,
         version_emspt="X_LLCPWT",
         emspt_wt_raw=X_LLCPWT,
         SEQNO=as.integer(SEQNO))
rm(emspt_2016_0)

### 2017

emspt2017_0<-c(27,55)
emspt2017_1<-39

emspt_2017_0<-read.xport("data-raw/LLCP2017.XPT")
emspt_2017_0 <- emspt_2017_0 %>%
  filter(X_STATE %in% emspt2017_0) %>%
  mutate(YEAR=2017,
         version_emspt="X_LLCPWT",
         emspt_wt_raw=X_LLCPWT,
         SEQNO=as.integer(SEQNO))

emspt_2017_1<-read.xport("data-raw/LLCP17V1.XPT")
emspt_2017_1 <- emspt_2017_1 %>%
  filter(X_STATE %in% emspt2017_1) %>%
  mutate(YEAR=2017,
         version_emspt="X_LCPWTV1",
         emspt_wt_raw=X_LCPWTV1,
         SEQNO=as.integer(SEQNO))

list2017<-list(emspt_2017_0, emspt_2017_1)
data_2017<-bind_rows(list2017)
rm(emspt_1017_0, emspt_1017_1, list2017)

### COMBINING 2014-2017
brfss_emspt<-bind_rows(data_2017,data_2016,data_2015,data_2014)

### Labeling State indicators
emsptstates<-c(22,27,39,40,44,55)
emsptstatelabel<-c("LA","MN","OH","OK","RI","WI")
brfss_emspt$state<- factor(brfss_emspt$X_STATE, levels=emsptstates, labels=emsptstatelabel)

#------------------------------------------------------------------------------------#
# Cleaning Variables
#------------------------------------------------------------------------------------#
## Sexual / Gender Minority Status
brfss_emspt <- brfss_emspt %>%
  mutate(
    #Sexual and Gender Minority Status
    #Sexual Orientation - Lesbian, Gay, Bisexual vs. Heterosexual
        emsup_d_fct=as.factor(if_else(EMTSUPRT %in% 1:3, "Sometimes+",
                                 if_else(EMTSUPRT %in% 4:5, "Rarely_Never", NA_character_))),
        emsup_cat_fct=as.factor(if_else(EMTSUPRT==1, "Always",
                                 if_else(EMTSUPRT==2, "Usually",
                                 if_else(EMTSUPRT==3, "Sometimes",
                                 if_else(EMTSUPRT==4, "Rarely",
                                 if_else(EMTSUPRT==5, "Never",NA_character_)))))),
        lsat_d_fct=as.factor(if_else(LSATISFY %in% 1:2, "Satisfied",
                                 if_else(LSATISFY %in% 3:4, "Disatisfied", NA_character_))),
        lsat_cat_fct=as.factor(if_else(LSATISFY==1, "Very Satisfied",
                                 if_else(LSATISFY==2, "Satisfied",
                                 if_else(LSATISFY==3, "Disatisfied",
                                 if_else(LSATISFY==4, "Very Disatisified",NA_character_)))))
     ) %>%
    rename_all(tolower) %>%
  select(emsup_d_fct, emsup_cat_fct,lsat_d_fct, lsat_cat_fct,
         x_state,state,year,seqno,x_psu,x_ststr,emspt_wt_raw,version_emspt)

# Setting Reference Groups: LGB vs. (reference) Heterosexual
brfss_emspt$emsup_d_fct<-relevel(factor(brfss_emspt$emsup_d_fct), ref="Sometimes+")
brfss_emspt$emsup_cat_fct<-relevel(factor(brfss_emspt$emsup_cat_fct), ref="Always")
brfss_emspt$lsat_d_fct<-relevel(factor(brfss_emspt$lsat_d_fct), ref="Satisfied")
brfss_emspt$lsat_cat_fct<-relevel(factor(brfss_emspt$lsat_cat_fct), ref="Very Satisfied")

#save(brfss_emspt, file = "data/brfss_emspt.rda", compress = "bzip2", version=2)
use_data(brfss_emspt, overwrite = TRUE,compress = "bzip2")
