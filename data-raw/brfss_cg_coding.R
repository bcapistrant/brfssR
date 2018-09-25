# libraries needed
library(magrittr)
library(foreign)
library(tidyverse)

# pulling in the datasets
### 2015
#No NJ(34),NY(36),OR(41),TN(47),UT(49) - they have 2016 data
cg2015_0<-c(1,15,16,17,18,19,21,22,28,42,45,51,54,55,56)
cg2015_1<-c(23,25,39)
cg2015_2<-40

BRFSS_2015_0<-read.xport("data/LLCP2015.XPT")
BRFSS_2015_0 <- BRFSS_2015_0 %>%
  filter(X.STATE %in% cg2015_0) %>%
  mutate(YEAR=2015,
         CG_WT_RAW=X.LLCPWT,
         SEQNO=as.integer(SEQNO))

BRFSS_2015_1<-read.xport("data/LLCP15V1.xpt")
BRFSS_2015_1 <- BRFSS_2015_1 %>%
  filter(X.STATE %in% cg2015_1) %>%
  mutate(YEAR=2015,
         CG_WT_RAW=X.LCPWTV1,
         SEQNO=as.integer(SEQNO))

BRFSS_2015_2<-read.xport("data/LLCP15V2.xpt")
BRFSS_2015_2 <- BRFSS_2015_2 %>%
  filter(X.STATE %in% cg2015_2) %>%
  mutate(YEAR=2015,
         CG_WT_RAW=X.LCPWTV2,
         SEQNO=as.integer(SEQNO))

list2015<-list(BRFSS_2015_0, BRFSS_2015_1, BRFSS_2015_2)
data_2015<-bind_rows(list2015)
rm(BRFSS_2015_0, BRFSS_2015_1, BRFSS_2015_2, list2015)
### 2016

cg2016_0<-c(5,11,13,27,29,30,32,34,38,41,72,46,47)
cg2016_1<-c(39,49)
cg2016_2<-c(4,6,9,48)
cg2016_3<-c(8,36)

BRFSS_2016_0<-read.xport("data/LLCP2016.XPT")
BRFSS_2016_0 <- BRFSS_2016_0 %>%
  filter(X.STATE %in% cg2016_0) %>%
  mutate(YEAR=2016,
         CG_WT_RAW=X.LLCPWT,
         SEQNO=as.integer(SEQNO))

BRFSS_2016_1<-read.xport("data/LLCP16V1.XPT")
BRFSS_2016_1 <- BRFSS_2016_1 %>%
  filter(X.STATE %in% cg2016_1) %>%
  mutate(YEAR=2016,
         CG_WT_RAW=X.LCPWTV1,
         SEQNO=as.integer(SEQNO))

BRFSS_2016_2<-read.xport("data/LLCP16V2.XPT")
BRFSS_2016_2 <- BRFSS_2016_2 %>%
  filter(X.STATE %in% cg2016_2) %>%
  mutate(YEAR=2016,
         CG_WT_RAW=X.LCPWTV2,
         SEQNO=as.integer(SEQNO))

BRFSS_2016_3<-read.xport("data/LLCP16V3.XPT")
BRFSS_2016_3 <- BRFSS_2016_3 %>%
  filter(X.STATE %in% cg2016_3) %>%
  mutate(YEAR=2016,
         CG_WT_RAW=X.LCPWTV3,
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

BRFSS_2017_0<-read.xport("data/LLCP2017.XPT")
BRFSS_2017_0 <- BRFSS_2017_0 %>%
  filter(X.STATE %in% cg2017_0) %>%
  mutate(YEAR=2017,
         CG_WT_RAW=X.LLCPWT,
         SEQNO=as.integer(SEQNO))

BRFSS_2017_1<-read.xport("data/LLCP16V1.XPT")
BRFSS_2017_1 <- BRFSS_2017_1 %>%
  filter(X.STATE %in% cg2017_1) %>%
  mutate(YEAR=2017,
         CG_WT_RAW=X.LCPWTV1,
         SEQNO=as.integer(SEQNO))

BRFSS_2017_2<-read.xport("data/LLCP16V2.XPT")
BRFSS_2017_2 <- BRFSS_2017_2 %>%
  filter(X.STATE %in% cg2017_2) %>%
  mutate(YEAR=2017,
         CG_WT_RAW=X.LCPWTV2,
         SEQNO=as.integer(SEQNO))

BRFSS_2017_3<-read.xport("data/LLCP16V3.XPT")
BRFSS_2017_3 <- BRFSS_2017_3 %>%
  filter(X.STATE %in% cg2017_3) %>%
  mutate(YEAR=2017,
         CG_WT_RAW=X.LCPWTV3,
         SEQNO=as.integer(SEQNO))
### Add datasets together
list2017<-list(BRFSS_2017_0, BRFSS_2017_1, BRFSS_2017_2, BRFSS_2017_3)
data_2017<-bind_rows(list2017)
data_2017$SEQNO<-as.integer(data_2017$SEQNO)
rm(BRFSS_2017_0, BRFSS_2017_1, BRFSS_2017_2, BRFSS_2017_3,list2017)


### COMBINING 2015 AND 2016
brfss_cg<-bind_rows(data_2016,data_2015)
rm(data_2016,data_2015)

cgsgmstates<-c(1,2,4,5,6,8,9,11,12,
               13,15,16,17,18,19,20,21,22,
               23,24,26,27,28,29,30,31,32,
               34,35,36,38,39,40,41,42,45,46,
               47,48,49,51,54,55,56,72)
cgsgmstatelabel<-c("AL","AK","AZ","AR","CA","CO","CT","DC","FL",
                   "GA","HI","ID","IL","IN","IA","KS","KY","LA",
                   "ME","MD","MI","MN","MS","MO","MT","NE","NV",
                   "NJ","NM","NY","ND","OH","OK","OR","PA","SC","SD",
                   "TN","TX","UT","VA","WV","WI","WY","PR")
brfss_cg$X.STATE<- factor(brfss_cg$X.STATE, levels=cgsgmstates, labels=cgsgmstatelabel)


#Sanity check that just those states were included
NUMSTATES<-brfss_cg %>%
  count(X.STATE)


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

brfss_cg <- brfss_cg %>%
  mutate(cg_d=as.factor(if_else(CAREGIV1==1, "Caregiver", "Non-CG")),
         cg=as.numeric(if_else(CAREGIV1==1, 1, 0)),
         cg_rel_cat=as.factor(if_else(CRGVREL1 %in% 1:4, "Parent",
                                  if_else(CRGVREL1==5, "Child",
                                          if_else(CRGVREL1 %in% 6:8, "Spouse",
                                                  if_else(CRGVREL1 %in% 9:10, "Sibling",
                                                          if_else(CRGVREL1 %in% 11:12, "Grandparent",
                                                                  if_else(CRGVREL1 %in% 13:14, "Other Fam",
                                                                          if_else(CRGVREL1>14, "Non-Fam", NA_character_)))))))),
         cg_nonfam=as.factor(if_else(CRGVREL1 %in% 14:15, "Non-Fam", "Other")),
         cg_hrs_num=replace(CRGVHRS1,CRGVHRS1>4,NA),
         cg_hrs_cat=as.factor(if_else(CRGVHRS1==1, "<8hr/wk",
                                      if_else(CRGVHRS1==2, "9-19hr/wk",
                                              if_else(CRGVHRS1==3, "20-39hr/wk",
                                                      if_else(CRGVHRS1==4, "40+hr/wk", NA_character_))))),
         cg_lngth_num=replace(CRGVLNG1,CRGVLNG1>5,NA),
         cg_lngth_cat=as.factor(if_else(CRGVLNG1==1, "<1mo",
                                    if_else(CRGVLNG1==2, "1-6mo",
                                            if_else(CRGVLNG1==3, "7mo-2yr",
                                                    if_else(CRGVLNG1==4, "2-5yrs",
                                                            if_else(CRGVLNG1==5, "5+yrs", NA_character_)))))),
         cg_type_cat=CRGVPRB1,
         cg_type_cat=replace(cg_type_cat,CRGVPRB1==77,NA),
         cg_type_cat=replace(cg_type_cat,CRGVPRB1==99,NA)
  )

# Dichotomous Caregiving Indicator Variable: Caregiver vs. (reference) Non-Caregiver
brfss_cg$cg_d<-relevel(factor(brfss_cg$cg_d), ref="Non-CG")

# Caregiving Reason
careprobcode<- c("Arthritis/Rheumatism", "Asthma", "Cancer",
                 "Chronic respiratory conditions such as Emphysema or COPD",
                 "Dementia and other Cognitive Impairment Disorders",
                 "Developmental Disabilities such as Autism, Down's Syndrome, and Spina Bifida",
                 "Diabetes", "Heart Disease, Hypertension", "Human Immunodeficiency Virus Infection (HIV)",
                 "Mental Illnesses, such as Anxiety, Depression, or Schizophrenia",
                 "Other organ failure or diseases such as kidney or liver problems",
                 "Substance Abuse or Addiction Disorders", "Other")
brfss_cg$cg_type_cat <- factor( brfss_cg$cg_type_cat, levels=c(1:13), labels=careprobcode)

# Caregiving Relationship: (reference) Parent
brfss_cg$cg_rel_cat<-relevel(factor(brfss_cg$cg_rel_cat), "Parent", "Child", "Spouse","Sibling",
                             "Grandparent", "Other Fam", "Non-Fam", ref="Parent")

# Dichotomous Non-Biological/Given Family CG Indicator Variable: Non-Family vs. (reference) Other
brfss_cg$cg_nonfam<-relevel(factor(brfss_cg$cg_nonfam), ref="Other")

# Hours per Week of Caregiving: (reference) <8hrs/week
brfss_cg$cg_hrs_cat<-relevel(factor(brfss_cg$cg_hrs_cat), "<8hr/wk", "9-19hr/wk", "20-39hr/wk","40+hr/wk", ref="<8hr/wk")

# Duration of Caregiving: (reference) 5+yrs
brfss_cg$cg_lngth_cat<-relevel(factor(brfss_cg$cg_lngth_cat), "<1mo", "1-6mo", "7mo-2yr","2-5yr", "5+yrs", ref="5+yrs")


## CLEANING VARIABLES
source("brfss_covariate_coding.R")

## CREATING NEW DATAFRAME OF JUST VARIABLES FOR ANALYSIS
brfss_cg_clean <- brfss_cg %>%
  select(cg,cg_d,cg_type_cat, cg_rel_cat, cg_nonfam, cg_hrs_cat, cg_lngth_cat,
         age5yr, millennial,millennial_d,race,marstat,lgb_d,genmin_d,sgm_d,numchild,
         income,education,employed,
         diabetes, smoking, binge_drink,physact,sleephrs,
         SRH_d,Days_Phys,Days_Ment,Days_Poor,
         X.PSU, X.STSTR, CG_WT_RAW
         )
#rm(brfss_cg)






