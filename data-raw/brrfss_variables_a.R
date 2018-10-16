library(tidyverse)

## BRING IN DATA FROM 2013 - 2017


#---------------------------------------#
#           Demographics
#   Age, Sex, Race, Marital Status,
#   Number of Children, Veterans Status
#---------------------------------------#

brrfss_covariates<-brrfss_covariates %>%

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
                             if_else(X_AGE80 >= 80 & X_AGE80 < 85, "80-84",
                             if_else(X_AGE80 >= 85 & X_AGE80 < 90, "85-89",
                             if_else(X_AGE80 >= 90 & X_AGE80 < 95, "90-95",
                             if_else(X_AGE80 >= 95 & X_AGE80 < 100, "95-99",NA_character_)))))))))))))))))
         ) %>%

## Dichotomous/Binary: Millennial (18-35 vs. 36+); 45+ vs 18-44; 65+ vs 18-64
  mutate(millennial_d_num=as.numeric(if_else(year==2013, if_else(age_num %in% 18:32,1,0),
                                     if_else(year==2014, if_else(age_num %in% 18:33,1,0),
                                     if_else(year==2015, if_else(age_num %in% 18:34,1,0),
                                     if_else(year==2016, if_else(age_num %in% 19:35,1,0),
                                     if_else(year==2017, if_else(age_num %in% 20:36,1,0), NA_real_)))))),

        millennial_d_fct=as.factor(if_else(millennial_d_num==1, "Yes",
                                           if_else(millennial_d_num==0, "No", NA_character_))),

        agege45_d_num=as.numeric(if_else(age_num %in% 18:44, 0,
                                            if_else(age_num>=45,1, NA_real_))),

        agege45_d_num=as.factor(if_else(age_num %in% 18:44, "No",
                                           if_else(age_num>=45,"Yes", NA_character_))),

        agege65_d_num=as.numeric(if_else(age_num %in% 18:64, 0,
                                         if_else(age_num>=65,1, NA_real_))),

        agege65_d_num=as.factor(if_else(age_num %in% 18:64, "No",
                                        if_else(age_num>=65,"Yes", NA_character_)))
        ) %>%


# Sex
  mutate(sex_d_fct = as.factor(if_else(SEX == 1, "Male",
                               if_else(SEX == 2, "Female", NA_character_))),
         fem_d_num = as.numeric(if_else(SEX == 1, 0,
                                if_else(SEX == 2, 1, NA_real_)))) %>%

# Race/Ethnicity (X_RACEGR3, X_MRACE1 & X_HISPANC)
    mutate(race_cat_fct=if_else(X_MRACE1 %in% 77:99,NA, X_MRACE1))%>%
    mutate(race_cat_fct=factor(X_MRACE1, levels = c(1:7),
            labels = c("White only", "Black or African American only",
                       "American Indian or Alaskan Native only", "Asian only",
                       "Native Hawaiian or other Pacific Islander only", "Other race only",
                       "Multiracial")) ) %>%

    mutate(raceth_cat_fct = as.factor(ifelse(X_RACEGR3 == 1, "White, Non-Hispanic",
                                      ifelse(X_RACEGR3 == 2, "Black, Non-Hispanic",
                                      ifelse(X_RACEGR3 == 3, "Other, Non-Hispanic",
                                      ifelse(X_RACEGR3 == 4, "Multiple, Non-Hispanic",
                                      ifelse(X_RACEGR3 == 5, "Hispanic", NA))))))) %>%

    mutate(ethn_cat_fct = as.factor(if_else(X_HISPANC == 1, "Hispanic",
                                     if_else(X_HISPANC == 2, "Non-Hispanic", NA_character_)))) %>%


# Marital Status (MARITAL)
    mutate(mstat_cat_fct=as.factor(if_else(MARITAL==1, "Married",
                            if_else(MARITAL==2, "Divorced",
                            if_else(MARITAL==3, "Widowed",
                            if_else(MARITAL==4, "Separated",
                            if_else(MARITAL==5, "Never Married",
                            if_else(MARITAL==6, "Coupled",NA_character_))))))),
      mstat_d_fct=as.factor(if_else(MARITAL==1, "Married",
                            if_else(MARITAL %in% 2:6, "Non-Married",NA_character_)))
      ) %>%

# Number of Children (CHILDREN)
     mutate(chld_num = as.numeric(ifelse(CHILDREN %in% 1:87, CHILDREN,
                                  ifelse(CHILDREN == 88, 0, NA))),
            chld_cat_fct = as.factor(if_else(X_CHLDCNT==1, "None",
                                 if_else(X_CHLDCNT==2, "One",
                                 if_else(X_CHLDCNT %in% 3:6, "Two or More", NA_character_ ))))
       ) %>%
# Veteran Status (VETERAN3)
    mutate(vtrn_d_num=if_else(VETERAN3==2,0,
                      if_else(VETERAN3==1,1,NA_real_)),
          vtrn_d_fct=if_else(VETERAN3==2,"Non-Veteran",
                      if_else(VETERAN3==1,"Veteran",NA_character_))
      ) %>%


#---------------------------------------#
#         SOCIOECONOMIC STATUS
#   Employment Status, Income
#   Education
#---------------------------------------#

# Employment
     mutate(EMPLOY2 = ifelse(EMPLOY1 %in% 3:4, 0,
                      ifelse(EMPLOY1 == 9, NA_real_, EMPLOY1))) %>%
     mutate(empl_cat_fct = factor(EMPLOY2, levels = c(0,1,2,5,6,7,8),
                             labels = c("Out of work", "Employed for wages", "Self-employed",
                                        "A homemaker", "A student", "Retired", "Unable to work"))
       ) %>%


# Income
    mutate(INCOME3 = ifelse(INCOME2 %in% 77:99, 9, INCOME2)) %>%
    mutate(inc_cat_fct = factor(INCOME3, levels = c(1:9),
          labels = c("<$10,000", "$10,000-$14,999",
            "$15,000-19,999", "$20,000-$24,999",
            "$25,000-34,999", "$35,000-$49,999",
            "$50,000-74,999", "$75,000+",
            "Don't know or refused"))

      ) %>%

# Education
    mutate(educ_cat_fct = as.factor(if_else(X_EDUCAG==1, "<High School",
                                    if_else(X_EDUCAG==2, "High School",
                                    if_else(X_EDUCAG==3, "Some College",
                                    if_else(X_EDUCAG==4, "College or More",NA_character_)))))
      ) %>%


#---------------------------------------#
#           HEALTH BEHAVIORS
#   Alcohol, BMI, Fruit & Vegetable Intake
#   HIV Risk, Influenza Vaccine,
#   Physical Activity, Smoking Status
#---------------------------------------#

#Alcohol
##Heavy Drinking / Binge Drinking

  mutate(drnkhvy_d_fct = as.factor(ifelse(x_rfdrhv5 == 1, "No",
                                   ifelse(x_rfdrhv5 == 2, "Yes", NA_character_))),
         drnkbng_d_fct = as.factor(if_else(X_RFBING5 == 1,"No",
                                   if_else(X_RFBING5 == 2,"Yes",NA_character_)))

         ) %>%

#BMI
  mutate(bmi_cat_fct = as.factor(if_else(X_BMI5CAT == 1, "Underweight",
                        if_else(X_BMI5CAT == 2, "Normal Weight",
                        if_else(X_BMI5CAT == 3, "Overweight",
                        if_else(X_BMI5CAT == 4, "Obese",
                        if_else(is.na(X_BMI5CAT), "Unknown", NA_character_))))))
  ) %>%

#Smoking
  mutate(smk_cat_fct = as.factor(if_else(X_SMOKER3 %in% 1:2, "Current smoker",
                          if_else(X_SMOKER3==3, "Former smoker",
                          if_else(X_SMOKER3==4, "Never smoker",NA_character_ ))))
        ) %>%


#High HIV risk binary variable
    mutate(hiv_d_num = as.numeric(ifelse(HIVRISK == 1, 1,
                                    ifelse(HIVRISK == 2, 0, NA_real_))),
          hiv_d_fct = as.numeric(ifelse(HIVRISK == 1, "Yes",
                                    ifelse(HIVRISK == 2, "No", NA_character_)))
    ) %>%


#Leisure-time physical activity
    mutate(ltpa_d_fct = as.factor(if_else(X_TOTINDA==1, "Yes",
                                  if_else(X_TOTINDA==2, "No",NA_character_)))
    ) %>%


# Influenza Vaccine: Any Vaccine, When, and Where the vaccine happened
    mutate(fluvac_d_fct = as.factor(if_else(FLUSHOT6==1, "Yes",
                                  if_else(FLUSHOT6==2, "No",NA_character_))),
          fluvac_d_num = as.factor(if_else(FLUSHOT6==1, 1,
                                  if_else(FLUSHOT6==2, 0, NA_real_))),

          FLSHTMY3=if_else(FLSHTMY2 %in% 777777:999999, NA_real_, FLSHTMY2),
          fluvac_date_num = mdy(FLSHTMY3),

          IMFVPLAC2=if_else(IMFVPLAC %in% 77:99, NA_real_, IMFVPLAC),
          fluplc_cat_fct=factor(IMFVPLAC2, levels=1:11,
                          labels=c("Doctor's office", "Health dept", "Health center",
                                  "Community center", "Store", "Hospital",
                                  "Emergency room", "Workplace", "Other",
                                  "Canada/Mexico", "School" ))
    ) %>%

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
  mutate(hcplan_d_fct = as.factor(if_else(HLTHPLN == 1, "Yes",
                                  if_else(HLTHPLN == 2, "No", NA_character_)))
  ) %>%

# Time since last checkup
  mutate(chckup_cat_fct = as.factor(if_else(CHECKUP1 == 1, "<1 year",
                                    if_else(CHECKUP1 == 2, "1-2 years",
                                    if_else(CHECKUP1 == 3, "2-5 years",
                                    if_else(CHECKUP1 == 4, "5+ years",
                                    if_else(CHECKUP1 == 8, "Never",NA_character_))))))
  ) %>%

# Time since last dentist visit
  mutate(dntst_cat_fct = as.factor(if_else(LASTDEN3 == 1, "<1 year",
                                   if_else(LASTDEN3 == 2, "1-2 years",
                                   if_else(LASTDEN3 == 3, "2-5 years",
                                   if_else(LASTDEN3 == 4, "5+ years",
                                   if_else(LASTDEN3 == 8, "Never",NA_character_))))))
  ) %>%

#---------------------------------------#
#           HEALTH STATUS
#   Chronic Diseases,
#   Depressive Disorder,
#   Mental & Physcial Health HRQOL,
#   Self-Rated Health
#---------------------------------------#


# Cognitive Function

# Chronic Disease (CVDCRHD4,CVDSTRK3,DIABETE3,ASTHMA3,CHCOCNCR,CHCCOPD1,HAVARTH3)


## Count of Conditions

## Any



# Depressive Disorder
  mutate(dep_d_fct = as.factor(if_else(ADDEPEV2 == 1, "Yes",
                               if_else(ADDEPEV2 == 2, "No", NA_character_))),
        dep_d_num = as.numeric(if_else(ADDEPEV2 == 1, 1,
                               if_else(ADDEPEV2 == 2, 0, NA_real_)))
    ) %>%

# Emotional Support
    mutate(emsup_d_fct=as.factor(if_else(EMTSUPRT %in% 1:3, "Sometimes+",
                            if_else(EMTSUPRT %in% 4:5, "Rarely/Never", NA_character_))),
           emsup_cat_fct=as.factor(if_else(EMTSUPRT==1, "Always",
                            if_else(EMTSUPRT==2, "Usually",
                            if_else(EMTSUPRT==3, "Sometimes",
                            if_else(EMTSUPRT==4, "Rarely",
                            if_else(EMTSUPRT==5, "Never", NA_character_))))))
    ) %>%

# Life Satisfaction

    mutate(lsat_d_fct=as.factor(if_else(LSATISFY %in% 1:2, "Satisfied",
                           if_else(LSATISFY %in% 3:4, "Dissatisfied", NA_character_))),

           lsat_cat_fct=as.factor(if_else(LSATISFY==1, "Very Satisfied",
                            if_else(LSATISFY==2, "Satisfied",
                            if_else(LSATISFY==3, "Dissatisified",
                            if_else(LSATISFY==4, "Very Dissatisified",NA_character_)))))

  ) %>%

# Mental Health QOL
    mutate(mentqol_num = as.numeric(if_else(MENTHLTH == 88, 0,
                                   if_else(MENTHLTH %in% 77:99, NA_real_, MENTHLTH))),

          mentqol14_d_fct = as.factor(if_else(mntqol_num %in% 0:14 , "No",
                                     if_else(mntqol_num %in% 14:30, "Yes", NA_character_)))
      ) %>%

# Physical Health QOL
    mutate(physqol_num = as.numeric(if_else(PHYSHLTH == 88, 0,
                                   if_else(PHYSHLTH %in% 77:99, NA_real_, MENTHLTH))),

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

  )
