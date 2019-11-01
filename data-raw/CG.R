# libraries needed
library(tidyverse)
library(lubridate)
library(foreign)
library(usethis)
library(devtools)

# pulling in the datasets
### 2015
cg2015_0<-c(1,15,16,17,18,19,21,22,28,42,45,51,54,55,56)
cg2015_1<-c(23,24,31,39)
cg2015_2<-c(12,36,40)

BRFSS_2015_0<-read.xport("data-raw/LLCP2015.XPT")
BRFSS_2015_0 <- BRFSS_2015_0 %>%
  filter(X_STATE %in% cg2015_0) %>%
  mutate(YEAR=2015,
         CG_WT_RAW=X_LLCPWT,
          VERSION_CG="X_LLCPWT",
         SEQNO=as.integer(SEQNO))

BRFSS_2015_1<-read.xport("data-raw/LLCP15V1.xpt")
BRFSS_2015_1 <- BRFSS_2015_1 %>%
  filter(X_STATE %in% cg2015_1) %>%
  mutate(YEAR=2015,
         CG_WT_RAW=X_LCPWTV1,
         VERSION_CG="X_LCPWTV1",
         SEQNO=as.integer(SEQNO))

BRFSS_2015_2<-read.xport("data-raw/LLCP15V2.xpt")
BRFSS_2015_2 <- BRFSS_2015_2 %>%
  filter(X_STATE %in% cg2015_2) %>%
  mutate(YEAR=2015,
         CG_WT_RAW=X_LCPWTV2,
         VERSION_CG="X_LCPWTV2",
         SEQNO=as.integer(SEQNO))

list2015<-list(BRFSS_2015_0, BRFSS_2015_1, BRFSS_2015_2)
data_2015<-bind_rows(list2015)
rm(BRFSS_2015_0, BRFSS_2015_1, BRFSS_2015_2, list2015)

### 2016

cg2016_0<-c(5,11,13,27,29,30,32,34,38,41,72,46,47)
cg2016_1<-c(39,49)
cg2016_2<-c(4,6,9,48)
cg2016_3<-c(8,36)

BRFSS_2016_0<-read.xport("data-raw/LLCP2016.XPT")
BRFSS_2016_0 <- BRFSS_2016_0 %>%
  filter(X_STATE %in% cg2016_0) %>%
  mutate(YEAR=2016,
         CG_WT_RAW=X_LLCPWT,
         VERSION_CG="X_LLCPWT",
         SEQNO=as.integer(SEQNO))

BRFSS_2016_1<-read.xport("data-raw/LLCP16V1.XPT")
BRFSS_2016_1 <- BRFSS_2016_1 %>%
  filter(X_STATE %in% cg2016_1) %>%
  mutate(YEAR=2016,
         CG_WT_RAW=X_LCPWTV1,
         VERSION_CG="X_LCPWTV1",
         SEQNO=as.integer(SEQNO))

BRFSS_2016_2<-read.xport("data-raw/LLCP16V2.XPT")
BRFSS_2016_2 <- BRFSS_2016_2 %>%
  filter(X_STATE %in% cg2016_2) %>%
  mutate(YEAR=2016,
         CG_WT_RAW=X_LCPWTV2,
         VERSION_CG="X_LCPWTV2",
         SEQNO=as.integer(SEQNO))

BRFSS_2016_3<-read.xport("data-raw/LLCP16V3.XPT")
BRFSS_2016_3 <- BRFSS_2016_3 %>%
  filter(X_STATE %in% cg2016_3) %>%
  mutate(YEAR=2016,
         CG_WT_RAW=X_LCPWTV3,
         VERSION_CG="X_LCPWTV3",
         SEQNO=as.integer(SEQNO))

### Add datasets together
list2016<-list(BRFSS_2016_0, BRFSS_2016_1, BRFSS_2016_2, BRFSS_2016_3)
data_2016<-bind_rows(list2016)
data_2016$SEQNO<-as.integer(data_2016$SEQNO)
rm(BRFSS_2016_0, BRFSS_2016_1, BRFSS_2016_2, BRFSS_2016_3,list2016)


### 2017

cg2017_0<-c(2,15,35,41,44)
cg2017_1<-c(20,26,34)
cg2017_2<-c(36,40,49)
cg2017_3<-c(24)

BRFSS_2017_0<-read.xport("data-raw/LLCP2017.XPT")
BRFSS_2017_0 <- BRFSS_2017_0 %>%
  filter(X_STATE %in% cg2017_0) %>%
  mutate(YEAR=2017,
         CG_WT_RAW=X_LLCPWT,
         VERSION_CG="X_LLCPWT",
         SEQNO=as.integer(SEQNO))

BRFSS_2017_1<-read.xport("data-raw/LLCP17V1.XPT")
BRFSS_2017_1 <- BRFSS_2017_1 %>%
  filter(X_STATE %in% cg2017_1) %>%
  mutate(YEAR=2017,
         CG_WT_RAW=X_LCPWTV1,
         VERSION_CG="X_LCPWTV1",
         SEQNO=as.integer(SEQNO))

BRFSS_2017_2<-read.xport("data-raw/LLCP17V2.XPT")
BRFSS_2017_2 <- BRFSS_2017_2 %>%
  filter(X_STATE %in% cg2017_2) %>%
  mutate(YEAR=2017,
         CG_WT_RAW=X_LCPWTV2,
         VERSION_CG="X_LCPWTV2",
         SEQNO=as.integer(SEQNO))

BRFSS_2017_3<-read.xport("data-raw/LLCP17V3.XPT")
BRFSS_2017_3 <- BRFSS_2017_3 %>%
  filter(X_STATE %in% cg2017_3) %>%
  mutate(YEAR=2017,
         CG_WT_RAW=X_LCPWTV3,
         VERSION_CG="X_LCPWTV3",
         SEQNO=as.integer(SEQNO))
### Add datasets together
list2017<-list(BRFSS_2017_0, BRFSS_2017_1, BRFSS_2017_2, BRFSS_2017_3)
data_2017<-bind_rows(list2017)
data_2017$SEQNO<-as.integer(data_2017$SEQNO)
rm(BRFSS_2017_0, BRFSS_2017_1, BRFSS_2017_2, BRFSS_2017_3,list2017)


### COMBINING 2015 AND 2016
brfss_cg<-bind_rows(data_2017,data_2016,data_2015)
rm(data_2017,data_2016,data_2015)

cgsgmstates<-c(1,2,4,5,6,8,9,11,12,13,
               15,16,17,18,19,20,21,22,23,24,
               26,27,28,29,30,31,32,34,35,36,
               38,39,40,41,42,44,45,46,47,48,49,
               51,54,55,56,72)
cgsgmstatelabel<-c("AL","AK","AZ","AR","CA","CO","CT","DC","FL","GA",
                   "HI","ID","IL","IN","IA","KS","KY","LA","ME","MD",
                   "MI","MN","MS","MO","MT","NE","NV","NJ","NM","NY",
                   "ND","OH","OK","OR","PA","RI","SC","SD","TN","TX",
                   "UT","VA","WV","WI","WY","PR")
brfss_cg$state<- factor(brfss_cg$X_STATE, levels=cgsgmstates, labels=cgsgmstatelabel)


#Sanity check that just those states were included
NUMSTATES<-brfss_cg %>%
  count(X_STATE)


# Data Wrangling: Variables

## Caregiving Variables
# **********************************************************************************************
# * RAW CAREGIVING VARIABLES:
# *	CRGVEXPT = 'DO YOU EXPECT TO HAVE A RELATIVE YOU WILL NEED TO PROVIDE CARE FOR?'
# *	CRGVHOUS = 'MANAGED HOUSEHOLD TASKS'
# *	CRGVHRS1 = 'HOW MANY HOURS DO YOU PROVIDE CARE FOR PERSON?'
# *	CRGVLNG1 = 'HOW LONG PROVIDED CARE FOR PERSON.'
# *	CRGVMST2 = 'WHICH SUPPORT DO YOU MOST NEED THAT YOU ARE NOT GETTING?'
# *	CRGVPERS = 'MANAGED PERSONAL CARE'
# *	CRGVPRB1 = 'WHAT IS THE MAJOR HEALTH PROBLEM, ILLNESS, DISABILITY FOR CARE FOR PERSON?'
# *	CRGVREL1 = 'RELATIONSHIP OF PERSON TO WHOM YOU ARE GIVING CARE?'
# *	CAREGIV1 = 'PROVIDED REGULAR CARE FOR FAMILY OR FRIEND'
# **********************************************************************************************;

# **** WORKING WITH	CAREGIV1 - WHETHER SOMEONE WAS A CAREGIVER OR NOT
# Caregiving: cg_d --- Cloning caregiv1 & assigning factor labels

## Notes: Relationship codes changed between 2016 and 2017 - unmarried partner (16) was added in 2017
##        CG Type / Health Problem changed in 2016, adding two categories that resulted in recoding "other" (13) from 2015


brfss_cg <- brfss_cg %>%
    mutate(
# Caregiver Indicator
        cg_d_fct=as.factor(if_else(CAREGIV1==1, "CG",
                           if_else(CAREGIV1==2, "Non-CG", NA_character_))),
        cg_d_num=as.numeric(if_else(CAREGIV1==1, 1,
                            if_else(CAREGIV1==2, 0, NA_real_))),


# Relationship of Person Receiving Care to Caregiver
        cg_prb_cat_num=if_else(YEAR==2017,CRGVREL2,CRGVREL1),
        cg_prb_cat_num=if_else(cg_prb_cat_num %in% c(77,99),NA_real_,cg_prb_cat_num), #Setting DK/Refused to Missing

        cg_rel_cat_6fct=as.factor(if_else(cg_prb_cat_num %in% 1:4, "Parent/Parent-in-law",
                              if_else(cg_prb_cat_num==5, "Child",
                              if_else(cg_prb_cat_num %in% c(6:8,16), "Spouse/Partner",
                              if_else(cg_prb_cat_num %in% 9:10, "Sibling",
                              if_else(cg_prb_cat_num %in% 11:12, "Grandparent",
                              if_else(cg_prb_cat_num %in% 13:14, "Other Fam",
                              if_else(cg_prb_cat_num==15, "Non-Fam", NA_character_)))))))),
         cg_rel_cat_4fct=as.factor(if_else(cg_prb_cat_num %in% 1:4, "Parent/Parent-in-law",
                              if_else(cg_prb_cat_num %in% c(6:8,16), "Spouse/Partner",
                              if_else(cg_prb_cat_num %in% c(5,9:10,11:14), "Other Family",
                              if_else(cg_prb_cat_num==15, "Non-Fam", NA_character_))))),
         cg_nonfam_d_num=as.numeric(if_else(cg_prb_cat_num==15, 1,
                               if_else(!is.na(cg_prb_cat_num), 0,NA_real_))),
         cg_nonfam_d_fct=as.factor(if_else(cg_prb_cat_num==15, "Non-Fam",
                               if_else(!is.na(cg_prb_cat_num), "Family",NA_character_))),


# Hours of Caregiving per Week
        cg_hrs_cat_num=as.numeric(if_else(CRGVHRS1 %in% 1:4,CRGVHRS1,NA_real_)),
        cg_hrs_cat_fct=as.factor(if_else(CRGVHRS1==1, "<8hr/wk",
                             if_else(CRGVHRS1==2, "9-19hr/wk",
                             if_else(CRGVHRS1==3, "20-39hr/wk",
                             if_else(CRGVHRS1==4, "40+hr/wk", NA_character_))))),

# Length of Time as a Caregiver
        cg_lngth_cat_num=as.numeric(if_else(CRGVLNG1 %in% 1:5,CRGVLNG1,NA_real_)),
        cg_lngth_cat_fct=as.factor(if_else(CRGVLNG1==1, "<1mo",
                                    if_else(CRGVLNG1==2, "1-6mo",
                                    if_else(CRGVLNG1==3, "7mo-2yr",
                                    if_else(CRGVLNG1==4, "2-5yrs",
                                    if_else(CRGVLNG1==5, "5+yrs", NA_character_)))))),
# Health Problem, Illness, Disability - Reason for Care
         cg_prb_cat_num=if_else(YEAR==2015,CRGVPRB1,CRGVPRB2),
         cg_prb_cat_fct=as.factor(
                     if_else(cg_prb_cat_num==1, "Arthritis/Rheumatism",
                     if_else(cg_prb_cat_num==2, "Asthma",
                     if_else(cg_prb_cat_num==3, "Cancer",
                     if_else(cg_prb_cat_num==4, "Chronic Respiratory",
                     if_else(cg_prb_cat_num==5, "Dementia",
                     if_else(cg_prb_cat_num==6, "Developmental",
                     if_else(cg_prb_cat_num==7, "Diabetes",
                     if_else(cg_prb_cat_num==8, "Cardiovascular",
                     if_else(cg_prb_cat_num==9, "HIV",
                     if_else(cg_prb_cat_num==10, "Mental Illness",
                     if_else(cg_prb_cat_num==11, "Other Organs",
                     if_else(cg_prb_cat_num==12, "Substance Use",
                     if_else(cg_prb_cat_num==13, if_else(YEAR==2015, "Other","Injuries"),
                     if_else(cg_prb_cat_num==14, "Old Age",
                     if_else(cg_prb_cat_num==15, "Other", NA_character_)))))))))))))))
                    ),
        cg_prb_dem_d_fct=as.factor(if_else(cg_prb_cat_num %in% 1:15,
                                if_else(cg_prb_cat_num==5, "Dementia","Non-Dementia"), NA_character_)),
        cg_prb_dem_d_num=as.numeric(if_else(cg_prb_cat_num %in% 1:15,
                                if_else(cg_prb_cat_num==5, 1,0), NA_real_)),
        cg_prb_hiv_d_fct=as.factor(if_else(cg_prb_cat_num %in% 1:15,
                            if_else(cg_prb_cat_num==9, "HIV","Non-HIV"), NA_character_)),
        cg_prb_hiv_d_num=as.numeric(if_else(cg_prb_cat_num %in% 1:15,
                            if_else(cg_prb_cat_num==9, 1,0), NA_real_)),

# Type of Care Provided
      cg_type_cat_num=as.numeric(if_else(CRGVHOUS==1 & CRGVPERS==2,1,
                                 if_else(CRGVHOUS==2 & CRGVPERS==1,2,
                                 if_else(CRGVHOUS==1 & CRGVPERS==1,3,
                                 if_else(CRGVHOUS==2 & CRGVPERS==2,4,NA_real_))))),
      cg_type_cat_fct=as.factor(if_else(cg_type_cat_num==1,"Household only",
                                if_else(cg_type_cat_num==2,"Personal only",
                                if_else(cg_type_cat_num==3,"Both",
                                if_else(cg_type_cat_num==4,"Neither",NA_character_))))),


# Most Needed Caregiving Supports
      cg_most_cat_num=as.numeric(if_else(CRGVMST2 %in% 77:99,NA_real_,CRGVMST2)),
      cg_most_cat_fct=as.factor(if_else(cg_most_cat_num==1, "Education",
                      if_else(cg_most_cat_num==2, "Service Referrals",
                      if_else(cg_most_cat_num==3, "Support Groups",
                      if_else(cg_most_cat_num==4, "Counseling",
                      if_else(cg_most_cat_num==5, "Respite Care",
                      if_else(cg_most_cat_num==6, "None", NA_character_))))))),

# Future Expectations of Caregiving
      cg_expt_cat_num=as.numeric(if_else(CRGVEXPT==1,1,
                                if_else(CRGVEXPT==2,0,NA_real_))),
      cg_expt_cat_fct=as.factor(if_else(cg_expt_cat_num==1, "Yes",
                      if_else(cg_expt_cat_num==0, "No", NA_character_)))

  )

#------------------------------------------------------------------------#
#------------------------------------------------------------------------#

# NEXT
##  Select all the variables
##  Make the datasets


#------------------------------------------------------------------------#
#------------------------------------------------------------------------#



# Setting Reference Categories

# # Dichotomous Caregiving Indicator Variable: Caregiver vs. (reference) Non-Caregiver
# brfss_cg$cg_d<-relevel(factor(brfss_cg$cg_d_fct), ref="Non-CG")
#
# # Caregiving Relationship: (reference) Parent
# brfss_cg$cg_rel_cat<-relevel(factor(brfss_cg$cg_rel_cat), "Parent", "Child", "Spouse","Sibling",
#                              "Grandparent", "Other Fam", "Non-Fam", ref="Parent")
#
# # Dichotomous Non-Biological/Given Family CG Indicator Variable: Non-Family vs. (reference) Other
# brfss_cg$cg_nonfam<-relevel(factor(brfss_cg$cg_nonfam), ref="Other")
#
# # Hours per Week of Caregiving: (reference) <8hrs/week
# brfss_cg$cg_hrs_cat<-relevel(factor(brfss_cg$cg_hrs_cat), "<8hr/wk", "9-19hr/wk", "20-39hr/wk","40+hr/wk", ref="<8hr/wk")
#
# # Duration of Caregiving: (reference) <1 month
# brfss_cg$cg_lngth_cat<-relevel(factor(brfss_cg$cg_lngth_cat), "<1mo", "1-6mo", "7mo-2yr","2-5yr", "5+yrs", ref="<1mo")


## CREATING NEW DATAFRAME OF JUST CAREGIVING VARIABLES FOR ANALYSIS
 brfss_cg <- brfss_cg %>%
   mutate(incg=1) %>%
   rename_all(tolower) %>%
   select(cg_d_num,cg_d_fct,
          cg_prb_cat_num,cg_rel_cat_6fct,cg_rel_cat_4fct,
          cg_nonfam_d_num,cg_nonfam_d_fct,
          cg_hrs_cat_num,cg_hrs_cat_fct,
          cg_lngth_cat_num,cg_lngth_cat_fct,
          cg_prb_cat_num,cg_prb_cat_fct,
          cg_prb_dem_d_num,cg_prb_dem_d_fct,
          cg_prb_hiv_d_num,cg_prb_hiv_d_fct,
          cg_type_cat_num,cg_type_cat_fct,
          cg_most_cat_num,cg_most_cat_fct,
          cg_expt_cat_num,cg_expt_cat_fct,
          x_state,state,year,seqno,x_psu,x_ststr,
          cg_wt_raw,version_cg,incg
          )

#save(brfss_cg, file = "data/brfss_cg.rda", compress = "bzip2", version=2)
use_data(brfss_cg, overwrite = TRUE,compress = "bzip2")




