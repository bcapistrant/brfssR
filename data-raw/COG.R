library(tidyverse)
library(lubridate)
library(foreign)
library(usethis)
library(devtools)

### 2015

#LLCP2015: ALABAMA, ARIZONA, ARKANSAS, DISTRICT OF COLUMBIA, GEORGIA, HAWAII, ILLINOIS, IOWA, LOUISIANA, MINNESOTA, MISSISSIPPI,
###NEVADA, NEW JERSEY, NORTH DAKOTA, OHIO, OREGON, RHODE ISLAND, SOUTH CAROLINA, SOUTH DAKOTA, TENNESSEE, VIRGINIA, WEST VIRGINIA, WISCONSIN, WYOMING, PUERTO RICO
#	LLCP15V1:	MARYLAND, MICHIGAN, NEBRASKA, OKLAHOMA
#	LLCP15V2:	CALIFORNIA, COLORADO, FLORIDA, NEW YORK, TEXAS, UTAH

COG2015_0<-c(1,4,5,11,13,15,17,19,22,27,28,
             32,34,38,39,41,44,45,46,47,51,54,55,56,72)
COG2015_1<-c(24,26,31,40)
COG2015_2<-c(6,8,12,36,48,49)

COG_2015_0<-read.xport("data-raw/LLCP2015.XPT")
COG_2015_0 <- COG_2015_0 %>%
  filter(X_STATE %in% COG2015_0) %>%
  mutate(YEAR=2015,
         version_cog="X_LLCPWT",
         COG_wt_raw=X_LLCPWT,
         SEQNO=as.integer(SEQNO))

COG_2015_1<-read.xport("data-raw/LLCP15V1.XPT")
COG_2015_1 <- COG_2015_1 %>%
  filter(X_STATE %in% COG2015_1) %>%
  mutate(YEAR=2015,
         version_cog="X_LCPWTV1",
         COG_wt_raw=X_LCPWTV1,
         SEQNO=as.integer(SEQNO))

COG_2015_2<-read.xport("data-raw/LLCP15V2.XPT")
COG_2015_2 <- COG_2015_2 %>%
  filter(X_STATE %in% COG2015_2) %>%
  mutate(YEAR=2015,
         version_cog="X_LCPWTV2",
         COG_wt_raw=X_LCPWTV2,
         SEQNO=as.integer(SEQNO))

list2015<-list(COG_2015_0, COG_2015_1,COG_2015_2)
data_2015<-bind_rows(list2015)
rm(COG_2015_0, COG_2015_1,COG_2015_2, list2015)

### 2016
# LLCP2016	Alaska, Delaware, Idaho, Indiana, Kentucky, Massachusetts, Missouri, Montana,
## New Hampshire, New Jersey, New Mexico, North Carolina, Oregon, Tennessee, Vermont, Washington
# LLCP16V1	Connecticut, Maine, Utah
# LLCP16V2	Kansas
#LLCP16V3	New York

COG2016_0<-c(2,10,16,18,21,25,29,30,33,34,35,37,41,47,50,53)
COG2016_1<-c(9,23,49)
COG2016_2<-c(20)
COG2016_3<-c(36)

COG_2016_0<-read.xport("data-raw/LLCP2016.XPT")
COG_2016_0 <- COG_2016_0 %>%
  filter(X_STATE %in% COG2016_0) %>%
  mutate(YEAR=2016,
         version_cog="X_LLCPWT",
         COG_wt_raw=X_LLCPWT,
         SEQNO=as.integer(SEQNO))

COG_2016_1<-read.xport("data-raw/LLCP16V1.XPT")
COG_2016_1 <- COG_2016_1 %>%
  filter(X_STATE %in% COG2016_1) %>%
  mutate(YEAR=2016,
         version_cog="X_LCPWTV1",
         COG_wt_raw=X_LCPWTV1,
         SEQNO=as.integer(SEQNO))

COG_2016_2<-read.xport("data-raw/LLCP16V2.XPT")
COG_2016_2 <- COG_2016_2 %>%
  filter(X_STATE %in% COG2016_2) %>%
  mutate(YEAR=2016,
         version_cog="X_LCPWTV2",
         COG_wt_raw=X_LCPWTV2,
         SEQNO=as.integer(SEQNO))

COG_2016_3<-read.xport("data-raw/LLCP16V3.XPT")
COG_2016_3 <- COG_2016_3 %>%
  filter(X_STATE %in% COG2016_3) %>%
  mutate(YEAR=2016,
         version_cog="X_LCPWTV3",
         COG_wt_raw=X_LCPWTV3,
         SEQNO=as.integer(SEQNO))

list2016<-list(COG_2016_0, COG_2016_1,COG_2016_2,COG_2016_3)
data_2016<-bind_rows(list2016)
rm(COG_2016_0, COG_2016_1,COG_2016_2,COG_2016_3, list2016)
### 2017

# LLCP2017	_LLCPWT	Georgia, Hawaii, Mississippi, Oregon, Puerto Rico
# LLCP17V2	_LCPWTV2	Michigan, New Jersey, New York, Utah
# LLCP17V3	_LCPWTV3	Maryland

COG2017_0<-c(13,15,28,41,72)
COG2017_2<-c(26,34,36,49)
COG2017_3<-c(24)

COG_2017_0<-read.xport("data-raw/LLCP2017.XPT")
COG_2017_0 <- COG_2017_0 %>%
  filter(X_STATE %in% COG2017_0) %>%
  mutate(YEAR=2017,
         version_cog="X_LLCPWT",
         COG_wt_raw=X_LLCPWT,
         SEQNO=as.integer(SEQNO))

COG_2017_2<-read.xport("data-raw/LLCP17V2.XPT")
COG_2017_2 <- COG_2017_2 %>%
  filter(X_STATE %in% COG2017_2) %>%
  mutate(YEAR=2017,
         version_cog="X_LCPWTV2",
         COG_wt_raw=X_LCPWTV2,
         SEQNO=as.integer(SEQNO))

COG_2017_3<-read.xport("data-raw/LLCP17V3.XPT")
COG_2017_3 <- COG_2017_3 %>%
  filter(X_STATE %in% COG2017_3) %>%
  mutate(YEAR=2017,
         version_cog="X_LCPWTV3",
         COG_wt_raw=X_LCPWTV3,
         SEQNO=as.integer(SEQNO))

list2017<-list(COG_2017_0, COG_2017_2,COG_2017_3)
data_2017<-bind_rows(list2017)
rm(COG_2017_0,COG_2017_2,COG_2017_3, list2017)

### COMBINING 2015-2017
brfss_COG<-bind_rows(data_2017,data_2016,data_2015)
rm(data_2017,data_2016,data_2015)

### Labeling State indicators
COGstates<- c(1,2,4,5,6,8,9,10,
              11,12,13,15,16,17,18,19,
              20,21,22,23,24,25,26,27,28,29,
              30,31,32,33,34,35,36,37,38,39,
              40,41,44,45,46,47,48,49,
              50,51,53,54,55,56,72)
COGstatelabel<-c("AL","AK","AZ","AR","CA","CO","CT","DE",
                 "DC","FL","GA","HI","ID","IL","IN","IA",
                 "KS","KY","LA","ME","MD","MA","MI","MN","MS","MO",
                 "MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH",
                 "OK","OR","RI","SC","SD","TN","TX","UT",
                 "VT","VA","WA","WV","WI","WY","PR")
brfss_COG$state<- factor(brfss_COG$X_STATE, levels=COGstates, labels=COGstatelabel)


#------------------------------------------------------------------------------------#
# Cleaning Variables
#------------------------------------------------------------------------------------#
## Sexual / Gender Minority Status
brfss_cog <- brfss_COG %>%
  mutate(cog_mem_d_fct=as.factor(if_else(CIMEMLOS==1, "Yes",
                                 if_else(CIMEMLOS==2, "No", NA_character_))),
         cog_mem_d_num=as.factor(if_else(CIMEMLOS==1, 1,
                                 if_else(CIMEMLOS==2, 0, NA_real_))),

         cog_hous_cat_fct=as.factor(if_else(CDHOUSE==1, "Always",
                                 if_else(CDHOUSE==2, "Usually",
                                 if_else(CDHOUSE==3, "Sometimes",
                                 if_else(CDHOUSE==4, "Rarely",
                                 if_else(CDHOUSE==5, "Never", NA_character_)))))),
         cog_hous_d_fct=as.factor(if_else(CDHOUSE %in% 1:3, "Sometimes+",
                                 if_else(CDHOUSE %in% 4:5, "Rarely_Never", NA_character_))),

         cog_asst_cat_fct=as.factor(if_else(CDASSIST==1, "Always",
                                 if_else(CDASSIST==2, "Usually",
                                 if_else(CDASSIST==3, "Sometimes",
                                 if_else(CDASSIST==4, "Rarely",
                                 if_else(CDASSIST==5, "Never", NA_character_)))))),
         cog_asst_d_fct=as.factor(if_else(CDASSIST %in% 1:3, "Sometimes+",
                                 if_else(CDASSIST %in% 4:5, "Rarely_Never", NA_character_))),

         cog_help_cat_fct=as.factor(if_else(CDHELP==1, "Always",
                                 if_else(CDHELP==2, "Usually",
                                 if_else(CDHELP==3, "Sometimes",
                                 if_else(CDHELP==4, "Rarely",
                                 if_else(CDHELP==5, "Never", NA_character_)))))),
         cog_help_cat_fct2=as.factor(if_else(CDHELP==1, "Always",
                                 if_else(CDHELP==2, "Usually",
                                 if_else(CDHELP==3, "Sometimes",
                                 if_else(CDHELP==4, "Rarely",
                                 if_else(CDHELP==5, "Never",
                                 if_else(CDASSIST %in% 4:5, "Rarely/Never Needs Assistance", NA_character_))))))),

         cog_help_d_fct=as.factor(if_else(CDHELP %in% 1:3, "Sometimes+",
                                 if_else(CDHELP %in% 4:5, "Rarely_Never", NA_character_))),

         cog_social_cat_fct=as.factor(if_else(CDSOCIAL==1, "Always",
                                 if_else(CDSOCIAL==2, "Usually",
                                 if_else(CDSOCIAL==3, "Sometimes",
                                 if_else(CDSOCIAL==4, "Rarely",
                                 if_else(CDSOCIAL==5, "Never", NA_character_)))))),
         cog_social_cat_fct2=as.factor(if_else(CDSOCIAL==1, "Always",
                                 if_else(CDSOCIAL==2, "Usually",
                                 if_else(CDSOCIAL==3, "Sometimes",
                                 if_else(CDSOCIAL==4, "Rarely",
                                 if_else(CDSOCIAL==5, "Never",
                                 if_else(CDASSIST %in% 4:5, "Rarely/Never Needs Assistance", NA_character_))))))),
         cog_social_d_fct=as.factor(if_else(CDSOCIAL %in% 1:3, "Sometimes+",
                                 if_else(CDSOCIAL %in% 4:5, "Rarely_Never", NA_character_))),

         cog_dscs_d_fct=as.factor(if_else(CDDISCUS==1, "Yes",
                                 if_else(CDDISCUS==2, "No", NA_character_))),
         cog_dscs_d_num=as.factor(if_else(CDDISCUS==1, 1,
                                 if_else(CDDISCUS==2, 0, NA_real_)))
         ) %>%

  # Need to select the variables
   mutate(incog=1) %>%
  rename_all(tolower) %>%
   select(cog_mem_d_fct,cog_mem_d_num,
          cog_hous_cat_fct,cog_hous_d_fct,
          cog_asst_cat_fct,cog_asst_d_fct,
          cog_help_cat_fct,cog_help_cat_fct2,cog_help_d_fct,
          cog_social_cat_fct,cog_social_cat_fct2,cog_social_d_fct,
          cog_dscs_d_fct,cog_dscs_d_num,
          x_state,state,year,seqno,x_psu,x_ststr,
          cog_wt_raw,version_cog,incog
          )
rm(brfss_COG)
#save(brfss_cog, file = "data/brfss_cog.rda", compress = "bzip2", version=2)
use_data(brfss_cog, overwrite = TRUE,compress = "bzip2")
