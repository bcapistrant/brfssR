library(tidyverse)
library(lubridate)
library(foreign)
library(usethis)
library(devtools)
## BRING IN DATA FROM 2014 - 2017

### 2014
VAR_2014_0<-read.xport("data-raw/LLCP2014.XPT")
data_2014 <- VAR_2014_0 %>%
  mutate(YEAR=2014,
         VERSION_VAR="X_LLCPWT",
         VAR_wt_raw=X_LLCPWT,
         SEQNO=as.integer(SEQNO)) %>%
  mutate_if(is.double, as.integer) %>%
  mutate_if(is.factor, as.character) %>%
select(X_AGE80,MARITAL,CHILDREN,X_CHLDCNT,X_RACEGR3,X_HISPANC,X_MRACE1,X_IMPRACE, SEX,VETERAN3,MSCODE,X_RFBING5,HVYDRNK=X_RFDRHV4,X_BMI5CAT,X_BMI5,
       FLUSHOT6,FLSHTMY2,X_TOTINDA,X_SMOKER3,MEDCOST,HLTHPLN1,CHECKUP1,
       CVDCRHD4,CVDSTRK3,DIABETE3,ASTHMA3,HAVARTH3,CHCCOPD1,CHCOCNCR,
       ADDEPEV2,MENTHLTH,PHYSHLTH,PREGNANT,GENHLTH,EMPLOY1,INCOME2,X_EDUCAG,
       X_STATE,YEAR,SEQNO,VAR_wt_raw,VERSION_VAR,X_PSU, X_STSTR)
rm(VAR_2014_0)


#----------------------------------------------------------------------------------#
### 2015
VAR_2015_0<-read.xport("data-raw/LLCP2015.XPT")
data_2015 <- VAR_2015_0 %>%
  mutate(YEAR=2015,
         VERSION_VAR="X_LLCPWT",
         VAR_wt_raw=X_LLCPWT,
         SEQNO=as.integer(SEQNO)) %>%
  mutate_if(is.double, as.integer) %>%
  mutate_if(is.factor, as.character)%>%
select(X_AGE80,MARITAL,CHILDREN,X_CHLDCNT,X_RACEGR3,X_HISPANC,X_MRACE1, SEX,VETERAN3,MSCODE,X_RFBING5,HVYDRNK=X_RFDRHV5,X_BMI5CAT,X_BMI5,
       FLUSHOT6,FLSHTMY2,X_TOTINDA,X_SMOKER3,MEDCOST,HLTHPLN1,CHECKUP1,
       CVDCRHD4,CVDSTRK3,DIABETE3,ASTHMA3,HAVARTH3,CHCCOPD1,CHCOCNCR,
       ADDEPEV2,MENTHLTH,PHYSHLTH,PREGNANT,GENHLTH,EMPLOY1,INCOME2,X_EDUCAG,
       X_STATE,YEAR,SEQNO,VAR_wt_raw,VERSION_VAR,X_PSU, X_STSTR)
rm(VAR_2015_0)

## 2015 Notes:
### No Imputed Race variable (X_IMPRACE)
### No Dentist Variable (LASTDEN3)
### No HIV risk variable - doesn't start until 2016 (HIVRISK4)
### No Kidney disease variable (CHCKDNY1)

#----------------------------------------------------------------------------------#
### 2016
VAR_2016_0<-read.xport("data-raw/LLCP2016.XPT")
data_2016 <- VAR_2016_0 %>%
  mutate(YEAR=2016,
         VERSION_VAR="X_LLCPWT",
         VAR_wt_raw=X_LLCPWT,
         SEQNO=as.integer(SEQNO)) %>%
  mutate_if(is.double, as.integer) %>%
  mutate_if(is.factor, as.character) %>%
select(X_AGE80,MARITAL,CHILDREN,X_CHLDCNT,X_RACEGR3,X_HISPANC,X_MRACE1, SEX,VETERAN3,MSCODE,X_RFBING5,HVYDRNK=X_RFDRHV5,X_BMI5CAT,X_BMI5,
       HIVRISK=HIVRISK4,FLUSHOT6,FLSHTMY2,X_TOTINDA,X_SMOKER3,MEDCOST,HLTHPLN1,CHECKUP1,LASTDEN3,
       CVDCRHD4,CVDSTRK3,DIABETE3,ASTHMA3,HAVARTH3,CHCCOPD1,CHCOCNCR,
       ADDEPEV2,MENTHLTH,PHYSHLTH,PREGNANT,GENHLTH,EMPLOY1,INCOME2,X_EDUCAG,
       X_STATE,YEAR,SEQNO,VAR_wt_raw,VERSION_VAR,X_PSU, X_STSTR)
rm(VAR_2016_0)

## 2016 Notes:
### No Imputed Race variable (X_IMPRACE)
### No HIV risk variable - doesn't start until 2016 (HIVRISK4)
### No Kidney disease variable (CHCKDNY1)

#----------------------------------------------------------------------------------#
### 2017

VAR_2017_0<-read.xport("data-raw/LLCP2017.XPT")
data_2017 <- VAR_2017_0 %>%
  mutate(YEAR=2017,
         VERSION_VAR="X_LLCPWT",
         VAR_wt_raw=X_LLCPWT,
         SEQNO=as.integer(SEQNO)) %>%
  mutate_if(is.double, as.integer) %>%
  mutate_if(is.factor, as.character) %>%
select(X_AGE80,MARITAL,CHILDREN,X_CHLDCNT,X_RACEGR3,X_HISPANC,X_MRACE1,X_IMPRACE, SEX,VETERAN3,MSCODE,X_RFBING5,HVYDRNK=X_RFDRHV5,X_BMI5CAT,X_BMI5,
       HIVRISK=HIVRISK5,FLUSHOT6,FLSHTMY2,X_TOTINDA,X_SMOKER3,MEDCOST,HLTHPLN1,CHECKUP1,
       CVDCRHD4,CVDSTRK3,DIABETE3,ASTHMA3,HAVARTH3,CHCCOPD1,CHCOCNCR,
       ADDEPEV2,MENTHLTH,PHYSHLTH,PREGNANT,GENHLTH,EMPLOY1,INCOME2,X_EDUCAG,
       X_STATE,YEAR,SEQNO,VAR_wt_raw,VERSION_VAR,X_PSU, X_STSTR)
rm(VAR_2017_0)

## 2017 Notes:
### No Imputed Race variable (X_IMPRACE)
### No HIV risk variable - doesn't start until 2016 (HIVRISK4)
### No Kidney disease variable (CHCKDNY1)

#----------------------------------------------------------------------------------#
### 2018

VAR_2018_0<-read.xport("data-raw/LLCP2018.XPT")
data_2018 <- VAR_2018_0 %>%
  mutate(YEAR=2018,
         VERSION_VAR="X_LLCPWT",
         VAR_wt_raw=X_LLCPWT,
         SEQNO=as.integer(SEQNO)) %>%
  mutate_if(is.double, as.integer) %>%
  mutate_if(is.factor, as.character) %>%
select(X_AGE80,MARITAL,CHILDREN,X_CHLDCNT,X_RACEGR3,X_HISPANC,X_MRACE1,X_IMPRACE, SEX=SEX1,VETERAN3,MSCODE,X_RFBING5,HVYDRNK=X_RFDRHV6,X_BMI5CAT,X_BMI5,
       HIVRISK=HIVRISK5,FLUSHOT6,FLSHTMY2,X_TOTINDA,X_SMOKER3,MEDCOST,HLTHPLN1,CHECKUP1,
       CVDCRHD4,CVDSTRK3,DIABETE3,ASTHMA3,HAVARTH3,CHCCOPD1,CHCOCNCR,CHCKDNY1,
       ADDEPEV2,MENTHLTH,PHYSHLTH,PREGNANT,GENHLTH,EMPLOY1,INCOME2,X_EDUCAG,X_METSTAT,X_URBSTAT,
       X_STATE,YEAR,SEQNO,VAR_wt_raw,VERSION_VAR,X_PSU, X_STSTR)
rm(VAR_2018_0)
table(data_2018$HVYDRNK,useNA = c("always"))
## 2018 Notes:
### No Imputed Race variable (X_IMPRACE)
### Sex renamed from SEX1 (now includes "Sex assigned at birth")
### Heavy Drinking Changed and renamed

### 2019

VAR_2019_0<-read.xport("data-raw/LLCP2018.XPT")
data_2019 <- VAR_2019_0 %>%
  mutate(YEAR=2019,
         VERSION_VAR="X_LLCPWT",
         VAR_wt_raw=X_LLCPWT,
         SEQNO=as.integer(SEQNO)) %>%
  mutate_if(is.double, as.integer) %>%
  mutate_if(is.factor, as.character) %>%
select(X_AGE80,MARITAL,CHILDREN,X_CHLDCNT,X_RACEGR3,X_HISPANC,X_MRACE1,X_IMPRACE, SEX=SEX1,VETERAN3,MSCODE,X_RFBING5,HVYDRNK=X_RFDRHV6,X_BMI5CAT,X_BMI5,
       HIVRISK=HIVRISK5,FLUSHOT6,FLSHTMY2,X_TOTINDA,X_SMOKER3,MEDCOST,HLTHPLN1,CHECKUP1,
       CVDCRHD4,CVDSTRK3,DIABETE3,ASTHMA3,HAVARTH3,CHCCOPD1,CHCOCNCR,CHCKDNY1,
       ADDEPEV2,MENTHLTH,PHYSHLTH,PREGNANT,GENHLTH,EMPLOY1,INCOME2,X_EDUCAG,X_METSTAT,X_URBSTAT,
       X_STATE,YEAR,SEQNO,VAR_wt_raw,VERSION_VAR,X_PSU, X_STSTR)
rm(VAR_2019_0)
table(data_2019$HVYDRNK,useNA = c("always"))

#----------------------------------------------------------------------------------#

table(data_2014$SEX,useNA = c("always"))
table(data_2015$SEX,useNA = c("always"))
table(data_2016$SEX,useNA = c("always"))
table(data_2017$SEX,useNA = c("always"))
table(data_2018$SEX,useNA = c("always"))
table(data_2019$SEX,useNA = c("always"))

### COMBINING 2014-2018
brfss_VAR<-bind_rows(data_2019,data_2018,data_2017,data_2016,data_2015,data_2014)

table(brfss_VAR$SEX,useNA = c("always"))
table(data_2018$HVYDRNK,useNA = c("always"))

varstates<-c(1,2,4,5,6,8,9,10,
              11,12,13,15,16,17,18,19,20,
              21,22,23,24,25,26,27,28,29,30,
              31,32,33,34,35,36,37,38,39,40,
              41,42,44,45,46,47,48,49,50,
              51,53,54,55,56,66,72,78)
varstatelabel<-c("AL","AK","AZ","AR","CA","CO","CT","DE",
                 "DC","FL","GA","HI","ID","IL","IN","IA","KS",
                 "KY","LA","ME","MD","MA","MI","MN","MS","MO","MT",
                 "NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK",
                 "OR","PA","RI","SC","SD","TN","TX","UT","VT",
                 "VA","WA","WV","WI","WY","GU","PR","VI")
brfss_VAR$state<- factor(brfss_VAR$X_STATE, levels=varstates, labels=varstatelabel)

brfss_VAR1<-brfss_VAR%>%
mutate(fips=X_STATE) %>%
select(X_AGE80,MARITAL,CHILDREN,X_CHLDCNT,X_RACEGR3,X_HISPANC,X_MRACE1,SEX,VETERAN3,MSCODE,X_RFBING5,HVYDRNK,X_BMI5CAT,X_BMI5,
       HIVRISK,FLUSHOT6,FLSHTMY2,X_TOTINDA,X_SMOKER3,MEDCOST,HLTHPLN1,CHECKUP1,LASTDEN3,
       CVDCRHD4,CVDSTRK3,DIABETE3,ASTHMA3,HAVARTH3,CHCCOPD1,CHCOCNCR,CHCKDNY1,
       ADDEPEV2,MENTHLTH,PHYSHLTH,PREGNANT,GENHLTH,EMPLOY1,INCOME2,X_EDUCAG,X_METSTAT,X_URBSTAT,
       fips,X_STATE,state,YEAR,SEQNO,VAR_wt_raw,VERSION_VAR,X_PSU, X_STSTR)

rm(data_2019,data_2018,data_2017,data_2016,data_2015,data_2014,brfss_VAR)
#---------------------------------------#
#           FUNCTIONS
#---------------------------------------#
binary_d_num<-function(x) {
  ifelse(x==2,0,
  ifelse(x==1,1,NA_real_))
}

binary_d_fct<-function(x) {
  factor(
    ifelse(x==2,"No",
    ifelse(x==1,"Yes",NA_character_))
  )
}

rawnames = c("CVDCRHD4","CVDSTRK3","DIABETE3","ASTHMA3","CHCOCNCR","CHCCOPD1","HAVARTH3")
newnames = c("cvd","strk","diab","asth","cncr","copd","arth")
lastnames = c("cvd_d_num","strk_d_num","diab_d_num","asth_d_num","cncr_d_num","copd_d_num","arth_d_num")




brfss_covariates<-brfss_VAR1 %>%

#---------------------------------------#
#           Demographics
#   Age, Sex, Race, Marital Status,
#   Number of Children, Veterans Status,
#   Metropolitan Service Area
#---------------------------------------#


# Age
## Quantitative / Numeric
  mutate(age_num=X_AGE80) %>%

## Categorical - five year categories
  mutate(age_cat = as.factor(if_else(X_AGE80 >= 18 & X_AGE80 < 25, "18-24",
                             if_else(X_AGE80 >= 25 & X_AGE80 < 30, "25-29",
                             if_else(X_AGE80 >= 30 & X_AGE80 < 35, "30-34",
                             if_else(X_AGE80 >= 35 & X_AGE80 < 40, "35-39",
                             if_else(X_AGE80 >= 40 & X_AGE80 < 45, "40-44",
                             if_else(X_AGE80 >= 45 & X_AGE80 < 50, "45-49",
                             if_else(X_AGE80 >= 50 & X_AGE80 < 55, "50-54",
                             if_else(X_AGE80 >= 55 & X_AGE80 < 60, "55-59",
                             if_else(X_AGE80 >= 60 & X_AGE80 < 65, "60-64",
                             if_else(X_AGE80 >= 65 & X_AGE80 < 70, "65-69",
                             if_else(X_AGE80 >= 70 & X_AGE80 < 75, "70-74",
                             if_else(X_AGE80 >= 75 & X_AGE80 < 80, "75-79",
                             if_else(X_AGE80 >= 80 & X_AGE80 < 85, "80+", NA_character_))))))))))))))
         ) %>%

## Categorical - 10 year categories
  mutate(age_10ycat_fct=as.factor(if_else(age_num %in% 18:24, "18-24",
                                 if_else(age_num %in% 25:34, "25-34",
                                 if_else(age_num %in% 35:44, "35-44",
                                 if_else(age_num %in% 45:54, "45-54",
                                 if_else(age_num %in% 55:64, "55-64",
                                 if_else(age_num >=65, "65+",NA_character_)))))))) %>%

## Dichotomous/Binary: Millennial (18-35 vs. 36+); 45+ vs 18-44; 65+ vs 18-64
  mutate(millennial_d_num=as.numeric(if_else(YEAR==2013, if_else(age_num %in% 18:32,1,0),
                                     if_else(YEAR==2014, if_else(age_num %in% 18:33,1,0),
                                     if_else(YEAR==2015, if_else(age_num %in% 18:34,1,0),
                                     if_else(YEAR==2016, if_else(age_num %in% 19:35,1,0),
                                     if_else(YEAR==2017, if_else(age_num %in% 20:36,1,0), NA_real_)))))),

        millennial_d_fct=as.factor(if_else(millennial_d_num==1, "Yes",
                                           if_else(millennial_d_num==0, "No", NA_character_))),

        agege45_d_num=as.numeric(if_else(age_num %in% 18:44, 0,
                                            if_else(age_num>=45,1, NA_real_))),

        agege45_d_fct=as.factor(if_else(age_num %in% 18:44, "No",
                                           if_else(age_num>=45,"Yes", NA_character_))),

        agege65_d_num=as.numeric(if_else(age_num %in% 18:64, 0,
                                         if_else(age_num>=65,1, NA_real_))),

        agege65_d_fct=as.factor(if_else(age_num %in% 18:64, "No",
                                        if_else(age_num>=65,"Yes", NA_character_)))
        ) %>%


# Sex
  mutate(sex_d_fct = as.factor(if_else(SEX == 1, "Male",
                               if_else(SEX == 2, "Female", NA_character_))),
         fem_d_num = as.numeric(if_else(SEX == 1, 0,
                                if_else(SEX == 2, 1, NA_real_)))
        ) %>%

# Race/Ethnicity (X_RACEGR3, X_MRACE1 & X_HISPANC)
    mutate(race_cat_fct=as.factor(if_else(X_MRACE1==1, "White only",
                                  if_else(X_MRACE1==2, "Black or African American only",
                                  if_else(X_MRACE1==3, "American Indian or Alaskan Native only",
                                  if_else(X_MRACE1==4, "Asian only",
                                  if_else(X_MRACE1==5, "Native Hawaiian or other Pacific Islander only",
                                  if_else(X_MRACE1==6, "Other race only",
                                  if_else(X_MRACE1==7, "Multiracial", NA_character_))))))))

          ) %>%

    mutate(raceth_cat_fct = as.factor(ifelse(X_RACEGR3 == 1, "White, Non-Hispanic",
                                      ifelse(X_RACEGR3 == 2, "Black, Non-Hispanic",
                                      ifelse(X_RACEGR3 == 3, "Other, Non-Hispanic",
                                      ifelse(X_RACEGR3 == 4, "Multiple, Non-Hispanic",
                                      ifelse(X_RACEGR3 == 5, "Hispanic",
                                      ifelse(X_RACEGR3 == 9, "DK/Refused", NA_character_)))))))) %>%

    mutate(ethn_cat_fct = as.factor(if_else(X_HISPANC == 1, "Hispanic",
                                     if_else(X_HISPANC == 2, "Non-Hispanic", NA_character_)))

      ) %>%


# Marital Status (MARITAL)
    mutate(mstat_cat_fct=as.factor(if_else(MARITAL==1, "Married",
                            if_else(MARITAL==2, "Divorced",
                            if_else(MARITAL==3, "Widowed",
                            if_else(MARITAL==4, "Separated",
                            if_else(MARITAL==5, "Never Married",
                            if_else(MARITAL==6, "Coupled",NA_character_))))))),
      mstat_d_fct=as.factor(if_else(MARITAL==1, "Married",
                            if_else(MARITAL %in% 2:6, "Non-Married",NA_character_))) ) %>%

     mutate(married_d_fct=as.factor(if_else(mstat_cat_fct %in% c("Married", "Coupled"), "Married",
                          if_else(mstat_cat_fct %in% c("Divorced", "Never Married", "Separated", "Widowed"), "Not Married", NA_character_))),
      ) %>%

# Number of Children (CHILDREN)
     mutate(chld_num = as.numeric(ifelse(CHILDREN %in% 1:87, CHILDREN,
                                  ifelse(CHILDREN == 88, 0, NA_real_))),
            chld_cat_fct = as.factor(if_else(X_CHLDCNT==1, "None",
                                 if_else(X_CHLDCNT==2, "One",
                                 if_else(X_CHLDCNT %in% 3:6, "Two or More", NA_character_ ))))) %>%

     mutate(kids_d_fct = as.factor(if_else(X_CHLDCNT==1, "No",
                                 if_else(X_CHLDCNT %in% 2:6, "Yes", NA_character_ )))
       ) %>%
# Veteran Status (VETERAN3)
    mutate(vtrn_d_num=if_else(VETERAN3==2,0,
                      if_else(VETERAN3==1,1,NA_real_)),
          vtrn_d_fct=as.factor(if_else(VETERAN3==2,"Non-Veteran",
                      if_else(VETERAN3==1,"Veteran",NA_character_)))
      ) %>%

# Metropolitan Service Area (MSA)
    mutate(msa_cat_fct=as.factor(if_else(MSCODE==1, "City_Center",
                                  if_else(MSCODE==2, "City_County",
                                  if_else(MSCODE==3, "Suburb",
                                  if_else(MSCODE==5, "Outside MSA",NA_character_))))),
           msa_d_fct=as.factor(if_else(MSCODE %in% 1:3, "Inside MSA",
                                  if_else(MSCODE==5, "Outside MSA",NA_character_)))

      ) %>%
      # Urban and Metropolitcan Counties (only in 2018 data)
      mutate(metro_d_fct=as.factor(if_else(X_METSTAT==1, "Yes",
                                   if_else(X_METSTAT==2, "No", NA_character_))),
             urban_d_fct=as.factor(if_else(X_URBSTAT==1, "Yes",
                                   if_else(X_URBSTAT==2, "No", NA_character_)))

      ) %>%
#---------------------------------------#
#         SOCIOECONOMIC STATUS
#   Employment Status, Income
#   Education
#---------------------------------------#

# Employment
     mutate(empl_cat_fct = as.factor(
                      ifelse(EMPLOY1==1, "Employed for wages",
                      ifelse(EMPLOY1==2, "Self-Employed",
                      ifelse(EMPLOY1 %in% 3:4, "Out of work",
                      ifelse(EMPLOY1==5, "Homemaker",
                      ifelse(EMPLOY1==6, "Student",
                      ifelse(EMPLOY1==7, "Retired",
                      ifelse(EMPLOY1== 8, "Unable", NA_character_ ))))))))) %>%

     mutate(employed_d_fct=as.factor(if_else(empl_cat_fct %in% c("Employed for wages","Self-employed"), "Yes", "No/Missing"))
       ) %>%


# Income
    mutate(INCOME3 = ifelse(INCOME2 %in% 77:99, 9, INCOME2)) %>%
    mutate(inc_cat_fct = factor(INCOME3, levels = c(1:9),
          labels = c("<$10,000", "$10,000-$14,999",
            "$15,000-19,999", "$20,000-$24,999",
            "$25,000-34,999", "$35,000-$49,999",
            "$50,000-74,999", "$75,000+",
            "Don't know or refused")) ) %>%
    mutate(income_4cats_fct=as.factor(if_else(inc_cat_fct %in% c("<$10,000","$10,000-$14,999","$15,000-19,999"), "<$20,000",
                        if_else(inc_cat_fct %in% c("$20,000-$24,999","$25,000-34,999"), "$20,000-34,999",
                        if_else(inc_cat_fct %in% c("$35,000-$49,999","$50,000-74,999"), "$35,000-74,999",
                        if_else(inc_cat_fct=="$75,000+", "$75,000+",
                        if_else(inc_cat_fct=="Don't know or refused", "Missing", NA_character_))))))

      ) %>%

# Education
    mutate(educ_cat_fct = as.factor(if_else(X_EDUCAG==1, "<High School",
                                    if_else(X_EDUCAG==2, "High School",
                                    if_else(X_EDUCAG==3, "Some College",
                                    if_else(X_EDUCAG==4, "College or More",NA_character_)))))) %>%

    mutate(college_d_fct=as.factor(if_else(educ_cat_fct=="College or More", "College",
                            if_else(educ_cat_fct %in% c("<High School", "High School", "Some College"), "<College", NA_character_)))
      ) %>%
#---------------------------------------#
#           HEALTH BEHAVIORS
#   Alcohol, BMI, Fruit & Vegetable Intake
#   HIV Risk, Influenza Vaccine,
#   Physical Activity, Smoking Status
#---------------------------------------#

#Alcohol
##Heavy Drinking / Binge Drinking

  mutate(drnkhvy_d_fct = as.factor(ifelse(HVYDRNK == 1, "No",
                                   ifelse(HVYDRNK == 2, "Yes", NA_character_))),
         drnkbng_d_fct = as.factor(if_else(X_RFBING5 == 1,"No",
                                   if_else(X_RFBING5 == 2,"Yes",NA_character_)))

         ) %>%

#BMI
  ## Numeric
  mutate(bmi_num = as.numeric(X_BMI5/100)  ) %>%

  ## Categories
  mutate(bmi_cat_fct = as.factor(if_else(X_BMI5CAT == 1, "Underweight",
                        if_else(X_BMI5CAT == 2, "Normal Weight",
                        if_else(X_BMI5CAT == 3, "Overweight",
                        if_else(X_BMI5CAT == 4, "Obese",
                        if_else(is.na(X_BMI5CAT), "Unknown", NA_character_)))))),

         bmi_40d_fct = as.factor(if_else(bmi_num %in% 0:40, "<40",
                        if_else(bmi_num>=40, ">=40", NA_character_)))) %>%

  mutate(obese_d_fct=as.factor(if_else(X_BMI5CAT == 4, "Yes","No"))) %>%

#Smoking
  mutate(smk_cat_fct = as.factor(if_else(X_SMOKER3 %in% 1:2, "Current smoker",
                          if_else(X_SMOKER3==3, "Former smoker",
                          if_else(X_SMOKER3==4, "Never smoker",
                          if_else(X_SMOKER3==9, "DK/Refused",NA_character_ ))))),
         smoker_d_fct=as.factor(if_else(X_SMOKER3 %in% 1:2, "Smoker",
                               if_else(X_SMOKER3 %in% 3:9, "Non-Smoker", NA_character_)))
        ) %>%


#High HIV risk binary variable
    mutate(hiv_d_num = as.numeric(ifelse(HIVRISK == 1, 1,
                                    ifelse(HIVRISK == 2, 0, NA_real_))),
          hiv_d_fct = as.factor(ifelse(HIVRISK == 1, "Yes",
                                    ifelse(HIVRISK == 2, "No", NA_character_)))
    ) %>%


#Leisure-time physical activity
    mutate(ltpa_d_fct = as.factor(if_else(X_TOTINDA==1, "Yes",
                                  if_else(X_TOTINDA==2, "No",NA_character_))),
          ltpa_cat_fct = as.factor(if_else(X_TOTINDA==1, "Yes",
                                  if_else(X_TOTINDA==2, "No",
                                  if_else(X_TOTINDA %in% 7:9, "DK/Refused",NA_character_))))

    ) %>%


# Influenza Vaccine: Any Vaccine, When, and Where the vaccine happened
    mutate(fluvac_cat_fct = as.factor(if_else(FLUSHOT6==1, "Yes",
                                  if_else(FLUSHOT6==2, "No", "DK/Refused"))),
          fluvac_d_fct = as.factor(if_else(FLUSHOT6==1, "Yes",
                                  if_else(FLUSHOT6==2, "No",NA_character_))),
         fluvac_d_num = as.numeric(if_else(FLUSHOT6==1, 1,
                                  if_else(FLUSHOT6==2, 0, NA_real_)))

          #FLSHTMY3=if_else(FLSHTMY2 %in% 777777:999999, NA_real_, FLSHTMY2),
          #fluvac_date_num = mdy(FLSHTMY3)

          # IMFVPLAC2=if_else(IMFVPLAC %in% 77:99, NA_real_, IMFVPLAC),
          # fluplc_cat_fct=factor(IMFVPLAC2, levels=1:11,
          #                 labels=c("Doctor's office", "Health dept", "Health center",
          #                        "Community center", "Store", "Hospital",
          #                        "Emergency room", "Workplace", "Other",
          #                        "Canada/Mexico", "School" ))
    )  %>%
#---------------------------------------#
#           HEALTH CARE
#   Doctor Cost, Health Care Coverage,
#   Time since last checkup,
#   Time since last dentist visit
#---------------------------------------#

# Cost prevented needed doctor visit
  mutate(drcost_d_fct = as.factor(if_else(MEDCOST == 1, "Yes",
                                  if_else(MEDCOST == 2, "No", NA_character_)))
    ) %>%


# Health Care Coverage
  mutate(hcplan_cat_fct = as.factor(if_else(HLTHPLN1 == 1, "Yes",
                                  if_else(HLTHPLN1 == 2, "No",
                                    if_else(HLTHPLN1  %in% 7:9, "DK/Refused",NA_character_)))),
    hcplan_d_fct = as.factor(if_else(HLTHPLN1 == 1, "Yes",
                                  if_else(HLTHPLN1 == 2, "No", NA_character_)))
  ) %>%

# Time since last checkup
  mutate(chckup_cat_fct = as.factor(if_else(CHECKUP1 == 1, "<1 year",
                                    if_else(CHECKUP1 == 2, "1-2 years",
                                    if_else(CHECKUP1 == 3, "2-5 years",
                                    if_else(CHECKUP1 == 4, "5+ years",
                                    if_else(CHECKUP1 == 8, "Never",
                                    if_else(CHECKUP1 == 7 | CHECKUP1 == 9, "DK/Refused",NA_character_))))))),
        drlastyr_d_fct=as.factor(if_else(CHECKUP1 == 1, "<1 year",
                               if_else(CHECKUP1 != 1,  "No", NA_character_)))
  ) %>%

#---------------------------------------#
#           HEALTH STATUS
#   Chronic Diseases,
#   Depressive Disorder,
#   Mental & Physcial Health HRQOL,
#   Self-Rated Health
#   Pregnant
#---------------------------------------#


# Chronic Disease (CVDCRHD4,CVDSTRK3,DIABETE3,ASTHMA3,CHCOCNCR,CHCCOPD1,HAVARTH3)
### These lists - rawnames, newnames, and lastnames - were defined at the top of the file under "functions"
### This code is to: 1. change the raw BRFSS names into brief, conceptual names; 2. revise the name to include that it's a dichotomous, numeric variable

    rename_at(.vars=vars(rawnames), ~ newnames) %>%
    rename_at(.vars=vars(newnames),
            function(z) paste0(z,"_d_num")) %>%
     mutate_at(.vars=vars(lastnames),
            .funs = binary_d_num) %>%

## Count of Conditions
    mutate(chron_num = rowSums(.[lastnames], na.rm = TRUE)) %>%
## Any
    mutate(chron_d_fct = ifelse(chron_num>=1,"Yes","No")) %>%




#Kidney Disease
    mutate(kidn_d_fct = as.factor(if_else(CHCKDNY1 == 1, "Yes",
                               if_else(CHCKDNY1 == 2, "No", NA_character_))),
        kidn_d_num = as.numeric(if_else(CHCKDNY1 == 1, 1,
                               if_else(CHCKDNY1 == 2, 0, NA_real_)))
    ) %>%

# Depressive Disorder
  mutate(dep_d_fct = as.factor(if_else(ADDEPEV2 == 1, "Yes",
                               if_else(ADDEPEV2 == 2, "No", NA_character_))),
        dep_d_num = as.numeric(if_else(ADDEPEV2 == 1, 1,
                               if_else(ADDEPEV2 == 2, 0, NA_real_)))
    ) %>%


# Mental Health QOL

  mutate(mentqol_num = MENTHLTH,
        mentqol_num = replace(mentqol_num, mentqol_num==88, 0),
        mentqol_num = replace(mentqol_num, mentqol_num %in% c(77,99), NA) )%>%
    mutate(mentqol14_d_num = as.numeric(if_else(mentqol_num %in% 0:14, 0,
                                     if_else(mentqol_num %in% 14:30, 1, NA_real_))),
          mentqol14_d_fct = as.factor(if_else(mentqol_num %in% 0:14 , "No",
                                     if_else(mentqol_num %in% 14:30, "Yes", NA_character_)))
      ) %>%

# Physical Health QOL
    mutate(physqol_num = PHYSHLTH,
        physqol_num = replace(physqol_num, physqol_num==88, 0),
        physqol_num = replace(physqol_num, physqol_num %in% c(77,99), NA) ) %>%

    mutate(physqol14_d_num = as.numeric(if_else(physqol_num %in% 0:14, 0,
                                     if_else(physqol_num %in% 14:30, 1, NA_real_))),
           physqol14_d_fct = as.factor(if_else(physqol_num %in% 0:14, "No",
                                     if_else(physqol_num %in% 14:30, "Yes", NA_character_)))
      ) %>%

# Self-Rated Health
    mutate(srh_d_fct=as.factor(if_else(GENHLTH %in% 1:3, "Good+",
                           if_else(GENHLTH %in% 4:5, "Fair/Poor", NA_character_))),

           srh_cat_fct=as.factor(if_else(GENHLTH==1, "Excellent",
                            if_else(GENHLTH==2, "Very Good",
                            if_else(GENHLTH==3, "Good",
                            if_else(GENHLTH==4, "Fair",
                            if_else(GENHLTH==5, "Poor", NA_character_))))))
           ) %>%

# Pregnant
    mutate(preg_d_fct=as.factor(if_else(PREGNANT==1, "Yes",
                           if_else(PREGNANT==2, "No", NA_character_)))

  ) %>%
    rename_all(tolower)


#table(brfss_covariates$sex,useNA = c("always"))
#table(brfss_covariates$fem_d_num,useNA = c("always"))
#table(brfss_covariates$sex_d_fct,useNA = c("always"))


brfss_core<-brfss_covariates %>%
  select(
    age_num,age_cat,age_10ycat_fct,
    millennial_d_num,millennial_d_fct,
    agege45_d_num,agege45_d_fct,
    agege65_d_num,agege65_d_fct,
    mstat_cat_fct,mstat_cat_fct,married_d_fct,
    chld_num,chld_cat_fct,kids_d_fct,
    race_cat_fct,ethn_cat_fct,raceth_cat_fct,
    sex_d_fct,fem_d_num,
    vtrn_d_num,vtrn_d_fct,
    msa_cat_fct,msa_d_fct,
    metro_d_fct,urban_d_fct,
    drnkbng_d_fct,drnkhvy_d_fct,
    bmi_cat_fct, bmi_40d_fct, bmi_num,obese_d_fct,
    hiv_d_num,hiv_d_fct,
    fluvac_cat_fct,fluvac_d_fct,fluvac_d_num,
    ltpa_d_fct,ltpa_cat_fct,
    smk_cat_fct,smoker_d_fct,
    drcost_d_fct,
    hcplan_d_fct,hcplan_cat_fct,
    chckup_cat_fct,drlastyr_d_fct,
    chron_num,chron_d_fct,cvd_d_num,strk_d_num,diab_d_num,asth_d_num,arth_d_num,copd_d_num,cncr_d_num,kidn_d_num,
    dep_d_fct,
    mentqol_num,mentqol14_d_num,mentqol14_d_fct,
    physqol_num,physqol14_d_num,physqol14_d_fct,
    srh_d_fct,srh_cat_fct,
    preg_d_fct,
    empl_cat_fct,employed_d_fct,
    inc_cat_fct,income_4cats_fct,
    educ_cat_fct,college_d_fct,
    x_state,state,fips,year,seqno,x_psu,x_ststr,
    var_wt_raw,version_var
  )

    rm(brfss_covariates,brfss_VAR1)
rm(brfss_covariates2)

table(brfss_core$employed_d_fct,useNA = c("always"))


#save(brfss_core, file = "data/brfss_core.rda", compress = "bzip2", version=2)
  use_data(brfss_core, overwrite = TRUE,compress = "bzip2")
