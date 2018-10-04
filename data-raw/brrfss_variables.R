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
                                     if_else(year==2017, if_else(age_num %in% 20:36,1,0), NA_real_))))))

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
  mutate(sex_d_fct = as.factor(ifelse(SEX == 1, "Male", "Female"))) %>%

# Race (X_RACEGR3 OR X_MRACE1)

# Marital Status (MARITAL)

# Number of Children (CHILDREN)

# Veteran Status (VETERAN3)


#---------------------------------------#
#         SOCIOECONOMIC STATUS
#   Employment Status, Income
#   Education
#---------------------------------------#



#---------------------------------------#
#           HEALTH BEHAVIORS
#   Alcohol, BMI, Fruit & Vegetable Intake
#   HIV Risk, Influenza Vaccine,
#   Physical Activity, Smoking Status
#---------------------------------------#


#---------------------------------------#
#           HEALTH CARE
#   Doctor Cost, Health Care Coverage,
#   Time since last checkup,
#   Time since last dentist visit
#---------------------------------------#


#---------------------------------------#
#           HEALTH STATUS
#   Chronic Diseases,
#   Depressive Disorder,
#   Mental & Physcial Health HRQOL,
#   Self-Rated Health
#---------------------------------------#
